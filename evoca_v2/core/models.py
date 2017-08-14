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
from mapbox import Geocoder
from world.models import WorldBorder, VeredasColombia

# Available Models

class TimeBot(models.Model):
	created_at = models.DateTimeField(auto_now_add=True, editable=False)
	updated_at = models.DateTimeField(auto_now=True)
	deleted_at = models.DateTimeField(blank=True, null=True)

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
	description = models.TextField(max_length=255, blank=True)

	def save(self, *args, **kwargs):
		try:
			# Get Country, Region and City
			geocoder = Geocoder(access_token=settings.MAPBOX_ACCESS_TOKEN)
			response = geocoder.reverse(lon=self.location.x, lat=self.location.y)
			features = sorted(response.geojson()['features'], key=lambda x: x['place_name'])
			print(features)
			#print(features[0]['text'])
			self.city = features[0]['text']
			#self.region =
			#self.country =

			print(features[0]['context'][0])
			print(features[0]['context'][1])
			#_features.split(',')


			#self.country = WorldBorder.objects.get(mpoly__intersects=self.location).name
		except Exception as e:
			print(e)
		super(Record, self).save(*args, **kwargs)

	def transformToEPSG(self):
		ct = CoordTransform(SpatialReference(4326), SpatialReference(3857))
		print(self.location.transform(ct))
		return self.location.transform(ct)

	def getRawLocation(self):
		return str(self.location.x) + "," + str(self.location.y);

	def get_Attachments(self):
		return Attachment.objects.all().filter(related_record__uniqueID=self.uniqueID)

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
