# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0030_remove_categoria_hoar'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cobro',
            name='estado',
        ),
        migrations.AlterField(
            model_name='categoria',
            name='atencion',
            field=models.CharField(max_length=100),
        ),
    ]
