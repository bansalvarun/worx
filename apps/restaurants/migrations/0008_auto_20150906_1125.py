# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0007_auto_20150906_1125'),
    ]

    operations = [
        migrations.AlterField(
            model_name='restaurant',
            name='album',
            field=models.CharField(help_text=b"upload album to imgur.com -> from album url,say 'http://imgur.com/a/mJ4Jf#0' -> get 'a/mJ4Jf' ", max_length=300, blank=True),
        ),
    ]
