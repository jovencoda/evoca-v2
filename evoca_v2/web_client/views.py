# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.views.generic import DetailView, ListView
from django.shortcuts import render
from datetime import datetime
import collections

# Import models
from core.models import Channel, Record

class ChannelsListView(ListView):
    model = Channel
    template_name = 'index.html'
    def get_context_data(self, **kwargs):
        context = super(ChannelsListView, self).get_context_data(**kwargs)
        return context

class RecordsListView(ListView):
    model = Record
    template_name = 'record_list.html'

    def getScopeYears(self, queryset):
        dates = []
        for s in queryset:
            _s = "" + str(s.created_at)
            k, v = _s.rsplit("-", 1)
            if(k not in dates):
                dates.append(k)
        response = collections.OrderedDict()
        iterator = iter(dates[::-1])
        for d in iterator:
            response[d] = Record.objects.all().filter(created_at__year=int(d[:4])).filter(created_at__month=int(d[5:]))

    	return response

    def get_queryset(self):
        queryset = super(RecordsListView, self).get_queryset().order_by('created_at').filter(channel__slug=self.kwargs['channel'])

        return self.getScopeYears(queryset)

    def get_context_data(self, **kwargs):
        context = super(RecordsListView, self).get_context_data(**kwargs)
        # Pass channel data to context
        context['active_channel_name'] = Channel.objects.get(slug=self.kwargs['channel']).name
        context['active_channel_slug'] = slug=self.kwargs['channel']
        return context
