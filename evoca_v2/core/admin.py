# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from django.contrib.gis import admin as geoAdmin
from core.models import *
from world.models import WorldBorder, VeredasColombia

# Register your models here.
#admin.site.register(Dimension)
admin.site.register(Tag)
#admin.site.register(ChannelType)
admin.site.register(Attachment)
admin.site.register(WorldBorder, geoAdmin.OSMGeoAdmin)
admin.site.register(VeredasColombia, geoAdmin.OSMGeoAdmin)

class MembershipAdmin(admin.ModelAdmin):
	list_display = ('channel', 'user', 'created_at', 'updated_at' )
	list_per_page = 50

admin.site.register(Membership, MembershipAdmin)

class ChannelAdmin(admin.ModelAdmin):
	list_display = ('id', 'uniqueID', 'name', 'about', 'created_at', 'updated_at' )
	list_display_links = ('uniqueID',)
	search_fields = ('uniqueID',)
	list_per_page = 50

admin.site.register(Channel, ChannelAdmin)

class RecordAdmin(geoAdmin.OSMGeoAdmin):
	list_display = ('author', 'channel', 'uniqueID', 'created_at', 'updated_at', 'location' )
	list_display_links = ('uniqueID',)
	search_fields = ('uniqueID',)
	list_per_page = 50

admin.site.register(Record, RecordAdmin)
