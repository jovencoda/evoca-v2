# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render

from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt

from rest_framework import status, permissions
from rest_framework import mixins, generics
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view
from django.contrib.gis.geos import Point

import json
import datetime
import string
import random

import time

from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser, FormParser, MultiPartParser

from models import *
from serializers import *
from core.models import *
from django.contrib.auth.models import User

class JSONResponse(HttpResponse):
    """
    An HttpResponse that renders its content into JSON.
    """
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json'
        super(JSONResponse, self).__init__(content, **kwargs)

def getChannelsFromProfile(profile):
    channels=Membership.objects.filter(user__username=profile)
    return channels

@csrf_exempt
def userToken(request, username):
    data = JSONParser().parse(request)
    if request.method == 'GET' or (data['type']=="login"):
        try:
            profile = User.objects.get(username=username)
        except Perfil.DoesNotExist:
            return HttpResponse(status=404)
        chs = getChannelsFromProfile(profile)
        cds_str='['
        cds_str+='{"name": "Default", "slug":"default" }'
        for c in chs:
            cds_str+=',{"name": "'+c.channel.name+'", "slug":"'+c.channel.slug+'" }'
        cds_str+=']'
        error = ''
        token = Token.objects.get(user__username=username)
        info= '{"username": "'+ profile.username + '", "token": "' + token + '", "error": "' + error + '", "channels": ' + cds_str + '}'
        js=json.loads(info)
        return JSONResponse(js)

    elif request.method == 'POST' or (data['type']=="singup"):

        userName = data['username']
        userPass = data['password']
        #userMail = request.REQUEST.get('email', None)
        userMail = ""
        info= '{}'

        # TODO: check if already existed
        if userName and userPass:
           u,created = User.objects.get_or_create(username=userName)
           if created:
              u.set_password(userPass)
              t = Token.objects.create(user=u)
              error = ''
              u.save()
              info= '{"username": "'+u.username+'","token":"'+t.key+'", "error": "'+error+'", "channels": [{"name": "Default", "slug":"default" }]}'
           else:
               info= '{"error": "Ya existe un usario con el nombre elegido."}'
              # user was retrieved
        else:
            info= '{"error": "No se llenaron todos los datos."}'
           # request was empty
        print(info)
        js=json.loads(info)
        return JSONResponse(js)


#--------------- REMOTE RECORDS ------------

@csrf_exempt
def record_list(request, channel, username):
    """
    List all records, or create a new record.
    """
    if request.method == 'GET':
		#queryset = Record.objects.all().order_by('created_at').filter(channel__uniqueID=channel_pk)
		#serializer = RecordSerializer(queryset, many=True)

        #----------------------------
        #---------- PENDING ---------
        #----------------------------

		queryset = Record.objects.all()
		serializer = RecordSerializer(queryset, many=True)
		return JSONResponse(serializer.data)

    elif request.method == 'POST':
        data = JSONParser().parse(request)
        #print(request)
        #print(data)
        #serializer = RecordSerializer(data=data)
        serializer = ReporteSerializer(data=data)
        #print(serializer.validate(data))
        #print(" --- ")
        ##print(serializer.is_valid())
        if serializer.is_valid():
            serializer.save()
            return JSONResponse(serializer.data, status=201)
        else :

            #rep=Reporte(hora= data['hora'], latitud=data['latitud'], fecha=data['fecha'], descripcion=data['descripcion'],  longitud=data['longitud'] )
            record = create_record(username, channel, Point(float(data['longitud']), float(data['latitud'])), data['fecha'], data['descripcion'])
            create_attachment(data['audio_url'], username, record, 3)
            create_attachment(data['img_url'], username, record, 0)

            return JSONResponse(data, status=201)
            #print (rep)
        #print(serializer)
        #print(serializer.data)
        return JSONResponse(serializer.errors, status=400)

# @csrf_exempt
# def record_detail(request, channel, username, pk):
#     """
#     Retrieve, update or delete a record.
#     """
#     try:
#         #rec = Record.objects.get(pk=pk)
# 		rec = Reporte.objects.get(pk=pk)
#     except Serie.DoesNotExist:
#         return HttpResponse(status=404)
#
# 	if request.method == 'GET':
# 	    #serializer = RecordSerializer(rec)
# 		serializer = ReporteSerializer(rec)
# 		return JSONResponse(serializer.data)
#
# 	elif request.method == 'PUT':
# 		data = JSONParser().parse(request)
# 		#serializer = RecordSerializer(rec, data=data)
# 		serializer = ReporteSerializer(rec, data=dcreate_attachmentata)
# 		if serializer.is_valid:
# 			serializer.save()
# 			return JSONResponse(serializer.data)
# 		return JSONResponse(serializer.errors, status=400)
#
# 	elif request.method == 'DELETE':
# 		rec.delete()
# 		return HttpResponse(status=204)


# # ------------ UPLOAD FILES ------------

class Upload_Image_View(mixins.ListModelMixin, mixins.CreateModelMixin, generics.GenericAPIView):
    parser_classes = (JSONParser, MultiPartParser, FormParser,)
    queryset = Imagen.objects.all()
    serializer_class = imagenSerializer

    def get(self, request, *args, **kwargs):
    	return self.list(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        # print("imagennnn")
        # return HttpResponse("asd")
        ch=self.kwargs["channel"]
        imgSer=imagenSerializer(data=request.data)
        file = request.FILES;
        imgURL="null"
        if imgSer.is_valid():
            imgSer.save()
            imgURL=imgSer.data["img"]
        else:
            im = Imagen(channel=ch, img=file['upload'])
            im.save();
            imgURL=im.img.url
        print(imgURL)
        return HttpResponse(imgURL)

class Upload_Audio_View(mixins.ListModelMixin, mixins.CreateModelMixin, generics.GenericAPIView):
    parser_classes = (JSONParser, MultiPartParser, FormParser,)
    queryset = Audio.objects.all()
    serializer_class = AudioSerializer

    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        ch=self.kwargs["channel"]
        audioSer = AudioSerializer(data=request.data)
        file = request.FILES;
        audioURL="null"
        if audioSer.is_valid():
            audioSer.save()
            audioURL=audioSer.data["audio"]
        else:
            au = Audio(channel=ch, audio=file['upload'])
            au.save();
            audioURL=au.audio.url
            print(audioURL)
            return HttpResponse(audioURL)

def create_record(author, channel, location, date, description):
    record = Record(location=location)
    record.author = User.objects.get(username=author)
    record.channel = Channel.objects.get(slug=channel)
    record.description = description
    record.save()
    record.updateCreationDate(date)
    return record

def create_attachment(url, author, record, content_type):
    attachment = Attachment(url=url, attachment_type=content_type)
    attachment.author = User.objects.get(username=author)
    attachment.related_record = record
    attachment.save()
