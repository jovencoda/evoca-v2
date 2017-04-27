# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.shortcuts import get_object_or_404
from rest_framework import viewsets
from rest_framework.response import Response
from core.models import *
from core.serializers import *

# API VIEWS.

class ChannelAPIView(viewsets.ModelViewSet):
	queryset = Channel.objects.all().order_by('created_at')
	serializer_class = ChannelSerializer

	def list(self, request,):
		queryset = Channel.objects.all()
		serializer = ChannelSerializer(queryset, many=True)
		return Response(serializer.data)

	def retrieve(self, request, pk=None):
		queryset = Channel.objects.filter()
		channel = get_object_or_404(queryset, id=pk)
		serializer = ChannelSerializer(channel)
		return Response(serializer.data)

class OjoVozRecordAPIView(viewsets.ModelViewSet):
	queryset = OjovozRecord.objects.all().order_by('created_at')
	serializer_class = OjovozRecordSerializer

	def list(self, request, channel_pk=None):
		queryset = OjovozRecord.objects.all()
		serializer = OjovozRecordSerializer(queryset, many=True)
		return Response(serializer.data)

	def retrieve(self, request, pk=None, channel_pk=None):
		queryset = OjovozRecord.objects.filter()
		ojoVozRecord = get_object_or_404(queryset, uniqueID=pk, channel=channel_pk)
		serializer = OjovozRecordSerializer(ojoVozRecord)
		return Response(serializer.data)
