# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0024_auto_20151202_1953'),
    ]

    operations = [
        migrations.AddField(
            model_name='cobro',
            name='estado',
            field=models.IntegerField(default=1),
            preserve_default=True,
        ),
    ]
