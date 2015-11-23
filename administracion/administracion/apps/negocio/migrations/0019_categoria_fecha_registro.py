# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0018_auto_20151119_2036'),
    ]

    operations = [
        migrations.AddField(
            model_name='categoria',
            name='fecha_registro',
            field=models.DateTimeField(default='2015-02-02 00:00:00', auto_now=True),
            preserve_default=False,
        ),
    ]
