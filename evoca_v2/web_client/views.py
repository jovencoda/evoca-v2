# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.views.generic import View, ListView
from django.shortcuts import render

# Import models
from core.models import Channel

class ChannelsListView(ListView):
    model = Channel
    template_name = 'index.html'
    def get_context_data(self, **kwargs):
        context = super(ChannelsListView, self).get_context_data(**kwargs)
        return context

class ChannelDetailView(View):
    def get(self, request):
        return render(request, "index.html")
