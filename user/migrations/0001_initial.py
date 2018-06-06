# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='StudentInfo',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, auto_created=True, verbose_name='ID')),
                ('stu_name', models.CharField(max_length=20)),
                ('stu_pwd', models.CharField(max_length=40)),
                ('grade', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='TeacherInfo',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, auto_created=True, verbose_name='ID')),
                ('tea_name', models.CharField(max_length=20)),
                ('tea_pwd', models.CharField(max_length=40)),
                ('tea_introduction', models.CharField(max_length=200)),
            ],
        ),
    ]
