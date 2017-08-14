# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import uuid
from django.conf import settings
from django.db import models
from django.contrib.gis.db import models as modelsGIS
from django.contrib.gis.gdal import SpatialReference, CoordTransform
from django.contrib.auth.models import User
from django.template.defaultfilters import slugify
# Import GIS data
import googlemaps

# Available Models

class TimeBot(models.Model):
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)
	deleted_at = models.DateTimeField(blank=True, null=True)

	def updateCreationDate(self, date):
		self.created_at = date
		self.save()

	class Meta:
		abstract = True

class Dimension(models.Model):
	uniqueID = models.UUIDField(default=uuid.uuid4, editable=False)
	name = models.CharField(max_length=255)
	slug = models.SlugField(blank=True, null=True)

	def save(self, *args, **kwargs):
	    self.slug = slugify(self.name)
	    super(Dimension, self).save(*args, **kwargs)

	def __unicode__(self):
		return self.name

class Channel(TimeBot):
	uniqueID = models.UUIDField(default=uuid.uuid4, editable=False)
	name = models.CharField(max_length=255)
	slug = models.SlugField(blank=True, null=True)
	about = models.TextField(max_length=255, blank=True)
	members = models.ManyToManyField(User, through='Membership', through_fields=('channel', 'user'), related_name='channel_members')
	dimensions = models.ManyToManyField(Dimension, related_name='channel_dimensions', blank=True)

	def save(self, *args, **kwargs):
	    self.slug = slugify(self.name)
	    super(Channel, self).save(*args, **kwargs)

	def __unicode__(self):
		return self.name

class Membership(TimeBot):
    channel = models.ForeignKey(Channel)
    user = models.ForeignKey(User)

# ----------- RECORD ------------->

class Record(TimeBot):
	uniqueID = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
	author = models.ForeignKey(User, on_delete=models.CASCADE, related_name='record_author')
	channel = models.ForeignKey(Channel, on_delete=models.CASCADE, related_name='record_channel')
	location = modelsGIS.PointField(max_length=40, null=False)
	country = models.CharField(max_length=50, blank=True)
	region = models.CharField(max_length=50, blank=True)
	city = models.CharField(max_length=50, blank=True)
	postal_code = models.CharField(max_length=50, blank=True)
	neighborhood = models.CharField(max_length=50, blank=True)
	address = models.CharField(max_length=50, blank=True)
	description = models.TextField(max_length=255, blank=True)

	def save(self, *args, **kwargs):
		try:
			# Googlemaps data
			gmaps = googlemaps.Client(key=settings.GOOGLE_MAPS_ACCESS_TOKEN)
			data = gmaps.reverse_geocode((self.location.y, self.location.x))[0]['address_components']
			self.address = self.getWorldData(data, 'route') + " " + self.getWorldData(data, 'street_number')
			self.neighborhood = self.getWorldData(data, 'locality')
			self.city = self.getWorldData(data, 'administrative_area_level_2')
			self.region = self.getWorldData(data, 'administrative_area_level_1')
			self.country = self.getWorldData(data, 'country')
			self.postal_code = self.getWorldData(data, 'postal_code')
		except Exception as e:
			print(e)
			pass

		super(Record, self).save(*args, **kwargs)

	def getWorldData(self, data, type):
		result = ""
		for f in data:
			try:
				if(f['types'][0] == type):
					result =  f['long_name']
			except Exception as e:
				raise
		return result

	def transformToEPSG(self):
		ct = CoordTransform(SpatialReference(4326), SpatialReference(3857))
		print(self.location.transform(ct))
		return self.location.transform(ct)

	def getRawLocation(self):
		return str(self.location.x) + "," + str(self.location.y);

	def getAttachedImage(self):
		return Attachment.objects.values('url').filter(attachment_type=0).filter(related_record__uniqueID=self.uniqueID).first()

	def getAttachedAudio(self):
		return Attachment.objects.values('url').filter(attachment_type=3).filter(related_record__uniqueID=self.uniqueID).first()


	def __unicode__(self):
		return unicode(self.uniqueID)


# ----------- ATTACHMENTS ------------->

class Attachment(TimeBot):
	author = models.ForeignKey(User, on_delete=models.CASCADE, related_name='attachment_author')
	url = models.CharField(max_length=200, null=False)
	hashName = models.UUIDField(default=uuid.uuid4, editable=False)
	isActive = models.BooleanField(default=True)
	related_record = models.ForeignKey(Record, on_delete=models.CASCADE, null=False, related_name='related_record')

	# FIle type types
	ATTACHMENT_TYPE_CHOICES = (
	(0, 'image'),
	(1, 'video'),
	(2, 'file'),
	(3, 'sound'),
	)
	attachment_type = models.PositiveSmallIntegerField(default=0, choices=ATTACHMENT_TYPE_CHOICES)

	def __unicode__(self):
		return self.url


class ChannelType(models.Model):
	pass
