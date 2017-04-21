# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from core.models import *

# Register your models here.
admin.site.register(Channel)
admin.site.register(Dimension)
admin.site.register(ChannelType)

class RecordAdmin(admin.ModelAdmin):
	list_display = ('uniqueID', 'author', 'channel', 'created_at', 'updated_at', 'location' )
	list_display_links = ('uniqueID',)
	search_fields = ('uniqueID',)
	list_per_page = 50

admin.site.register(OjovozRecord, RecordAdmin)

