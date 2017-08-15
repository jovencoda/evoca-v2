# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.shortcuts import get_object_or_404
from django.views.generic import TemplateView
from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.permissions import AllowAny, IsAuthenticated
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

class RecordAPIView(viewsets.ModelViewSet):
	queryset = Record.objects.all().order_by('created_at')
	serializer_class = RecordSerializer

	def list(self, request, channel_pk=None):
		queryset = Record.objects.all().order_by('created_at')
		serializer = RecordSerializer(queryset, many=True)
		return Response(serializer.data)

	def retrieve(self, request, pk=None, channel_pk=None):
		queryset = Record.objects.filter().order_by('created_at')
		ojoVozRecord = get_object_or_404(queryset, uniqueID=pk, channel=channel_pk)
		serializer = RecordSerializer(Record)
		return Response(serializer.data)
