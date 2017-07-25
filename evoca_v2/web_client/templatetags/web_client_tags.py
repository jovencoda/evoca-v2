
from django import template

from django.template.defaultfilters import stringfilter
from django.utils.safestring import mark_safe
from hashlib import md5

from core.models import Channel

register = template.Library()

@register.filter(name='get_filtered_channels_list')
def get_filtered_channels_list(active):
    return Channel.objects.exclude(uniqueID=active.uniqueID)

@register.simple_tag(name='get_channels_list')
def get_channels_list():
    print(Channel.objects.all())
    return Channel.objects.all()

# Flavatar from @aleksig https://github.com/aleksisg/django-flavatar
@register.filter(is_safe=True)
@stringfilter
def flavatar(value):
    fistchar = value[:1].upper()
    value = value.encode('utf-8')
    hash = md5(value).hexdigest()
    hash_values = (hash[:8], hash[8:16], hash[16:24])
    number = tuple(int(value, 16)%256 for value in hash_values)
    return mark_safe('<div class="label flavatar" style="background: rgb%s;">%s</div>' % (number, fistchar))
