
from rest_framework import serializers as serial
from models import *
from core.models import *

class RecordSerializer(serial.ModelSerializer):
	img_url = serial.SerializerMethodField()
	audio_url = serial.SerializerMethodField()
	hora = serial.SerializerMethodField(method_name=None)
	fecha = serial.SerializerMethodField(method_name=None)
	latitud = serial.SerializerMethodField(method_name=None)
	longitud = serial.SerializerMethodField(method_name=None)
	#latitud = serial.DecimalField(max_digits=40, decimal_places=30)
	#longitud = serial.DecimalField(max_digits=40, decimal_places=30)
	class Meta:
		model = Record
		fields = ('pk', 'img_url',	'audio_url', 'description',	'fecha', 'hora', 'latitud',	'longitud')

	def get_img_url(self, obj):
		atts = Attachment.objects.filter(related_record=obj).filter(attachment_type=3)
		url ='none'
		if len(atts) > 0:
			url = atts[0].url
		return url
	def get_audio_url(self, obj):
		atts = Attachment.objects.filter(related_record=obj).filter(attachment_type=3)
		url ='none'
		if len(atts) > 0:
			url = atts[0].url
		return url


class imagenSerializer(serial.ModelSerializer):
    class Meta:
        model = Imagen
        fields = ('pk','img', 'channel')

class AudioSerializer(serial.ModelSerializer):
    class Meta:
        model = Audio
        fields = ('pk', 'audio', 'channel')
