"""evoca_v2 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from rest_framework.routers import SimpleRouter
from rest_framework_nested import routers
from rest_framework.authtoken import views

from django.conf import settings
from django.conf.urls.static import static

from core.views import *
from web_client.views import *
from mobile import views as mobile
from mobile.views import *

# ------ API First level routing ------

router = SimpleRouter()
router.register(r'channel', ChannelAPIView)

# ------ API Second level routing ------

channel_router = routers.NestedSimpleRouter(router, r'channel', lookup='channel')
channel_router.register(r'records', RecordAPIView, base_name='channel-records')

record_router = routers.NestedSimpleRouter(channel_router, r'records', lookup='records')
record_router.register(r'attachments', AttachmentAPIView, base_name='record-attachments')


urlpatterns = [
    url(r'^admin/', admin.site.urls),
	url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
	url(r'^api-token-auth/', views.obtain_auth_token),
	url(r'^api/v1/', include(router.urls)),
	url(r'^api/v1/', include(channel_router.urls)),
    url(r'^api/v1/', include(record_router.urls)),
    url(r'^api/v1/channel/(?P<channel_pk>[^/.]+)/tags/$', TagStatsAPIView.as_view(), name='channel-tags-view'),
    url(r'^api/v1/channel/(?P<channel_pk>[^/.]+)/time/$', TimeStatsAPIView.as_view(), name='channel-time-view'),

    # ----------- Web-Client URLS ---------

    url(r'^$', ChannelsListView.as_view(), name='channel-view'),
    url(r'^(?P<channel>[-_\w]+)/$', RecordsListView.as_view(), name='records-list-view'),
    url(r'^(?P<channel>[-_\w]+)/map/$', RecordsMapView.as_view(), name='records-map-view'),
    url(r'^(?P<channel>[-_\w]+)/stats/$', RecordsStatsView.as_view(), name='records-stats-view'),
    url(r'^(?P<channel>[-_\w]+)/user/(?P<user>[-_\w]+)/$', RecordsFilteredViewByUser.as_view(), name='records-list-view-user'),
    url(r'^(?P<channel>[-_\w]+)/tag/(?P<tag>[-_\w]+)/$', RecordsFilteredViewByTag.as_view(), name='records-list-view-tag'),

    # ----------- Mobile URLS ---------

    url(r'^api/v1/user_token/(?P<username>[-_\w]+)/$', mobile.userToken, name='user_token'),
    url(r'^api/v1/channel/(?P<channel>[-_\w]+)/(?P<username>[-_\w]+)/upload_audio/$', Upload_Audio_View.as_view(), name='upload_audio'),
    url(r'^api/v1/channel/(?P<channel>[-_\w]+)/(?P<username>[-_\w]+)/upload_image/$', Upload_Image_View.as_view(), name='upload_image'),
    #url(r'^api/v1/channel/(?P<channel>[-_\w]+)/(?P<username>[-_\w]+)/(?P<pk>[0-9]+)/record/$', views.record_detail, name='record'),
    url(r'^api/v1/channel/(?P<channel>[-_\w]+)/(?P<username>[-_\w]+)/record_list/$', mobile.record_list, name='record_list')


]+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
