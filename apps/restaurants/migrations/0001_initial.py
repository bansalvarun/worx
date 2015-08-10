# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
import apps.restaurants.models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Cusine',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=30)),
                ('image', models.ImageField(null=b'True', upload_to=b'upload_file_name', blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Dish',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=b'dish name', max_length=50)),
                ('about', models.CharField(max_length=100, blank=True)),
                ('vegOrNot', models.CharField(blank=b'True', max_length=1, choices=[(b'V', b'Veg'), (b'N', b'Non Veg'), (b'B', b'Both Veg and Non Veg'), (b'D', b'Drink')])),
            ],
            options={
                'ordering': ('name',),
            },
        ),
        migrations.CreateModel(
            name='Dish_price_type',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('qty', models.CharField(max_length=50, blank=True)),
                ('price', models.IntegerField(default=0)),
                ('dish', models.ForeignKey(to='restaurants.Dish')),
            ],
        ),
        migrations.CreateModel(
            name='Dish_type',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=b'dish type name', max_length=30)),
                ('vegOrNot', models.CharField(blank=b'True', max_length=1, choices=[(b'V', b'Veg'), (b'N', b'Non Veg'), (b'B', b'Both'), (b'D', b'Drinks'), (b'H', b'Hard Drinks')])),
                ('num_of_price_types', models.IntegerField(default=1)),
            ],
            options={
                'ordering': ('name',),
            },
        ),
        migrations.CreateModel(
            name='Establishment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Locality',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('city', models.CharField(max_length=30)),
                ('area', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('user', models.OneToOneField(related_name='profile', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Restaurant',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('enable', models.BooleanField(default=True)),
                ('name', models.CharField(default=b'Restaurant name', max_length=50)),
                ('about', models.CharField(max_length=500, blank=True)),
                ('address', models.CharField(max_length=300, blank=True)),
                ('phone', models.CharField(max_length=13, blank=True)),
                ('url', models.CharField(default=b'restaurant_name_area_no_space', unique=True, max_length=30, blank=True)),
                ('image', models.ImageField(null=True, upload_to=apps.restaurants.models.upload_file_name, blank=True)),
                ('service_charge', models.IntegerField(null=True, blank=True)),
                ('service_tax', models.IntegerField(null=True, blank=True)),
                ('service_tax_food', models.IntegerField(null=True, blank=True)),
                ('service_tax_drinks', models.IntegerField(null=True, blank=True)),
                ('vat', models.IntegerField(null=True, blank=True)),
                ('any_other_tax', models.IntegerField(null=True, blank=True)),
                ('discount', models.IntegerField(null=True, blank=True)),
                ('cusines', models.ManyToManyField(to='restaurants.Cusine', blank=True)),
                ('establishment', models.ManyToManyField(to='restaurants.Establishment', blank=True)),
                ('locality', models.ForeignKey(to='restaurants.Locality', blank=True)),
            ],
        ),
        migrations.AddField(
            model_name='dish_type',
            name='restaurant',
            field=models.ForeignKey(to='restaurants.Restaurant'),
        ),
        migrations.AddField(
            model_name='dish',
            name='dish_type',
            field=models.ForeignKey(to='restaurants.Dish_type'),
        ),
        migrations.AddField(
            model_name='dish',
            name='userDownVotes',
            field=models.ManyToManyField(related_name='dislike', to='restaurants.Profile', blank=True),
        ),
        migrations.AddField(
            model_name='dish',
            name='userUpVotes',
            field=models.ManyToManyField(related_name='likes', to='restaurants.Profile', blank=True),
        ),
    ]
