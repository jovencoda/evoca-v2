
from rest_framework import serializers as serial
from models import *
from core.models import *

class RecordSerializer(serial.ModelSerializer):
	img_url = serializers.CharField()
	audio_url = serializers.CharField()
	class Meta:
		model = Record
		fields = ('pk', 'img_url',	'audio_url', 'descripcion',	'fecha', 'hora', 'latitud',	'longitud')

class imagenSerializer(serial.ModelSerializer):
    class Meta:
        model = Imagen
        fields = ('pk','img', 'channel')

class AudioSerializer(serial.ModelSerializer):
    class Meta:
        model = Audio
        fields = ('pk', 'audio', 'channel')
