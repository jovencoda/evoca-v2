# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.shortcuts import get_object_or_404
from django.views.generic import TemplateView
from rest_framework import viewsets, generics
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import AllowAny, IsAuthenticated
from django_filters.rest_framework import DjangoFilterBackend
from core.models import *
from core.serializers import *

# API VIEWS.

class ChannelAPIView(viewsets.ModelViewSet):
	permission_classes = (AllowAny,)
	queryset = Channel.objects.all().order_by('created_at')
	serializer_class = ChannelSerializer

	def list(self, request,):
		queryset = Channel.objects.all().order_by('created_at')
		serializer = ChannelSerializer(queryset, many=True)
		return Response(serializer.data)

	def retrieve(self, request, pk=None):
		queryset = Channel.objects.filter()
		channel = get_object_or_404(queryset, uniqueID=pk)
		serializer = ChannelSerializer(channel)
		return Response(serializer.data)

class RecordAPIView(viewsets.ViewSet):

	def list(self, request, channel_pk=None):
		queryset = Record.objects.all().order_by('created_at').filter(channel__uniqueID=channel_pk)
		serializer = RecordSerializer(queryset, many=True)
		return Response(serializer.data)

	def retrieve(self, request, pk=None, channel_pk=None):
		queryset = Record.objects.all().order_by('created_at').filter(uniqueID=pk, channel__uniqueID=channel_pk)
		record = get_object_or_404(queryset, uniqueID=pk)
		serializer = RecordFullSerializer(record)
		return Response(serializer.data)

class AttachmentAPIView(viewsets.ViewSet):
	serializer_class = AttachmentSerializer

	def list(self, request, channel_pk=None, records_pk=None):
		queryset = Attachment.objects.all().order_by('created_at').filter(related_record__uniqueID=records_pk)
		serializer = AttachmentSerializer(queryset, many=True)
		return Response(serializer.data)

	def retrieve(self, request, pk=None):
		queryset = Attachment.objects.filter(related_record__uniqueID=pk)
		attachment = get_object_or_404(queryset, related_record__uniqueID=pk)
		serializer = AttachmentSerializer(attachment)
		return Response(serializer.data)

class TagStatsAPIView(APIView):
	def get(self, request, channel_pk=None, format=None):
		queryset = Tag.objects.all().filter(related_channel__uniqueID=channel_pk)
		channel_tags_count = {}
		for tag in queryset:
			channel_tags_count[tag.slug] = Record.objects.all().filter(tags__slug=tag.slug).count()
		print(channel_tags_count)
		return Response(channel_tags_count)
