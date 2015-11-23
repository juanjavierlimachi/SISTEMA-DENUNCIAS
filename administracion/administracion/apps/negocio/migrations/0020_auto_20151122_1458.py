# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0019_categoria_fecha_registro'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cobro',
            name='idNotificacion',
            field=models.OneToOneField(to='negocio.multa'),
        ),
    ]
