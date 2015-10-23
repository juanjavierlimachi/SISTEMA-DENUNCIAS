# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cliente', '0010_remove_comment_archivo'),
    ]

    operations = [
        migrations.AddField(
            model_name='comment',
            name='idUser',
            field=models.IntegerField(null=True, blank=True),
            preserve_default=True,
        ),
    ]
