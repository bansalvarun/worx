# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0005_auto_20150906_1047'),
    ]

    operations = [
        migrations.AlterField(
            model_name='restaurant',
            name='album',
            field=models.CharField(help_text=b'upload album to imgur.com -> embed Code -> Use old embed Code -> light -> copy and paste', max_length=300, blank=True),
        ),
    ]
