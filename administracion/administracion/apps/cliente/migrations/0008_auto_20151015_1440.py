# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cliente', '0007_auto_20151015_1316'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='comment',
            name='comment',
        ),
        migrations.RemoveField(
            model_name='comment',
            name='idNegocio',
        ),
        migrations.AddField(
            model_name='comment',
            name='Negocio',
            field=models.IntegerField(default=2),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='comment',
            name='Reclamo',
            field=models.TextField(default=2),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='comment',
            name='archivo',
            field=models.ImageField(help_text=b'Puede agregar una o Imagen Archivo', null=True, upload_to=b'imagenes', blank=True),
        ),
    ]
