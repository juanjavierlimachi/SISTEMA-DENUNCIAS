# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0013_remove_negocio_fecha_registro'),
    ]

    operations = [
        migrations.AddField(
            model_name='negocio',
            name='fecha_registro',
            field=models.DateTimeField(default='2015-10-10 10:00:00', auto_now=True),
            preserve_default=False,
        ),
    ]
