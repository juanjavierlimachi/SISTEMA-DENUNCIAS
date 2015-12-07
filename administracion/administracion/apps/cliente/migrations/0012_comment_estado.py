# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cliente', '0011_comment_iduser'),
    ]

    operations = [
        migrations.AddField(
            model_name='comment',
            name='estado',
            field=models.IntegerField(default=0),
            preserve_default=True,
        ),
    ]
