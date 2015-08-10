from django.conf.urls import url
from apps.restaurants.views import *
urlpatterns = [
    url(r'^(\d+)/menu/$', menu),
    url(r'^$', restaurants),
    url(r'^cusines/', cusines),
    url(r'^localities/', localities),
    url(r'^establishments/', establishments),
    url(r'^search/', search),    
]
