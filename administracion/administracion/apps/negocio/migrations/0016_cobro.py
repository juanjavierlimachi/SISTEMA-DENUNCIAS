# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0015_auto_20151028_1813'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cobro',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('monto', models.FloatField()),
                ('fecha', models.DateTimeField(auto_now=True)),
                ('idNotificacion', models.ForeignKey(to='negocio.multa')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
