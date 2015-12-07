# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0021_auto_20151130_1940'),
    ]

    operations = [
        migrations.AlterField(
            model_name='negocio',
            name='qr',
            field=models.ImageField(upload_to=b'imagenes'),
        ),
    ]
