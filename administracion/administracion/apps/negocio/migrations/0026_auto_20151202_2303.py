# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0025_cobro_estado'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cobro',
            name='estado',
            field=models.CharField(max_length=200),
        ),
    ]
