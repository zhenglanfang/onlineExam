# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
        ('exam', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Answer',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, auto_created=True, verbose_name='ID')),
                ('stu_answer', models.CharField(max_length=300)),
                ('score', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='AnswerRecords',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, auto_created=True, verbose_name='ID')),
                ('answer_date', models.DateField(auto_now=True)),
                ('chapter', models.ForeignKey(to='exam.ChapterItems', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='ExamInfo',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, auto_created=True, verbose_name='ID')),
                ('title', models.CharField(max_length=20)),
                ('exam_time', models.DateTimeField()),
                ('total_time', models.CharField(max_length=10)),
                ('mark', models.IntegerField()),
                ('stu', models.ManyToManyField(to='user.StudentInfo')),
                ('tea', models.ForeignKey(to='user.TeacherInfo')),
            ],
        ),
        migrations.CreateModel(
            name='PaperInfo',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, auto_created=True, verbose_name='ID')),
                ('exam', models.ForeignKey(to='exam.ExamInfo')),
            ],
        ),
        migrations.CreateModel(
            name='Questions',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, auto_created=True, verbose_name='ID')),
                ('que_type', models.CharField(max_length=10)),
                ('que_content', models.CharField(max_length=150)),
                ('que_A', models.CharField(null=True, max_length=30)),
                ('que_B', models.CharField(null=True, max_length=30)),
                ('que_C', models.CharField(null=True, max_length=30)),
                ('que_D', models.CharField(null=True, max_length=30)),
                ('que_answer', models.CharField(max_length=300)),
                ('level', models.CharField(max_length=1)),
                ('point_value', models.IntegerField(default=0)),
                ('chapter', models.ForeignKey(to='exam.ChapterItems', null=True)),
            ],
        ),
        migrations.AddField(
            model_name='paperinfo',
            name='que',
            field=models.ForeignKey(to='exam.Questions'),
        ),
        migrations.AddField(
            model_name='answerrecords',
            name='exam',
            field=models.ForeignKey(to='exam.ExamInfo', null=True),
        ),
        migrations.AddField(
            model_name='answerrecords',
            name='stu',
            field=models.ForeignKey(to='user.StudentInfo'),
        ),
        migrations.AddField(
            model_name='answer',
            name='answer_record',
            field=models.ForeignKey(to='exam.AnswerRecords'),
        ),
        migrations.AddField(
            model_name='answer',
            name='que',
            field=models.ForeignKey(to='exam.Questions'),
        ),
        migrations.AddField(
            model_name='answer',
            name='stu',
            field=models.ForeignKey(to='user.StudentInfo'),
        ),
    ]
