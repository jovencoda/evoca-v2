# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.views.generic import DetailView, ListView
from django.shortcuts import render

# Import models
from core.models import Channel, OjovozRecord

class ChannelsListView(ListView):
    model = Channel
    template_name = 'index.html'
    def get_context_data(self, **kwargs):
        context = super(ChannelsListView, self).get_context_data(**kwargs)
        return context

class RecordsListView(ListView):
    model = OjovozRecord
    template_name = 'record_list.html'

    def get_queryset(self):
        queryset = super(RecordsListView, self).get_queryset()
        return queryset.filter(channel__slug=self.kwargs['channel'])

    def get_context_data(self, **kwargs):
        context = super(RecordsListView, self).get_context_data(**kwargs)
        # Pass channel data to context
        context['active_channel_name'] = Channel.objects.get(slug=self.kwargs['channel']).name
        context['active_channel_slug'] = slug=self.kwargs['channel']
        return context
