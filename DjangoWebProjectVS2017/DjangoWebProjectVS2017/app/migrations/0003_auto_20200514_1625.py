# -*- coding: utf-8 -*-
# Generated by Django 1.11.10 on 2020-05-14 14:25
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_user'),
    ]

    operations = [
        migrations.AddField(
            model_name='choice',
            name='correcto',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='question',
            name='topic',
            field=models.CharField(default='general', max_length=200),
            preserve_default=False,
        ),
    ]
