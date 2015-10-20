# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cliente', '0006_auto_20151015_1252'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='archivo',
            field=models.ImageField(help_text=b'Puede agregar una o Imagen Archivo', upload_to=b'imagenes'),
        ),
    ]
