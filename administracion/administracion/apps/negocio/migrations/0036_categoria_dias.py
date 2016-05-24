# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0035_multa_activo'),
    ]

    operations = [
        migrations.AddField(
            model_name='categoria',
            name='dias',
            field=models.CharField(default='lunes', max_length=100),
            preserve_default=False,
        ),
    ]
