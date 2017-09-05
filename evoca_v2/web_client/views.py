# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.views.generic import DetailView, ListView, TemplateView
from django.shortcuts import render
from datetime import datetime
import collections

# Import models
from core.models import Channel, Record, Tag
from django.contrib.auth.models import User

class ChannelsListView(ListView):
    model = Channel
    template_name = 'index.html'
    def get_context_data(self, **kwargs):
        context = super(ChannelsListView, self).get_context_data(**kwargs)
        return context

class RecordsMapView(TemplateView):
    template_name = 'record_map.html'

    def get_context_data(self, **kwargs):
        context = super(RecordsMapView, self).get_context_data(**kwargs)
        # Pass channel data to context
        context['active_channel_name'] = Channel.objects.get(slug=self.kwargs['channel']).name
        context['active_channel_slug'] = slug=self.kwargs['channel']
        return context

class RecordsListView(ListView):
    model = Record
    template_name = 'record_list.html'

    def orderQueryByDate(self, queryset):
        dates = []
        for s in queryset:
            _s = "" + str(s.created_at)
            k, v = _s.rsplit("-", 1)
            if(k not in dates):
                dates.append(k)
        response = collections.OrderedDict()
        iterator = iter(dates[::-1])
        for d in iterator:
            response[d] = queryset.filter(created_at__year=int(d[:4])).filter(created_at__month=int(d[5:])).order_by('created_at')
    	return response

    def getChannelUsers(self):
        queryset = Record.objects.all().filter(channel__slug=self.kwargs['channel'])
        response = []
        for s in queryset:
            user = User.objects.get(pk=s.author.pk).username
            if user not in response:
                response.append(user)
        return response

    def getChannelTags(self):
        queryset = Tag.objects.all().filter(related_channel__slug=self.kwargs['channel'])
        return queryset

    def get_queryset(self):
        queryset = super(RecordsListView, self).get_queryset().order_by('created_at').filter(channel__slug=self.kwargs['channel'])
        return self.orderQueryByDate(queryset)

    def get_context_data(self, **kwargs):
        context = super(RecordsListView, self).get_context_data(**kwargs)
        # Pass channel data to context
        context['active_channel_name'] = Channel.objects.get(slug=self.kwargs['channel']).name
        context['channel_users'] = self.getChannelUsers
        context['channel_tags'] = self.getChannelTags
        context['active_channel_slug'] = slug=self.kwargs['channel']
        context['filtered_by_user'] = "ninguno"
        context['filtered_by_tag'] = "ninguna"
        return context

class RecordsFilteredViewByUser(RecordsListView):
    def get_queryset(self):
        queryset = super(RecordsListView, self).get_queryset().order_by('created_at').filter(channel__slug=self.kwargs['channel']).filter(author__username=self.kwargs['user'])
        return self.orderQueryByDate(queryset)

    def get_context_data(self, **kwargs):
        context = super(RecordsListView, self).get_context_data(**kwargs)
        # Pass channel data to context
        context['active_channel_name'] = Channel.objects.get(slug=self.kwargs['channel']).name
        context['channel_users'] = self.getChannelUsers
        context['channel_tags'] = self.getChannelTags
        context['active_channel_slug'] = slug=self.kwargs['channel']
        context['filtered_by_user'] = self.kwargs['user']
        context['filtered_by_tag'] = "ninguna"
        return context

class RecordsFilteredViewByTag(RecordsListView):
    def get_queryset(self):
        queryset = super(RecordsListView, self).get_queryset().order_by('created_at').filter(channel__slug=self.kwargs['channel']).filter(tags__slug=self.kwargs['tag'])
        return self.orderQueryByDate(queryset)

    def get_context_data(self, **kwargs):
        context = super(RecordsListView, self).get_context_data(**kwargs)
        # Pass channel data to context
        context['active_channel_name'] = Channel.objects.get(slug=self.kwargs['channel']).name
        context['channel_users'] = self.getChannelUsers
        context['channel_tags'] = self.getChannelTags
        context['active_channel_slug'] = slug=self.kwargs['channel']
        context['filtered_by_tag'] = self.kwargs['tag']
        context['filtered_by_user'] = "ninguno"
        return context
