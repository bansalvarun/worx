# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0017_dish_type_commonprice'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dish_type_pricee',
            name='price',
            field=models.IntegerField(default=0, null=True, blank=True),
        ),
    ]
