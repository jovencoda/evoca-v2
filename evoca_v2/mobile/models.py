# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

def directory_path(self, filename):
    return 'media/{channel}/{filename}'.format(channel=self.channel, filename=filename)

class Imagen(models.Model):
    channel = models.CharField(max_length=255, default="default")
    img = models.ImageField(upload_to = directory_path)
    def __str__(self):
        return str(self.channel +": " +self.img.name)

class Audio(models.Model):
    channel = models.CharField(max_length=255, default="default")
    audio = models.FileField(upload_to = directory_path)

    def __str__(self):
        return str(self.channel +": " +self.audio.name)
