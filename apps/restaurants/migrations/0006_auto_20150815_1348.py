# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0005_auto_20150815_1348'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dish_type',
            name='about',
            field=models.CharField(max_length=400, null=True, blank=True),
        ),
    ]
