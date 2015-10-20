# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cliente', '0005_auto_20151015_0946'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='Tipo_de_peticion',
            field=models.CharField(max_length=100),
        ),
    ]
