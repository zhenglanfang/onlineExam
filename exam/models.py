from django.db import models
from datetime import datetime

from user.models import StudentInfo,TeacherInfo


# 章节表
class ChapterItems(models.Model):
    '''
    作用：学科章节表
    ctitle:标题
    subject：属于哪个学科
    '''
    ctitle = models.CharField(max_length=30)
    subject = models.ForeignKey('self',null=True)


    def get_cover(self):
        path = 'images/exam/cover/%d.jpg'%self.pk
        return path

    def __str__(self):
        return self.ctitle


# 题库
class Questions(models.Model):

    chapter = models.ForeignKey(ChapterItems, null=True)
    que_type = models.CharField(max_length=10) # 题目类型：1:select,2:judge,3:subject
    que_content = models.CharField(max_length=500)  # 题目内容
    que_A = models.CharField(max_length=30,null=True) # 选择题
    que_B = models.CharField(max_length=30,null=True)
    que_C = models.CharField(max_length=30,null=True)
    que_D = models.CharField(max_length=30,null=True)
    que_answer = models.CharField(max_length=600) # 答案
    level = models.CharField(max_length=1)   # 难度：1,2,3
    point_value = models.IntegerField(default=0)  # 分值：默认0

    def __str__(self):
        return str(self.pk)

    def switch_answer(self):
        if self.que_answer == '1':
            return '✔'
        else:
            return '✘'

# 选择题题库
# class SelectQuestions(models.Model):
#
#     chapter = models.ForeignKey(ChapterItems,null=True)
#     que_content = models.CharField(max_length=50)
#     que_A = models.CharField(max_length=30)
#     que_B = models.CharField(max_length=30)
#     que_C = models.CharField(max_length=30)
#     que_D = models.CharField(max_length=30)
#     answer = models.CharField(max_length=1)  # 答案：A B C D
#     level = models.CharField(max_length=1)   # 难度：0 1 2
#     point_value = models.IntegerField(default=1) # 分值：默认1

# 判断题题库
# class JudgeQuestions(models.Model):
#
#     chapter = models.ForeignKey(ChapterItems, null=True)
#     que_content = models.CharField(max_length=50)
#     answer = models.CharField(max_length=1) # 答案：0：错误，1：正确
#     level = models.CharField(max_length=1)
#     point_value = models.IntegerField(default=1)


# 主观题题库
# class SubjectiveQuestions(models.Model):
#
#     chapter = models.ForeignKey(ChapterItems, null=True)
#     que_content = models.CharField(max_length=150)
#     answer = models.CharField(max_length=300)
#     level = models.CharField(max_length=1)
#     point_value = models.IntegerField(default=20)

'''考试信息表'''
class ExamInfo(models.Model):

    title = models.CharField(max_length=20) # 考试标题
    exam_time = models.DateTimeField()  # 考试时间
    total_time = models.CharField(max_length=10)   # 考试用时：4：20(这种格式)
    stu = models.ManyToManyField(StudentInfo)
    tea = models.ForeignKey(TeacherInfo)
    mark = models.IntegerField()

    def __str__(self):
        return self.title


# 试卷表
class PaperInfo(models.Model):

    que = models.ForeignKey(Questions)
    exam = models.ForeignKey(ExamInfo)


# 答题记录
class AnswerRecords(models.Model):
    stu = models.ForeignKey(StudentInfo)
    chapter = models.ForeignKey(ChapterItems,null=True)
    exam = models.ForeignKey(ExamInfo,null=True,default=None)
    answer_date = models.DateField(auto_now=True)
    used_time = models.CharField(max_length=10,default='0')

    def switch_used(self):
        slist = self.used_time.split(':')
        if not slist[0] == '0':
            slist[0] = slist[0] + '小时'
        if not slist[1] == '0':
            slist[1] = slist[1] + '分钟'
        if not slist[2] == '0':
            slist[2] = slist[2] + '秒'
        slist = [item for item in slist if not item == '0']
        return ''.join(slist)

    def switch_date(self):
        return datetime.strftime(self.answer_date, '%Y年%m月%d日')

    # 获取总分
    def sum_score(self):
        sums = 0
        for item in self.answer_set.all():
            sum += item.score
        return sums

    #已经做过的题
    def done(self):
        ls = set()
        for item in self.answer_set.all():
            ls.add(item)
            # ls.add(item.pk)
        return ls

    # 没有做过的题
    def notdone(self):
        pass

    # 获取错误题
    def errors(self):
        return self.answer_set.filter(score=0)

    # 获取错误题数
    def errors_count(self):
        err = self.answer_set.filter(score=0)
        return err.count()

    # 获取正确题数
    def success_count(self):
        success = self.answer_set.filter(score__gt=0)
        return success.count()


# 答题表
class Answer(models.Model):

    stu = models.ForeignKey(StudentInfo)
    stu_answer = models.CharField(max_length=300)
    # correct = models.BooleanField()  # 是否正确
    score = models.IntegerField()  # 分数：错误：0,正确：1,主观题：0-20
    answer_record = models.ForeignKey(AnswerRecords)
    que = models.ForeignKey(Questions)

    def switch_answer(self):
        if self.stu_answer == '1':
            return '✔'
        else:
            return '✘'


'''
    获取试卷：
        exam = ExamInfo.objects.get(pk='exam_id')
        exam.paperinfo_set.all()
    获取试卷答题记录：
        exam.answerrecords_set.filter(exam__isnull=False)
    获取某个学生的答题记录：
        records = AnswerRecords.objects.filter(stu_id='').order_by('-answer_date')
        # 所以题
        for record in records:
            record.answer_set.all()
    获取错题：
        for record in records:
            record.answer_set.filter(score=0)                  

'''











