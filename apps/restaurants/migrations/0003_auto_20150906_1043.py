# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0002_dish_type_about'),
    ]

    operations = [
        migrations.RenameField(
            model_name='restaurant',
            old_name='any_other_tax',
            new_name='service_tax_hardDrinks',
        ),
        migrations.RemoveField(
            model_name='restaurant',
            name='discount',
        ),
        migrations.RemoveField(
            model_name='restaurant',
            name='service_tax',
        ),
        migrations.AddField(
            model_name='restaurant',
            name='album',
            field=models.CharField(max_length=100, blank=True),
        ),
        migrations.AddField(
            model_name='restaurant',
            name='coverpic',
            field=models.CharField(max_length=100, blank=True),
        ),
        migrations.AddField(
            model_name='restaurant',
            name='thumbnail',
            field=models.CharField(max_length=100, blank=True),
        ),
    ]
