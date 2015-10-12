# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='Cuisine',
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
                ('name', models.CharField(default=b'dish name', max_length=50, null=True, blank=True)),
                ('about', models.CharField(max_length=100, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Dish_price',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('qty_or_name', models.CharField(max_length=50, blank=True)),
                ('price', models.FloatField(default=0, blank=True)),
                ('vegOrNot', models.CharField(blank=b'True', max_length=1, choices=[(b'V', b'Veg'), (b'N', b'Non Veg'), (b'B', b'Both Veg and Non Veg'), (b'D', b'Drink')])),
                ('dish', models.ForeignKey(blank=True, to='restaurants.Dish', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Dish_type',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(default=b'dish type name', max_length=30)),
                ('about', models.CharField(max_length=100, null=True, blank=True)),
                ('vegOrNot', models.CharField(blank=b'True', max_length=1, choices=[(b'V', b'Veg'), (b'N', b'Non Veg'), (b'B', b'Both'), (b'D', b'Drinks'), (b'H', b'Hard Drinks')])),
            ],
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
                ('part_of_city', models.CharField(default=b'East Delhi', max_length=50)),
                ('area', models.CharField(max_length=30)),
                ('city', models.ForeignKey(blank=True, to='restaurants.City', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Notifications',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=100)),
                ('about', models.TextField()),
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
                ('enable', models.BooleanField(default=False)),
                ('name', models.CharField(default=b'Restaurant name', max_length=50)),
                ('about', models.CharField(max_length=500, blank=True)),
                ('facebook', models.CharField(max_length=100, blank=True)),
                ('address', models.CharField(max_length=300, blank=True)),
                ('phone', models.CharField(max_length=13, blank=True)),
                ('coverpic', models.CharField(help_text=b"Please give me the 'Direct Link (email & IM)' from imgur image resolution 1600X900", max_length=100, blank=True)),
                ('thumbnail', models.CharField(help_text=b"Please give me the 'Direct Link (email & IM)' from imgur image resolution 25x25", max_length=100, blank=True)),
                ('album', models.CharField(help_text=b"upload album to imgur.com -> from album url,say 'http://imgur.com/a/mJ4Jf#0' -> get 'a/mJ4Jf' ", max_length=300, blank=True)),
                ('service_charge', models.FloatField(null=True, blank=True)),
                ('service_tax_food', models.FloatField(null=True, blank=True)),
                ('service_tax_drinks', models.FloatField(null=True, blank=True)),
                ('service_tax_hardDrinks', models.FloatField(null=True, blank=True)),
                ('vat', models.FloatField(null=True, blank=True)),
                ('cuisines', models.ManyToManyField(to='restaurants.Cuisine', blank=True)),
                ('establishment', models.ManyToManyField(to='restaurants.Establishment', blank=True)),
                ('locality', models.ForeignKey(to='restaurants.Locality', blank=True)),
            ],
        ),
        migrations.AddField(
            model_name='notifications',
            name='restaurant',
            field=models.ForeignKey(to='restaurants.Restaurant'),
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
            field=models.ManyToManyField(related_name='dislike', to=settings.AUTH_USER_MODEL, blank=True),
        ),
        migrations.AddField(
            model_name='dish',
            name='userUpVotes',
            field=models.ManyToManyField(related_name='likes', to=settings.AUTH_USER_MODEL, blank=True),
        ),
    ]
