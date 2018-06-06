from datetime import datetime
from django.shortcuts import render,redirect
from django.views.decorators.csrf import csrf_exempt
from django.core import serializers
from django.core.urlresolvers import reverse
from django.http.response import HttpResponse
import json



from exam import models
from exam import handles



# 首页
def index(request):
    request.session['userid'] = '1'
    subjects = models.ChapterItems.objects.filter(subject=None)
    return render(request,'exam/exam_index.html',{'subjects':subjects})

# 章节练习
def chapter(request,subject_id):
    subject = models.ChapterItems.objects.filter(pk=subject_id)
    if subject.exists():
        chapters = subject[0].chapteritems_set.all()
        context = {
            'subject':subject[0],
            'chapters':chapters
        }
        request.session['subject_id'] = subject_id
        return render(request,'exam/chapter.html',context)
    else:
        return redirect(reverse('exam:index'))

# 选择做题模式
def chapter_do(request,chapter_id):
    chapter_obj = models.ChapterItems.objects.filter(pk=chapter_id)
    if chapter_obj.count()==1:
        ques = models.Questions.objects.filter(chapter_id=chapter_id)
        # 章节
        chapter_obj = chapter_obj[0]

        # 试题类型
        que_types = ques.values('que_type').distinct()
        que_types = [item['que_type'] for item in que_types]
        que_types.sort()
        list_type = [(que,handles.get_type(que)) for que in que_types]
        # print(list_type)
        # 试题难度
        que_level = ques.values('level').distinct()
        que_level = [item['level'] for item in que_level]
        que_level.sort()
        list_level = [(que,handles.get_level(que)) for que in que_level]
        # print(list_type)
        # 试题数量
        # count = ques.count()
        stu_id = request.session.get('userid')
        student = models.StudentInfo.objects.get(pk=int(stu_id))
        # 做过题目
        ques = student.answer_set.filter(que__chapter_id=chapter_id).values('que').distinct()
        # 做过的数量
        done = ques.count()
        # 错误的数量
        err = ques.filter(score=0).count()
        sum_ques = models.Questions.objects.filter(chapter_id=chapter_id).count()
        # 没有做的数量
        notdone = sum_ques - done

        context = {
            'chapter':chapter_obj,
            'que_type':list_type,
            'done':done,
            'err':err,
            'notdone':notdone,
            'que_level':list_level,
        }
        return render(request,'exam/select.html',context)
    else:
        return redirect(reverse('exam:index'))

# 自测
def add_practices(request):
    chapter_id = request.GET.get('chapter_id') # 章节
    model = request.GET.get('filter')  # 做题模式：0 未做 1 已做 2 错误
    degree =request.GET.get('degree')  # 难度 0:全部
    quantity = request.GET.get('quantity') # 数量
    title = request.GET.get('title') #
    typeid = request.GET.get('typeid') # 题目类型
    if model == '0':
        ques = handles.notdone_ques(request,chapter_id)
    elif models == '1':
        ques = handles.done_ques(request,chapter_id)
    else:
        ques = handles.err_ques(request,chapter_id)
    if not degree == '0':
        ques = ques.filter(level=degree)
    ques = ques.filter(que_type=typeid).order_by('?')[:int(quantity)]
    # ques = serializers.serialize('json',ques)
    context = {
        'title':title,
        'chapter':chapter_id,
        'type':handles.get_type(typeid),
        'ques':ques,
        'count':ques.count(),
        'ques_list':','.join([str(item.pk) for item in ques]),
        'answer_list':[a for a in range(ques.count())]
    }
    return render(request,'exam/selfdo.html',context)

# 保存做题记录
def save_result(request):
    chapter_id = request.POST.get('chapter')
    ques_ids = request.POST.get('ques_ids')
    used_time = request.POST.get('used_time')
    student = handles.get_student(request)
    answer_record = models.AnswerRecords(stu=student,chapter_id=int(chapter_id),exam=None,used_time=used_time)
    answer_record.save()

    ques_ids = ques_ids.split(',')
    err = 0
    for item in ques_ids:
        answer = request.POST.get(item)
        que = models.Questions.objects.get(pk=item)
        if answer == que.que_answer:
            score = 1
        else:
            score = 0
            err += 1
        ans = models.Answer(stu=student,stu_answer=answer,score=score,answer_record=answer_record,que=que)
        ans.save()

    s = '总共%d题，正确：%d，错误：%d'%(len(ques_ids),len(ques_ids)-err,err)
    print(s)
    return redirect(reverse('exam:show_record',args=(answer_record.pk,)))

# 显示做题结果
def show_record(request,record_id):
    stu_id = request.session.get('userid')
    record = models.AnswerRecords.objects.filter(pk=record_id,stu_id=int(stu_id))
    if record.exists():
        record = record[0]
        answer = record.answer_set.first()
        context = {
            'title':record.chapter.ctitle,
            'count':record.answer_set.count(),
            'err':record.errors_count(),
            'success':record.success_count(),
            'used_time':record.switch_used(),
            'answers': record.answer_set.all(),
            'type':handles.get_type(answer.que.que_type),
            'answer_date':datetime.strftime(record.answer_date,'%Y年%m月%d日')
        }
        return render(request,'exam/showrecord.html',context)
    else:
        return HttpResponse('没有查询到该记录！')

# 选择错题类型
@csrf_exempt
def select_error_type(request):
    error_type = request.POST.get('type','0')
    stu_id = request.session.get('userid')
    records = models.AnswerRecords.objects.filter(stu_id=int(stu_id),answer__score=0).distinct()
    if not error_type == '0':
        records = records.filter(answer__que__que_type=error_type)
    context = records.values('chapter').distinct()
    # 初始化：每个章节
    for item in context:
        item['title'] = models.ChapterItems.objects.get(pk=item['chapter'])
        item['sumcount'] = models.Questions.objects.filter(chapter_id=item['chapter']).count()
        item['errcount'] = 0
        item['errs'] = set()
    # 获取每个章节的错题
    for record in records:
        for item in context:
            if item['chapter'] == record.chapter_id:
                ids = [item['que_id'] for item in record.answer_set.values('que_id')]
                item['errs'].update(ids)

    # 设置每个章节错题数
    for item in context:
        item['errcount'] = len(item['errs'])
        # item['errs'] = ','.join(str(item) for item in t[0]['errs'])
    print(context)
    # records = records.order_by('chapter_id')
    return render(request,'exam/module/error_select_type.html',{'context':context,'count':len(context)})

# 查看错题
def show_error(request):
    errs = request.GET.get('errs').replace('{','[').replace('}',']')
    title = request.GET.get('title')
    errs = json.loads(errs)
    questions = models.Questions.objects.filter(pk__in = errs)

    return render(request,'exam/showerrors.html',{'questions':questions,'title':title})

# 错题集锦
def error(request):
    return render(request,'exam/errorquestion.html')

# 练习记录
def practice2(request,model,que_type):
    stu_id = request.session.get('userid')
    record = models.AnswerRecords.objects.filter(stu_id=int(stu_id))

    # 章节
    if model == '0':
        record = record.filter(exam=None)
        if not que_type == '0':
            record = record.filter(answer__que__que_type=que_type).distinct()
    # 考试
    else:
        record = record.exclude(exam=None)
    record = record.order_by('-pk')
    return render(request,'exam/record.html',{'records':record,'model':model,'que_type':que_type})

# 练习记录
def practice(request):
    return practice2(request,'0','0')


# 我的考试
def exam(request):
    return render(request,'exam/exam.html')


'''
使用Django从数据库中随机取N条记录的不同方法
1.使用mysql数据库，数据量在百万级以下时
    Record.objects.order_by('?')[:2]
2.数据量在百万级以上时
    sample = random.sample(xrange(Record.objects.count()),n)  
    result = [Record.objects.all()[i]) for i in sample]
'''