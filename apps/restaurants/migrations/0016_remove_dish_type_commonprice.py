# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0015_auto_20150815_2254'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='dish_type',
            name='commonPrice',
        ),
    ]
