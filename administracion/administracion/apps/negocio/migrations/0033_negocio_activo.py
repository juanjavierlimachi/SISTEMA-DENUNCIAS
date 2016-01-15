# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0032_auto_20151214_0843'),
    ]

    operations = [
        migrations.AddField(
            model_name='negocio',
            name='activo',
            field=models.IntegerField(default=0),
            preserve_default=True,
        ),
    ]
