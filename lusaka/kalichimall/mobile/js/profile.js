$(function(){


    /*facebook发布评论*/
    $('#fackbookNeedId').attr('data-href', "http://www.kalichimall.com:81/profile.html"+window.location.search);


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

//                $('.headerBox .profileMiddle').html(data.nickname+'\' Home');
            $('.headerBox .profileMiddle').html(data.nickname);

            //修改title
            $('#profileTitle').html(data.nickname + "'s home. kalichimall, make money by your second-hand goods.");

            //详情页信息
            $('.searchBox .search .searchLeft .part1 .headImg img').show().attr('src',baseImgSrc+data.logo);
            /*.click(function(){
             //                    window.location.href = 'manage.html?pubUid='+pubUid;
             window.location.href = 'manage.html';
             });*/
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
                if(data.length>4){
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
                        '<a href="#" class="col-xs-3 col-sm-3 sellingLink">' +
                        '<span class="goodImgWrap" style="background: url('+baseImgSrc+data[i].cimg+') no-repeat center center;background-size:100% auto;"></span>' +
                        '<img style="display: none;" class="goodImg" src='+baseImgSrc+data[i].cimg+'>' +
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
                commonPopFun1(data.msg, 'Failed');
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
                if(data.length>4){
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
                        '<a href="#" class="col-xs-3 col-sm-3 likeLink">' +
                        '<span class="goodImgWrap" style="background: url('+baseImgSrc+data[i].cimg+') no-repeat center center;background-size:100% auto;"></span>' +
                        '<img style="display: none;" class="goodImg" src='+baseImgSrc+data[i].cimg+'>' +
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
                commonPopFun1(data.msg, 'Failed');
            }
        },
        error:function(error){
            console.log(error);
        }
    });


});