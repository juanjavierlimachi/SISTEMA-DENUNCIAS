# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0026_auto_20151202_2303'),
    ]

    operations = [
        migrations.AddField(
            model_name='categoria',
            name='atencion',
            field=models.CharField(default='noche', max_length=50),
            preserve_default=False,
        ),
    ]
