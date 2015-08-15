from django.conf.urls import url
from apps.restaurants.views import *
urlpatterns = [
    url(r'^(\d+)/menu/$', menu),
    url(r'^$', restaurants),
    url(r'^cuisines/', cuisines),
    url(r'^localities/', localities),
    url(r'^establishments/', establishments),
    url(r'^search/', search),    
]
