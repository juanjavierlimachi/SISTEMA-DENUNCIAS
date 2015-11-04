# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0012_negocio_fecha_registro'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='negocio',
            name='fecha_registro',
        ),
    ]
