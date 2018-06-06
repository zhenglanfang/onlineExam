from django.db import models


# 学生表
class StudentInfo(models.Model):

    stu_name = models.CharField(max_length=20)
    stu_pwd = models.CharField(max_length=40)
    grade = models.CharField(max_length=20)

    def __str__(self):
        return self.stu_name


# 教师表
class TeacherInfo(models.Model):

    tea_name = models.CharField(max_length=20)
    tea_pwd = models.CharField(max_length=40)
    tea_introduction = models.CharField(max_length=200)

    def __str__(self):
        return self.tea_name


