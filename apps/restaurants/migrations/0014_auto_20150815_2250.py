# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0013_dish_type_commonprice'),
    ]

    operations = [
        migrations.CreateModel(
            name='Dish_type_pricee',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=50, null=True, blank=True)),
                ('price', models.IntegerField(default=0)),
                ('vegOrNot', models.CharField(blank=b'True', max_length=1, choices=[(b'V', b'Veg'), (b'N', b'Non Veg'), (b'B', b'Both'), (b'D', b'Drinks'), (b'H', b'Hard Drinks')])),
                ('priceOf', models.ForeignKey(to='restaurants.Dish_type')),
            ],
        ),
        migrations.RemoveField(
            model_name='dish_type_price',
            name='priceOf',
        ),
        migrations.DeleteModel(
            name='Dish_type_price',
        ),
    ]
