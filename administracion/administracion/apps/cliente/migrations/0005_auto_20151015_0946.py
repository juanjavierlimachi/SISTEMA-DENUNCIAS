# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cliente', '0004_auto_20151015_0946'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='archivo',
            field=models.ImageField(help_text=b'Puede agragar una Archio o Imagen', null=True, upload_to=b'imagenes', blank=True),
        ),
    ]
