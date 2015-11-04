# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0014_negocio_fecha_registro'),
    ]

    operations = [
        migrations.AlterField(
            model_name='negocio',
            name='categoria',
            field=models.ForeignKey(help_text=b'Seleccione una Categoria', to='negocio.Categoria'),
        ),
        migrations.AlterField(
            model_name='negocio',
            name='user',
            field=models.ForeignKey(blank=True, to=settings.AUTH_USER_MODEL, null=True),
        ),
    ]
