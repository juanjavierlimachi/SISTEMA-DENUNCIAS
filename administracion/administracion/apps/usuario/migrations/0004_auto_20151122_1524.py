# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('usuario', '0003_auto_20151106_1057'),
    ]

    operations = [
        migrations.AlterField(
            model_name='perfiles',
            name='ci',
            field=models.IntegerField(unique=True, max_length=8),
        ),
    ]
