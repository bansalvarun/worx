import os
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATABASES = {
#    'default': {
 #       'ENGINE': 'django.db.backends.sqlite3',
 #       'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
 #   }
     'default': {
         'ENGINE': 'django.db.backends.mysql',
         'NAME': 'worx',
         'USER': 'varun',
         'PASSWORD': 'lenovo',
         'HOST': 'localhost',
         'PORT':'',
     }    
}
