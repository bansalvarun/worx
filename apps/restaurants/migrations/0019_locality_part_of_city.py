# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0018_auto_20150817_0112'),
    ]

    operations = [
        migrations.AddField(
            model_name='locality',
            name='part_of_city',
            field=models.CharField(default=b'East Delhi', max_length=50),
        ),
    ]
