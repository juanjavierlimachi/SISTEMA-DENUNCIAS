# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0023_auto_20151130_2047'),
    ]

    operations = [
        migrations.AddField(
            model_name='multa',
            name='estado',
            field=models.IntegerField(default=0),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='categoria',
            name='categoria',
            field=models.CharField(help_text=b'Escriba una Categoria Ejem. Locales', max_length=50),
        ),
    ]
