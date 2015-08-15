# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0004_dish_type_about'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dish',
            name='name',
            field=models.CharField(default=b'dish name', max_length=50, null=True, blank=True),
        ),
    ]
