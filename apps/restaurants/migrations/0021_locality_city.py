# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0020_auto_20150817_2316'),
    ]

    operations = [
        migrations.AddField(
            model_name='locality',
            name='city',
            field=models.ForeignKey(blank=True, to='restaurants.City', null=True),
        ),
    ]
