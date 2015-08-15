# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0003_auto_20150815_0915'),
    ]

    operations = [
        migrations.AddField(
            model_name='dish_type',
            name='about',
            field=models.CharField(max_length=400, blank=True),
        ),
    ]
