# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0008_auto_20150906_1125'),
    ]

    operations = [
        migrations.AlterField(
            model_name='restaurant',
            name='coverpic',
            field=models.CharField(help_text=b"Please give me the 'Direct Link (email & IM)' from imgur image resolution 1600X900", max_length=100, blank=True),
        ),
        migrations.AlterField(
            model_name='restaurant',
            name='thumbnail',
            field=models.CharField(help_text=b"Please give me the 'Direct Link (email & IM)' from imgur image resolution 25x25", max_length=100, blank=True),
        ),
    ]
