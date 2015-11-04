# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('negocio', '0015_auto_20151028_1813'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('usuario', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Seguimiento',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('fecha', models.DateTimeField(auto_now=True)),
                ('neg', models.ForeignKey(to='negocio.Negocio')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
