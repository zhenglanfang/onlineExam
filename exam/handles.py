from exam import models


def get_student(request):
    stu_id = request.session.get('userid')
    student = models.StudentInfo.objects.get(pk=int(stu_id))
    return student

# 返回已经做的题
def done_ques(request,chapter_id):
    student = get_student(request)
    ques = student.answer_set.filter(que__chapter_id=chapter_id).values('que').distinct()
    ques = [item['que'] for item in ques]
    return models.Questions.objects.filter(pk__in=ques)


# 返回错误的题
def err_ques(request,chapter_id):
    student = get_student(request)
    ques = student.answer_set.filter(que__chapter_id=chapter_id,score=0).values('que').distinct()
    ques = [item['que'] for item in ques]
    return models.Questions.objects.filter(pk__in=ques)


# 返回没有做的题
def notdone_ques(request,chapter_id):
    ques = models.Questions.objects.filter(chapter_id=chapter_id)
    doneques = done_ques(request,chapter_id)
    done_ids = [item.pk for item in doneques]
    return ques.exclude(pk__in=done_ids)

# 获取题目类型
def get_type(que):
    # if isinstance(que,str):
    #     que = {
    #         'que_type':que
    #     }
    if que == '1':
        t = '选择题'
    elif que == '2':
        t = '判断题'
    else:
        t = '主观题'
    return t

# 获取题目难度
def get_level(que):
    # if isinstance(que,str):
    #     que = {
    #         'level':que
    #     }
    if que == '1':
        t = '简单'
    elif que == '2':
        t = '一般'
    else:
        t = '较难'
    return t


