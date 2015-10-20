# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cliente', '0003_comment_fecha_denuncia'),
    ]

    operations = [
        migrations.AddField(
            model_name='comment',
            name='Tipo_de_peticion',
            field=models.IntegerField(default=2),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='comment',
            name='archivo',
            field=models.ImageField(help_text=b'Puede agragar una Archio o Imagen', null=True, upload_to=b'portadas', blank=True),
            preserve_default=True,
        ),
    ]
