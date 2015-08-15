# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0007_auto_20150815_2209'),
    ]

    operations = [
        migrations.CreateModel(
            name='Dish_type_price',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=50, null=True, blank=True)),
                ('price', models.IntegerField(default=0)),
                ('vegOrNot', models.CharField(blank=b'True', max_length=1, choices=[(b'V', b'Veg'), (b'N', b'Non Veg'), (b'B', b'Both'), (b'D', b'Drinks'), (b'H', b'Hard Drinks')])),
            ],
        ),
        migrations.RemoveField(
            model_name='dish',
            name='vegOrNot',
        ),
        migrations.AddField(
            model_name='dish_price',
            name='vegOrNot',
            field=models.CharField(blank=b'True', max_length=1, choices=[(b'V', b'Veg'), (b'N', b'Non Veg'), (b'B', b'Both Veg and Non Veg'), (b'D', b'Drink')]),
        ),
        migrations.AddField(
            model_name='dish_type',
            name='commonPrice',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='dish_price',
            name='price',
            field=models.IntegerField(default=0, blank=True),
        ),
        migrations.AddField(
            model_name='dish_type_price',
            name='priceOf',
            field=models.ForeignKey(to='restaurants.Dish_type'),
        ),
    ]
