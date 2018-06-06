# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0002_auto_20171117_1557'),
    ]

    operations = [
        migrations.AddField(
            model_name='answerrecords',
            name='used_time',
            field=models.CharField(default='0', max_length=10),
        ),
        migrations.AlterField(
            model_name='answerrecords',
            name='exam',
            field=models.ForeignKey(null=True, to='exam.ExamInfo', default=None),
        ),
        migrations.AlterField(
            model_name='questions',
            name='que_answer',
            field=models.CharField(max_length=600),
        ),
        migrations.AlterField(
            model_name='questions',
            name='que_content',
            field=models.CharField(max_length=500),
        ),
    ]
