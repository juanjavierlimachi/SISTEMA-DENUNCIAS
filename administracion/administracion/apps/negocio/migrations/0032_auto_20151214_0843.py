# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0031_auto_20151205_1940'),
    ]

    operations = [
        migrations.AlterField(
            model_name='negocio',
            name='qr',
            field=models.CharField(max_length=200, null=True, blank=True),
        ),
    ]
