# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0016_remove_dish_type_commonprice'),
    ]

    operations = [
        migrations.AddField(
            model_name='dish_type',
            name='commonPrice',
            field=models.BooleanField(default=False),
        ),
    ]
