# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0021_locality_city'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dish',
            name='userDownVotes',
            field=models.ManyToManyField(related_name='dislike', to=settings.AUTH_USER_MODEL, blank=True),
        ),
        migrations.AlterField(
            model_name='dish',
            name='userUpVotes',
            field=models.ManyToManyField(related_name='likes', to=settings.AUTH_USER_MODEL, blank=True),
        ),
    ]
