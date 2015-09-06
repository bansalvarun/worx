# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0004_auto_20150906_1046'),
    ]

    operations = [
        migrations.AlterField(
            model_name='restaurant',
            name='album',
            field=models.CharField(help_text=b'Please give me the url from imgur album', max_length=100, blank=True),
        ),
        migrations.AlterField(
            model_name='restaurant',
            name='thumbnail',
            field=models.CharField(help_text=b'Please give me the url from imgur image resolution 25x25', max_length=100, blank=True),
        ),
    ]
