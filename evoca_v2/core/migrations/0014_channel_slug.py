# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-07-12 19:50
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0013_auto_20170531_0117'),
    ]

    operations = [
        migrations.AddField(
            model_name='channel',
            name='slug',
            field=models.SlugField(blank=True, null=True),
        ),
    ]
