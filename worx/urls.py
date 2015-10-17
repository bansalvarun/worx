"""worx URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""

from django.conf.urls import include, url
from django.contrib import admin
from apps.restaurants.urls import url
from apps.restaurants.views import menu2, splitBill
from views import *
from django.conf import settings
from django.views.static import serve
from allauth.urls import *
# from django.contrib.staticfiles.urls import staticfiles_urlpatterns
# urlpatterns += staticfiles_urlpatterns()
handler404= 'worx.views.error404'
urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^accounts/', include('allauth.urls')),
    # url(r'^accounts/login/', login),
    # url(r'^accounts/logout/', logout),
    url(r'^splitBill/', splitBill),    
    url(r'^restaurants/', include('apps.restaurants.urls')),
    url(r'^loaderio-478d2141c8b3b653e6190dcff0b4518c/', loaderVerify),
#    url(r'^abc/', menu2),
    url(r'^(?P<url>.+)/$', menu2),
    url(r'^404/$', error404),
    url(r'^$', home),
    url(r'^profile/$', profile),
    url(r'^grappelli/', include('grappelli.urls')),
]


