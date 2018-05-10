$(function(){

    //getmarquee
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/getmarquee",
        dataType:"json",
        success: function(data){
            if(data.status ==200){
                console.log('getmarquee',data);
                $('#aboutmarquee').html(data.data);
            }

        },
        error:function(error){
            console.log(error);
        }
    });

    /*facebook发布评论*/
    $('#fackbookNeedId').attr('data-href', "http://www.kalichimall.com:81/profile.html"+window.location.search);

    //搜索
    localStorage.removeItem("searchKeyWord");
    $('.searchBox .search .searchRight .searchImg').unbind('click').click(function () {
        var searchKeyWord = $.trim($('.searchBox .search .searchRight .ipt').val());
        if(searchKeyWord != ''){
            localStorage.setItem('searchOrTab',"search");
            localStorage.setItem('searchKeyWord',searchKeyWord);
            window.location.href = "category.html?searchOrTab=search&searchKeyWord="+searchKeyWord;
        }else{
//                alert('请输入搜索关键词！');
        }
    });

    var searchStatus = 0;
    $('.searchBox .search .searchRight .ipt').on('focus',function () {
        searchStatus = 1;
    });
    $('.searchBox .search .searchRight .ipt').on('blur',function () {
        searchStatus = 0;
    });
    document.onkeydown = function(ev){
        ev = ev || event;
        console.log(ev.keyCode);
        if(ev.keyCode == 13){
            if(searchStatus == 1){ //按enter搜索
                var searchKeyWord = $.trim($('.searchBox .search .searchRight .ipt').val());
                if(searchKeyWord != ''){
                    localStorage.setItem('searchOrTab',"search");
                    localStorage.setItem('searchKeyWord',searchKeyWord);
                    window.location.href = "category.html?searchOrTab=search&searchKeyWord="+searchKeyWord;
                }else{
//                alert('请输入搜索关键词！');
                }
            }
            return false;
        }
    };



    //点击发布
    $('.publishBox .publish .publishBtnBox .publishBtn').unbind('click').click(function () {
        window.location.href = "publish.html";
        //提交评论(支持盖楼)
        /*var putcommentInfo = {
         "token":token, 			//用户登录凭证，必须登录才能发布评论
         "goodid":"1",			//产品ID
         "content":"hello",			//评论内容
         "tocomment":"",			//如果不是回复其他评论，则留空，否则填评论ID
         "timestamp":timestamp
         };
         $.ajax({
         type:"POST",
         url:baseUrl + "/apigateway/putcomment",
         dataType:"json",
         data:JSON.stringify(putcommentInfo),
         success:function(data){
         //console.log(data);
         if(data.status == 200){
         //                    data = JSON.parse(data.data);
         console.log("提交评论(支持盖楼)",data);
         }else if(data.status == 501){//token失效
         alert(data.msg);
         }else{
         alert(data.msg);
         }
         },
         error:function(error){
         console.log(error);
         }
         });*/
    });


    //
    var pubUid = getParamByUrl('pubUid');

    //获得商品发布者用户信息
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/getuserinfo_pub?uid="+pubUid+"&token="+token,
        dataType:"json",
        success: function(data){
            console.log(baseUrl+"/apigateway/getuserinfo_pub?uid="+pubUid+"&token="+token);
            console.log('发布者用户信息', data);
            data = data.data;

            //修改title
            $('#profileTitle').html(data.nickname + "'s home. kalichimall, make money by your second-hand goods.");

            //详情页信息
            $('.searchBox .search .searchLeft .part1 .headImg img').show().attr('src',baseImgSrc+data.logo).click(function(){
//                    alert("跳转");
//                    window.location.href = 'manage.html?pubUid='+pubUid;
//                    window.location.href = 'manage.html';
            });
            $('.searchBox .search .searchLeft .part1 .name').html(data.nickname);
        },
        error:function(error){
            console.log(error);
        }
    });

    //获得发布者的售卖信息
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/getselling_ext?uid="+pubUid+'&start=0&n=',
        dataType:"json",
        success: function(data){
            if(data.status == 200){
                data = JSON.parse(data.data);
                console.log("售卖信息",data);
                $('#sellingNum').html(data.length);
                $('#sellingTitle .sellingNum').html(data.length);
                if(data.length>5){
                    $('#moreSelling').show();
                    $('.sellingBox .selling .sellingList').addClass('sellingHeight');
                }
                for(var i=0; i<data.length; i++){
                    var priceStr = '';
                    if(data[i].price == 0){
                        priceStr = 'Negotiated';
                    }else{
                        priceStr = data[i].price;
                    }
                    $('.sellingBox .selling .sellingList').append(
                        '<a href="#" class="sellingLink"  style="background: url('+baseImgSrc+data[i].cimg+') no-repeat center center" >' +
                        '<img  style="opacity:0;background: url('+baseImgSrc+data[i].cimg+') no-repeat center center" class="goodImg" src='+''+'>' +
                        '<div class="row desc">' +
                        '<div class="col-xs-6 col-sm-6 left">'+data[i].title+'</div>' +
                        '<div class="col-xs-6 col-sm-6 right">'+priceStr+'</div>' +
                        '</div>' +
                        '</a>');
                    $('.sellingBox .selling .sellingList .sellingLink .goodImg').hover(
                        function(){
                            $(this).siblings('.desc').fadeIn();
                        },
                        function(){
                            $(this).siblings('.desc').fadeOut();
                        }
                    );
                    //点击某个跳转
                    $('.sellingBox .selling .sellingList .sellingLink').unbind('click').click(function(){
                        var index = $(this).index();
                        window.open("detail.html?id="+data[index].id);
//                            window.location.href = "detail.html?id="+data[index].id;
                    });
                    $('#moreSelling').unbind('click').click(function(){
                        $('.sellingBox .selling .sellingList').removeClass('sellingHeight');
                        $(this).hide();

                    });
                }

            }else{
                commonPopFun(data.msg, 'Failed');
            }
        },
        error:function(error){
            console.log(error);
        }
    });

    //获得当前用户收藏信息
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/getwish_ext?uid="+pubUid+'&action=user&start=0&n=',
        dataType:"json",
        success: function(data){
            if(data.status == 200){
                data = JSON.parse(data.data);
                console.log("收藏信息",data);
                $('#likeNum').html(data.length);
                $('#likeTitle .likeNum').html(data.length);
                if(data.length>5){
                    $('#moreLike').show();
                    $('.likeBox .like .likeList').addClass('likeHeight');
                }

                for(var i=0; i<data.length; i++){
                    var priceStr = '';
                    if(data[i].price == 0){
                        priceStr = 'Negotiated';
                    }else{
                        priceStr = data[i].price;
                    }
                    $('.likeBox .like .likeList').append(
                        '<a href="#" class="likeLink" style="background: url('+baseImgSrc+data[i].cimg+') no-repeat center center">' +
//                            '<img class="goodImg" src='+baseImgSrc+data[i].cimg+'>' +
                        '<img  style="opacity:0;background: url('+baseImgSrc+data[i].cimg+') no-repeat center center" class="goodImg" src='+''+'>' +
                        '<div class="row desc">' +
                        '<div class="col-xs-6 col-sm-6 left">'+data[i].title+'</div>' +
                        '<div class="col-xs-6 col-sm-6 right">'+priceStr+'</div>' +
                        '</div>' +
                        '</a>');
                    $('.likeBox .like .likeList .likeLink .goodImg').hover(
                        function(){
                            $(this).siblings('.desc').fadeIn();
                        },
                        function(){
                            $(this).siblings('.desc').fadeOut();
                        }
                    );
                    //点击某个跳转
                    $('.likeBox .like .likeList .likeLink').unbind('click').click(function(){
                        var index = $(this).index();
//                            alert(data[index].id);
                        window.open("detail.html?id="+data[index].id);
//                            window.location.href = "detail.html?id="+data[index].id;
                    });
                    $('#moreLike').unbind('click').click(function(){
                        $('.likeBox .like .likeList').removeClass('likeHeight');
                        $(this).hide();
                    });
                }

            }else{
                commonPopFun(data.msg, 'Failed');
            }
        },
        error:function(error){
            console.log(error);
        }
    });


    //获得评论信息(支持盖楼)
    /*var getcommentInfo = {
     "token":token,			//登录凭证，当action="user" 时必须指定
     "goodid":"",		//商品ID, 当action="good" 时必须指定
     "action":"user",	//good 或者 user,指定为good时获得该商品的评论信息，指定为user时获得该用户的评论信息
     "start":"",			//从第几条开始
     "num":""			//获得几条,最多20条
     };
     $.ajax({
     type:"POST",
     url:baseUrl + "/apigateway/getcomment",
     dataType:"json",
     data:JSON.stringify(getcommentInfo),
     success:function(data){
     //console.log(data);
     if(data.status == 200){
     data = JSON.parse(data.data);
     console.log("获得评论信息(支持盖楼)",data);
     $('#messageNum').html(data.length);
     $('.messageBox .messageNum').html(data.length);
     }else if(data.status == 501){//token失效
     //                    commonPopFun(data.msg);
     $('#messageNum').html(0);
     $('.messageBox .messageNum').html(0);
     }else{
     //                    commonPopFun(data.msg);
     $('#messageNum').html(0);
     $('.messageBox .messageNum').html(0);
     }
     },
     error:function(error){
     console.log(error);
     $('#messageNum').html(0);
     $('.messageBox .messageNum').html(0);
     }
     });*/

});