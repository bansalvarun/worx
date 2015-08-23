# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0022_auto_20150820_2001'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dish',
            name='userDownVotes',
            field=models.ManyToManyField(related_name='dislike', null=True, to=settings.AUTH_USER_MODEL, blank=True),
        ),
        migrations.AlterField(
            model_name='dish',
            name='userUpVotes',
            field=models.ManyToManyField(related_name='likes', null=True, to=settings.AUTH_USER_MODEL, blank=True),
        ),
    ]
