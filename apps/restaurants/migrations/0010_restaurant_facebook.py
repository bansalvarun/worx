# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0009_auto_20150906_1128'),
    ]

    operations = [
        migrations.AddField(
            model_name='restaurant',
            name='facebook',
            field=models.CharField(max_length=100, blank=True),
        ),
    ]
