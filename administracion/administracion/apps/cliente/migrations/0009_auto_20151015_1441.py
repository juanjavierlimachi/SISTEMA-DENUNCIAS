# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cliente', '0008_auto_20151015_1440'),
    ]

    operations = [
        migrations.RenameField(
            model_name='comment',
            old_name='Reclamo',
            new_name='comment',
        ),
        migrations.RenameField(
            model_name='comment',
            old_name='Negocio',
            new_name='idNegocio',
        ),
        migrations.AlterField(
            model_name='comment',
            name='archivo',
            field=models.ImageField(help_text=b'Puede agregar una Imagen o Archivo', null=True, upload_to=b'imagenes', blank=True),
        ),
    ]
