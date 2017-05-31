
from rest_framework import serializers as serial
from core.models import *

class ChannelSerializer(serial.ModelSerializer):

	class Meta:
		model = Channel
		fields = ('name', 'about', 'dimensions', 'created_at', 'updated_at')
		read_only_fields = ('created_at', 'updated_at',)

class OjovozRecordSerializer(serial.ModelSerializer):

	class Meta:
		model = OjovozRecord
		fields = ('uniqueID', 'author', 'channel', 'location', 'about', 'image', 'created_at', 'updated_at', )
		read_only_fields = ('created_at', 'updated_at',)
