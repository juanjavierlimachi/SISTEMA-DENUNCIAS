# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0020_auto_20151122_1458'),
    ]

    operations = [
        migrations.AddField(
            model_name='negocio',
            name='qr',
            field=models.ImageField(null=True, upload_to=b'imagenes', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='cobro',
            name='monto',
            field=models.FloatField(help_text=b'Ingrese la Multa que fue asignado.'),
        ),
    ]
