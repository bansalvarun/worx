"""
Django settings for worx project.

Generated by 'django-admin startproject' using Django 1.8.3.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.8/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
import dj_database_url
from settings_db import *
from settings_secret import *
# for bootstrap_admin
# from django.conf import global_settings

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.8/howto/deployment/checklist/


# SECURITY WARNING: don't run with debug turned on in production!

# DEBUG = False
ALLOWED_HOSTS = ['*']
#TEMPLATE_DEBUG = DEBUG


# Application definition

INSTALLED_APPS = (
    'suit',
    # 'adminplus',
    # 'grappelli',
    # 'bootstrap_admin',
    # 'django_admin_bootstrapped',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sites',
    'nested_inline',
    'allauth',
    'allauth.account',
    'allauth.socialaccount',
    'allauth.socialaccount.providers.facebook',
    'allauth.socialaccount.providers.google',


    'apps.restaurants',
    
    # 'apps.people',
)


SITE_ID = 1

MIDDLEWARE_CLASSES = (
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',

)

ROOT_URLCONF = 'worx.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                
# for bootstrap_admin
                # 'django.template.context_processors.i18n',
                # 'django.template.context_processors.media',
                # 'django.template.context_processors.static',
                # 'django.template.context_processors.tz',
                # 'django.template.context_processors.request',
            ],
        },
    },
]
# BOOTSTRAP_ADMIN_SIDEBAR_MENU = True
AUTHENTICATION_BACKENDS = (
    
    # Needed to login by username in Django admin, regardless of `allauth`
    'django.contrib.auth.backends.ModelBackend',

    # `allauth` specific authentication methods, such as login by e-mail
    'allauth.account.auth_backends.AuthenticationBackend',
    
)

WSGI_APPLICATION = 'worx.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.8/ref/settings/#databases



# Internationalization
# https://docs.djangoproject.com/en/1.8/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'Asia/Kolkata'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.8/howto/static-files/

# STATIC_URL = '/static/'
STATIC_URL = '/staticfiles/'
STATIC_ROOT = '/staticfiles/'
STATICFILES_DIRS = (
	os.path.join(BASE_DIR, "staticfiles"),
)


MEDIA_ROOT = os.path.join(BASE_DIR, 'staticfiles/')


SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

# LOGIN_URL          = '#'
LOGIN_REDIRECT_URL = '/'
# LOGOUT_URL  = '#'

# LOGOUT_REDIRECT_URL = '#'
ACCOUNT_LOGOUT_ON_GET =True

SOCIALACCOUNT_PROVIDERS = \
    {'facebook':
       {'METHOD': 'oauth2',
        'SCOPE': ['email', 'public_profile', 'user_friends', 'publish_stream'],
        'AUTH_PARAMS': {'auth_type': 'reauthenticate'},
        'FIELDS': [
            'id',
            'email',
            'name',
            'first_name',
            'last_name',
            'verified',
            'locale',
            'timezone',
            'link',
            'gender',
            'updated_time'],
        'EXCHANGE_TOKEN': True,
        'LOCALE_FUNC': 'path.to.callable',
        'VERIFIED_EMAIL': False,
        'VERSION': 'v2.4'}}


SOCIALACCOUNT_PROVIDERS = \
    { 'facebook':
        { 'LOCALE_FUNC': lambda request: 'en_US'} }

SUIT_CONFIG = {
    'ADMIN_NAME': 'worx.',
    'CONFIRM_UNSAVED_CHANGES': True,
    'MENU_EXCLUDE': ('SEARCH_URL',),
}
