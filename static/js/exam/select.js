$(function () {
    //绑定点击事件
    $("#ptype>a,#pmode>a,#pdegree>a,#pnum>a").on("click", function () {
        //改变元素状态
        $(this).addClass("aon").siblings().removeClass("aon");
    });
    //点击开始做题
    $(".choose_btn").on("click", function () {
        //校验选择是否有效
        var count = $("#pmode>a[class='aon']").data("count");
        // console.log(count+'--------')
        if (count != null && parseInt(count) == 0) {
            window.alert("选择的练习模式,暂时没有试题！");
            return false;
        }

        //数据模型
        var practice = { chapter_id: $("h1.h1tit").attr('chapter'), title: $("h1.h1tit")[0].title };

        //采集用户选择
        $(".choose_list .aon").each(
            function (a, b) {
                practice[$(b).data("mode")] = $(b).data("id");
            }
        );
        var params = $.param(practice);
        // console.log(location.href)
        window.location.href = '/exam/chapter/addpractice?'+ params;

        //生成练习
/*        $.ajax({
            beforeSend: function () {  console.log(practice); },
            url: "/chapter/addpractice/",
            type: "post",
            data: practice,
            contentType: "application/json",
            dataType:"json",
            success: function (data) {
                if (data.status === 1) {

                    window.location.href = "/exam/do/" + data.chapterId + "/" + data.rid + "/" + args;
                }
                else {

                }

            },
            error: function (a, b, c) { }
        });*/
    });

});
