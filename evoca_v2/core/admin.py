# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from core.models import *

# Register your models here.
admin.site.register(Dimension)
admin.site.register(ChannelType)

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

class RecordAdmin(admin.ModelAdmin):
	list_display = ('uniqueID', 'author', 'channel', 'created_at', 'updated_at', 'location' )
	list_display_links = ('uniqueID',)
	search_fields = ('uniqueID',)
	list_per_page = 50

admin.site.register(OjovozRecord, RecordAdmin)

