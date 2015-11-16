# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0016_cobro'),
    ]

    operations = [
        migrations.AlterField(
            model_name='negocio',
            name='categoria',
            field=models.ForeignKey(to='negocio.Categoria'),
        ),
    ]
