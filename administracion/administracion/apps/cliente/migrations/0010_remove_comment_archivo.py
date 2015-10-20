# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cliente', '0009_auto_20151015_1441'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='comment',
            name='archivo',
        ),
    ]
