
from django.conf.urls import url
from exam import views

urlpatterns = [
    url(r'^$',views.index,name='index'),
    url(r'^chapter/(\d+)/$',views.chapter,name='chapter'),
    url(r'^chapter/do/(\d+)/$', views.chapter_do, name='chapter_do'),
    url(r'^chapter/addpractice$',views.add_practices,name='add_practice'),
    url(r'^selfdo/save_result$',views.save_result,name='show_result'),
    url(r'^selfdo/show_record/(\d+)$',views.show_record,name='show_record'),
    url(r'^error$',views.error,name='error'),
    url(r'^error/type$',views.select_error_type,name='error_type'),
    url(r'error/show$',views.show_error,name='show_error'),
    url(r'^practice$',views.practice,name='record'),
    url(r'^practice/(\d+)/(\d+)$',views.practice2,name='record2'),
    url(r'^exam$',views.exam,name='exam'),
]