# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0029_auto_20151205_1750'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='categoria',
            name='hoar',
        ),
    ]
