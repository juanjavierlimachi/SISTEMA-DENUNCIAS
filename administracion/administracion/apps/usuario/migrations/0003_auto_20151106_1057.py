# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('usuario', '0002_seguimiento'),
    ]

    operations = [
        migrations.AlterField(
            model_name='perfiles',
            name='ci',
            field=models.IntegerField(max_length=8),
        ),
    ]
