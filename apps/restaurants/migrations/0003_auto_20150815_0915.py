# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0002_remove_dish_type_num_of_price_types'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Cusine',
            new_name='Cuisine',
        ),
        migrations.RenameField(
            model_name='restaurant',
            old_name='cusines',
            new_name='cuisines',
        ),
    ]
