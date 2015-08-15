# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0006_auto_20150815_1348'),
    ]

    operations = [
        migrations.CreateModel(
            name='Dish_price',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('qty', models.CharField(max_length=50, blank=True)),
                ('price', models.IntegerField(default=0)),
                ('dish', models.ForeignKey(to='restaurants.Dish')),
            ],
        ),
        migrations.RemoveField(
            model_name='dish_price_type',
            name='dish',
        ),
        migrations.DeleteModel(
            name='Dish_price_type',
        ),
    ]
