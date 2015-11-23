# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0017_auto_20151107_1551'),
    ]

    operations = [
        migrations.AddField(
            model_name='negocio',
            name='estadoD',
            field=models.IntegerField(default=0),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='negocio',
            name='estadoN',
            field=models.IntegerField(default=0),
            preserve_default=True,
        ),
    ]
