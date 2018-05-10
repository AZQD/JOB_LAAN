$(function(){

    //PRE-ORDER
    var countNum = 0;//初始化购物车数量
    $('.goodsBox .goods .goodsRight1').unbind('click').click(function(){
        countNum++;
       $('.infos .shopCartBox .count').show().children('.countNum').html(countNum);
        //下面代码需要想tableBox中append
    });

    //点击reduce
    $('#tableData .goodItem').delegate('.reduce', 'click', function(){
        var nowNumber = $(this).siblings('.numberWrap').children('.number').html();
        if(nowNumber == 1){
            alert('受不了了，宝贝不能再减少了哦！');
        }else{
            nowNumber--;
            $(this).siblings('.numberWrap').children('.number').html(nowNumber);
        }
    });

    //点击add
    $('#tableData .goodItem').delegate('.add', 'click', function(){
        var nowNumber = $(this).siblings('.numberWrap').children('.number').html();
        nowNumber++;
        $(this).siblings('.numberWrap').children('.number').html(nowNumber);
    });
    
    //点击remove
    $('#tableData .goodItem').delegate('.remove', 'click', function(){
        $(this).parent().parent('.goodItem').remove();
    });


    //点击购物车图片弹出
    $('.shopCartBox').unbind('click').click(function(){
        $('.tableBox').slideToggle();
    });

    //点击搜索
    $('.headerBox .right #preSalesSearchBtn').unbind('click').click(function(){
        var searchKeyWord = $.trim($('.headerBox .right #preSalesIpt').val());
       if(searchKeyWord != ''){
           //localStorage.setItem('searchOrTab',"search");
           //localStorage.setItem('searchKeyWord',searchKeyWord);
           //window.location.href = "category.html?searchOrTab=search&searchKeyWord="+searchKeyWord;
       }
    });


    //重点：点击除div之外的任意位置隐藏div
    $(document).unbind('click').click(function(){
        $('.classifyBox').slideUp();//分类列表
        //$('.toggleSortBox .toggleList .hotUl').slideUp();//hot列表
        //$('.toggleSortBox .toggleList .newUl').slideUp();//new列表
        //$('.toggleSortBox .toggleList .pricesUl').slideUp();//price列表
    });

    /*//点击hot列表
    $('.toggleSortBox .toggleSort .hotTab').unbind('click').click(function(ev){
        ev.stopPropagation();
        $('.classifyBox').slideUp();//分类列表
        $('.toggleSortBox .toggleList .hotUl').slideToggle();//hot列表
        $('.toggleSortBox .toggleList .newUl').slideUp();//new列表
        $('.toggleSortBox .toggleList .pricesUl').slideUp();//price列表
    });

    //点击new列表
    $('.toggleSortBox .toggleSort .newTab').unbind('click').click(function(ev){
        ev.stopPropagation();
        $('.classifyBox').slideUp();//分类列表
        $('.toggleSortBox .toggleList .hotUl').slideUp();//hot列表
        $('.toggleSortBox .toggleList .newUl').slideToggle();//new列表
        $('.toggleSortBox .toggleList .pricesUl').slideUp();//price列表
    });

    //点击price列表
    $('.toggleSortBox .toggleSort .pricesTab').unbind('click').click(function(ev){
        ev.stopPropagation();
        $('.classifyBox').slideUp();//分类列表
        $('.toggleSortBox .toggleList .hotUl').slideUp();//hot列表
        $('.toggleSortBox .toggleList .newUl').slideUp();//new列表
        $('.toggleSortBox .toggleList .pricesUl').slideToggle();//price列表
    });*/


    //产品分类显示
    $.ajax({
        type: "get",
        url: baseUrl + "/apigateway/categorys",
        dataType: "json",
        success: function (data) {
            if (data.status == 200) {
                data = JSON.parse(data.data);
                console.log("获得产品分类", data);

                for (var i = 0; i < data.length; i++) {
                    var secondStr = '';
                    for (var j = 0; j < data[i].sub.length; j++) {
                        secondStr += '<span class="secondName" cid=' + data[i].sub[j].cid + ' cidName=' + data[i].sub[j].name + '>' + data[i].sub[j].name + '</span>';
                    }
                    $('.classifyBox').append('' +
                        '<div class="classifyLi">' +
                        '<div class="col-xs-3 col-sm-3 firstName" cid=' + data[i].cid + ' cidName=' + data[i].name + '>' + data[i].name + '</div>' +
                        '<div class="col-xs-9 col-sm-9 secondNames">' +
                        secondStr +
                        '</div>' +
                        '</div>');
                }
                $('.classifyBox .classifyLi').eq(1).children().css('color', '#FF4F0D');

                $('.headerBox .right #preSalesSort').unbind('click').click(function(ev){
                    ev.stopPropagation();
                    $('.classifyBox').slideToggle();//分类列表
                    /*$('.toggleSortBox .toggleList .hotUl').slideUp();//hot列表
                    $('.toggleSortBox .toggleList .newUl').slideUp();//new列表
                    $('.toggleSortBox .toggleList .pricesUl').slideUp();//price列表*/
                });

                //点击事件
                $('.classifyBox .classifyLi .firstName,.classifyBox .classifyLi .secondName').unbind('click').click(function () {
                    //window.localStorage.setItem('mobileCidName', $(this).attr('cidName'));
                    setCookie('mobileCidName', $(this).attr('cidName'), 1);
                    window.location.href = 'category.html?searchOrTab=tab&cid=' + $(this).attr('cid');
                });


            } else {
                commonPopFun1(data.msg, 'Failed');
            }
        },
        error: function (error) {
            console.log(error);
        }

    });
});