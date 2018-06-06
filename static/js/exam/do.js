/**
 * Created by Administrator on 2017-11-15.
 */

/*计时器*/
var t;
var sec=0;
var min=0;
var hour=0;
/*开始计时*/
function startTime() {
    t = setInterval(function () {
        sec = sec + 1;
        if (sec==60){
            min += 1;
            if (min == 60){
                hour += 1;
                min = 0;
            }
            sec = 0;
        }
        $(".alt-1").text(hour.toString()+":"+min.toString() +":"+sec.toString());
        $("#used_time").val(hour.toString()+":"+min.toString() +":"+sec.toString());
    },1000);
}
/*结束计时*/
function stopTime() {
    clearInterval(t);
}

/*交卷*/
function assignment() {
    var sum = $('.answerSheet ul li').length;
    var done = $('.answerSheet ul a.hasBeenAnswer').length;
    var not_done = sum - done;
    if (not_done != 0){
        if (!confirm('您还有'+not_done.toString()+'没有做完，是否提交？')){
            startTime();
            return false;
        }
    }
    return true
}

// 答题事件
function answer($obj) {
    var examId = $obj.closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
    var cardLi = $('a[href="#' + examId + '"]'); // 根据题目ID找到对应答题卡
    // 设置已答题
    if(!cardLi.hasClass('hasBeenAnswer')){
        cardLi.addClass('hasBeenAnswer');
    }
    var sum = $('.answerSheet ul li').length;
    var done = $('.answerSheet ul a.hasBeenAnswer').length;
    console.log('总共：'+sum.toString());
    console.log('已做：'+done.toString());
}

$(function() {
    startTime();
    $('li.option label').click(function() {
        answer($(this));
    });
    $('.option textarea').blur(function () {
        if($.trim($(this).val().trim()) != ''){
            answer($(this))
        }
        else {
            var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
            var cardLi = $('a[href="#' + examId + '"]'); // 根据题目ID找到对应答题卡
            // 设置已答题
            cardLi.removeClass('hasBeenAnswer');
        }
    });
    $('#submit').click(function () {
        stopTime();
        return assignment();
    });
});
