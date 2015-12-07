# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0027_categoria_atencion'),
    ]

    operations = [
        migrations.AlterField(
            model_name='categoria',
            name='atencion',
            field=models.CharField(help_text=b'Indique la hora de funcionamiento', max_length=150),
        ),
    ]
