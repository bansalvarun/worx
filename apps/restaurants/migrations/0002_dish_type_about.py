# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='dish_type',
            name='about',
            field=models.CharField(max_length=100, null=True, blank=True),
        ),
    ]
