# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0028_auto_20151205_1738'),
    ]

    operations = [
        migrations.AddField(
            model_name='categoria',
            name='hoar',
            field=models.CharField(default='00:00:00', max_length=100),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='categoria',
            name='atencion',
            field=models.CharField(help_text=b'Indique la hora de funcionamiento', max_length=100),
        ),
    ]
