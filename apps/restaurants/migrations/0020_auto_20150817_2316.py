# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0019_locality_part_of_city'),
    ]

    operations = [
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=30)),
            ],
        ),
        migrations.RemoveField(
            model_name='locality',
            name='city',
        ),
        migrations.AddField(
            model_name='restaurant',
            name='city',
            field=models.ForeignKey(blank=True, to='restaurants.City', null=True),
        ),
    ]
