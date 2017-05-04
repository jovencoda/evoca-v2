# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import uuid
from django.db import models
from django.contrib.gis.db import models as modelsGIS
from django.contrib.auth.models import User

# Available Models

class TimeBot(models.Model):

	created_at = models.DateTimeField(auto_now_add=True, editable=False)
	updated_at = models.DateTimeField(auto_now=True)
	deleted_at = models.DateTimeField(blank=True, null=True)

	class Meta:
		abstract = True

class Channel(TimeBot):
	uniqueID = models.UUIDField(default=uuid.uuid4, editable=False)
	name = models.CharField(max_length=255)
	about = models.TextField(max_length=255, blank=True)
	members = models.ManyToManyField(User, through='Membership', through_fields=('channel', 'user'), related_name='channel_members')

	def __unicode__(self):
		return self.name

class Membership(TimeBot):
    channel = models.ForeignKey(Channel)
    user = models.ForeignKey(User)


class Record(TimeBot):
	uniqueID = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
	author = models.ForeignKey(User, on_delete=models.CASCADE, related_name='record_author')
	channel = models.ForeignKey(Channel, on_delete=models.CASCADE, related_name='record_channel')
	location = modelsGIS.PointField(max_length=40, null=False)

	class Meta:
		abstract = True

	def __unicode__(self):
		return unicode(self.uniqueID)

# ----------- RECORD TYPES ------------->

# Default record type, from Ojovoz App
class OjovozRecord(Record):
	about = models.TextField(max_length=255, blank=False)
	image = models.ImageField(upload_to='attachments/img/%Y/%m/%d/', null=False, max_length=255)

# ----------- END RECORD TYPES ------------->

class Dimension(models.Model):
	pass

class ChannelType(models.Model):
	pass






