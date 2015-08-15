# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0014_auto_20150815_2250'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dish_price',
            name='dish',
            field=models.ForeignKey(blank=True, to='restaurants.Dish', null=True),
        ),
        migrations.AlterField(
            model_name='dish_type_pricee',
            name='priceOf',
            field=models.ForeignKey(blank=True, to='restaurants.Dish_type', null=True),
        ),
    ]
