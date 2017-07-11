
from django import template
from core.models import Channel

register = template.Library()

@register.filter(name='get_filtered_channels_list')
def get_filtered_channels_list(active):
    return Channel.objects.exclude(uniqueID=active.uniqueID)

@register.simple_tag(name='get_channels_list')
def get_channels_list():
    print(Channel.objects.all())
    return Channel.objects.all()
