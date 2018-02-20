# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-12-03 22:51
from __future__ import unicode_literals

from django.db import migrations, models
import mobile.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Audio',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('channel', models.CharField(default='default', max_length=255)),
                ('audio', models.FileField(upload_to=mobile.models.directory_path)),
            ],
        ),
        migrations.CreateModel(
            name='Imagen',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('channel', models.CharField(default='default', max_length=255)),
                ('img', models.ImageField(upload_to=mobile.models.directory_path)),
            ],
        ),
    ]
