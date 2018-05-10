$(function(){

    //opera mini
    try {
     window.localStorage.foobar = "foobar";
     } catch (_) {
        //显示底部收藏等信息
        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .aboutPrice').css('bottom', '0.95rem');
        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .aboutShare').css('bottom', '0.75rem');
     }


    $('.detailBox .detail .detailLeft .getPhone .right .rightText').unbind('click').click(function(){
        window.location.href = "login.html?goLogin="+1;
    });

    //headerBox
    //显示地址列表
    //var areaId = localStorage.getItem("areaId");
    var areaId = getCookie("areaId");
    //var areaName = localStorage.getItem("areaName");
    var areaName = getCookie("areaName");
    $.ajax({
        type:'get',
        url:baseUrl+"/apigateway/areas",
        success:function(data){
            if (data.status == 200){
                data = JSON.parse(data.data);
                console.log("获得区域信息", data);
                var areaIdArr = [];
                var areaNameArr = [];
                for (var areas in data){
                    areaIdArr.push(data[areas].id);
                    areaNameArr.push(data[areas].name);
                }
                console.log(areaNameArr);
                console.log(areaIdArr);
                if(areaId == null){
                    //localStorage.setItem('areaId', areaIdArr[0]);
                    setCookie('areaId', areaIdArr[0], 1);
                    //localStorage.setItem('areaName', areaNameArr[0]);
                    setCookie('areaName', areaNameArr[0], 1);
                    $('.headerBox .indexMiddle .address').html(areaNameArr[0]);
                }else{
                    $('.headerBox .indexMiddle .address').html(areaName);
                }

                //动态添加addressUl
                for(var i=0; i<areaNameArr.length; i++){
                    $('.headerBox .indexMiddle .addressUl').append('<li class="addressLi">'+areaNameArr[i]+'</li>');
                }

                //点击地址
                $('.headerBox .indexMiddle .address').unbind('click').click(function(ev){
                    ev.stopPropagation();
                    $('.headerBox .indexMiddle .addressUl').slideToggle();
                });
                //重点：点击除div之外的任意位置隐藏div
                $(document).unbind('click').click(function(){
                    $('.headerBox .indexMiddle .addressUl').slideUp();//地址列表
                });

                //选择地址
                $('.headerBox .indexMiddle .addressUl .addressLi').unbind('click').click(function(){
                    var index = $(this).index();
                    //localStorage.setItem('areaId', areaIdArr[index]);
                    setCookie('areaId', areaIdArr[index], 1);
                    //localStorage.setItem('areaName', areaNameArr[index]);
                    setCookie('areaName', areaNameArr[index], 1);
                    $('.headerBox .indexMiddle .address').html(areaNameArr[index]);
                    $('.headerBox .indexMiddle .addressUl').hide();
                });

                //不显示默认地址
                $('.headerBox .indexMiddle .addressUl .addressLi').each(function(index){
                    if($('.headerBox .indexMiddle .addressUl .addressLi').eq(index).html() == ''){
                        $(this).hide();
                        $('.headerBox .indexMiddle .addressUl .addressLi').eq(index-1).css('borderBottom','1px solid #333333');
                    }
                });

            }else{
                commonPopFun1(data.msg, 'Failed');
            }
        },
        error:function(error){
            console.log(error);
        }
    });


    /*facebook发布评论*/
    $('#fackbookNeedId').attr('data-href', "http://www.kalichimall.com:81/detail.html"+window.location.search);


    //tab切换
    $('.detailBox .detail .detailLeft .tabToggle .tabLink').click(function () {
        var index = $(this).index();
        $('.detailBox .detail .detailLeft .tabToggle .tabLink').removeClass("active").eq(index).addClass("active");
    });


    //获得指定产品的产品信息
//        var goodIdFromCategory = localStorage.getItem("goodIdFromCategory");
    var goodIdFromCategory = getParamByUrl('id');
    var getGoodPhone = '';
//        alert(goodIdFromCategory);
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/getgood?id="+goodIdFromCategory,
//            url: baseUrl+"/apigateway/getgood?id="+4,
        dataType:"json",
        success: function(data){
            console.log('获得指定产品的产品信息',data);
            if(data.status == 200){
                data = JSON.parse(data.data);
                console.log("获得指定产品的产品信息",data);
                console.log(baseUrl+"/apigateway/getgood?id="+goodIdFromCategory);
                getGoodPhone = data.phone;

                //新增（产品新旧）
                var newOrOld = '';
                if(data.goodstatus == 0){
                    newOrOld = 'Brand New';
                }else if(data.goodstatus == 1){
                    newOrOld = 'New';
                }else if(data.goodstatus == 2){
                    newOrOld = 'As New';
                }else if(data.goodstatus == 3){
                    newOrOld = 'A Half New';
                }
                $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .newOrOld').html(newOrOld);

                //修改title
                $('#detailTitle').html(data.title + data.price +" kalichimall, make money by your second-hand goods.");


                //tab切换
                if($('.detailBox .detail .detailLeft .tabToggle .tabLink').eq(0).hasClass('active')){
                    $('#detailContent').html(data.title);
                }
                $('.detailBox .detail .detailLeft .tabToggle .tabLink').click(function () {
                    var index = $(this).index();
                    $('.detailBox .detail .detailLeft .tabToggle .tabLink').removeClass("active").eq(index).addClass("active");
                });

                //tab切换
                $('#detailContent').show().html(data.details);
                $('.detailBox .detail .detailLeft .tabToggle .tabLink').unbind('click').click(function () {
                    var index = $(this).index();
                    $('.detailBox .detail .detailLeft .tabToggle .tabLink').removeClass("active").eq(index).addClass("active");
                    if($('.detailBox .detail .detailLeft .tabToggle .tabLink').eq(0).hasClass('active')){
                        $('#commentsContent').hide();
                        $('#detailContent').show().html(data.details);
                    }
                    if($('.detailBox .detail .detailLeft .tabToggle .tabLink').eq(1).hasClass('active')){
                        $('#detailContent').hide();
                        $('#commentsContent').show();
                    }
                });


                //保存当前商品的发布者uid
                var pubUid = data.uid;
                //localStorage.setItem('pubUid',pubUid);
                setCookie('pubUid',pubUid, 1);


                /*//获得发布者的售卖信息
                 //.detailBox .detail .detailRight .selling .sellingListBox
                 //<div class="col-xs-6 col-sm-6 sellingList"><img class="sellingImg" src="image/detailPage/selling1.jpg"></div>
                 $.ajax({
                 type: "get",
                 url: baseUrl+"/apigateway/getselling_ext?uid="+pubUid+'&start=0&n=',
                 dataType:"json",
                 success: function(data){
                 if(data.status == 200){
                 data = JSON.parse(data.data);
                 console.log("售卖信息",data);
                 $('#publishNum').html(data.length);
                 var goodIdArr = [];
                 for(var i=0; i<data.length; i++){
                 goodIdArr.push(data[i].id);
                 }
                 if((pubUid == 0)){
                 for(var i=0; i<data.length; i++){
                 $('.detailBox .detail .detailRight .selling .sellingListBox').append(
                 '<div class="col-xs-6 col-sm-6 sellingList"><img class="sellingImg" src='+data.cimg+'></div>'
                 );
                 }
                 }else{
                 if(data.length <= 4){
                 for(var i=0; i<data.length; i++){
                 $('.detailBox .detail .detailRight .selling .sellingListBox').append(
                 '<div class="col-xs-6 col-sm-6 sellingList"><img class="sellingImg" src='+data.cimg+'></div>'
                 );
                 }
                 }else{
                 $('.detailBox .detail .detailRight .selling .more').show();
                 for(var i=0; i<4; i++){
                 $('.detailBox .detail .detailRight .selling .sellingListBox').append(
                 '<div class="col-xs-6 col-sm-6 sellingList"><img class="sellingImg" src='+data.cimg+'></div>'
                 );
                 }
                 }
                 }

                 $('.detailBox .detail .detailRight .selling .sellingListBox .sellingList').unbind('click').click(function () {
                 var index = $(this).index();
                 //                                    alert(goodIdArr[index]);
                 window.open("detail.html?id="+goodIdArr[index]);
                 });

                 $('.detailBox .detail .detailRight .selling .more .moreLink').unbind('click').click(function () {
                 window.open("profile.html?pubUid="+pubUid);
                 });

                 }else{
                 commonPopFun1(data.msg, 'Failed');
                 }
                 },
                 error:function(error){
                 console.log(error);
                 }
                 });*/





//                    alert($('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPicWrap .bigImgPic').width());


                var imgs = data.imgs;
                var imgsArr = imgs.split(',');




                //大图、小图背景是否变暗
                var ShowLittleImgBgStr = '';
                if((data.status == 1) || (data.status == 2)){
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .aboutShare .btn3').hide();
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPicWrapBg').show();
                    ShowLittleImgBgStr = '<div class="isShowLittleImgBg" style="width: 100%;height: 100%;position: absolute;text-align:center;background: RGBA(0,0,0,0.4);z-index: 9;padding-top: 1.375rem;">' +
                        '<span style="color: #FF4720;font-size: 1.4rem;font-weight: bold;">offline</span>' +
                        '</div>';
                }


                /*for(var i=0; i<imgsArr.length; i++){
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul').append('<li class="img_li" style="position:relative; background: url('+baseImgSrc+imgsArr[i]+') no-repeat center center;background-size:100% auto;">' +
                        ShowLittleImgBgStr+
                        '<img style="opacity:0;" src='+baseUrl+'/gimg/'+imgsArr[i]+'>' +
                        '</li>');
                }*/
                for(var i=0; i<imgsArr.length; i++){
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul').append('<li class="img_li" style="position:relative; "><div class="img_liBg" style="display:none;position: absolute;width: 100%;height: 100%;background: RGBA(0,0,0,0.1);"></div>' +
                        ShowLittleImgBgStr+
                        '<img style="" src='+baseUrl+'/gimg/'+imgsArr[i]+'>' +
                        '</li>');
                }


                //切换大图的左右按钮
                $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPic').css('visibility','inherit').attr('src', baseUrl+'/gimg/'+imgsArr[0]);
                $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul .img_li').eq(0).children('.img_liBg').show();
                var thisImg = 0;
                $('#nextBigPic').unbind('click').click(function(){
                    thisImg ++;
                    clickBigImgBtn();
                });
                $('#lastBigPic').unbind('click').click(function(){
                    thisImg --;
                    clickBigImgBtn();
                });
                function clickBigImgBtn(){
                    if(thisImg == imgsArr.length){
                        thisImg = 0;
                    }
                    if(thisImg == -1){
                        thisImg = imgsArr.length-1;
                    }
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPic').css('visibility','inherit').attr('src', baseUrl+'/gimg/'+imgsArr[thisImg]);
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul .img_li').children('.img_liBg').hide();
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul .img_li').eq(thisImg).children('.img_liBg').show();
                }
                //$('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPicWrap').css('background','url('+baseImgSrc+imgsArr[0]+') no-repeat center center');
//                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPicWrap').css('backgroundSize','100%');
                var moveNum = 0;
                var imgsLength = imgsArr.length;
                $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .leftFlag').click(function(){
                    if(moveNum != 0){
                        moveNum --;
                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul').animate({'left': -77*moveNum+'px'}, 'ease');
                    }
                });
                $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .rightFlag').click(function(){
                    if((imgsLength > 4) && (moveNum<(imgsLength-4))){
                        moveNum ++;
                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul').animate({'left': -82*moveNum+'px'}, 'ease');
                    }
                });
                $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul .img_li').click(function(){
                    var index = $(this).index();
                    thisImg = index;
                    var src = $(this).children('img').attr('src');
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPic').attr('src', $(this).children('img').attr('src'));

                    //新增
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul .img_li').children('.img_liBg').hide();
                    $(this).children('.img_liBg').show();

                    //$('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPicWrap').css('background','url('+$(this).children('img').attr('src')+') no-repeat center center');
//                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPicWrap').css('backgroundSize','100%');

                });

                //获取title
                $('.detailBox .detail .detailLeft .goodName').html(data.title);

                //locationArr2  地址，3，发布价格

                //获取地址
                var locationArr1 = [];
                var locationIdArr1 = [];
                var locationArr2 = [];
                var addressStr = '';
                var addressStr2 = '';
                $.ajax({
                    type: "get",
                    url: baseUrl+"/apigateway/areas",
                    dataType:"json",
                    success: function(data2){
                        if (data2.status == 200){
                            data2 = JSON.parse(data2.data);
                            console.log("获得区域信息2", data2);
                            var locationArr1 = [];
                            var locationArr2 = [];
                            for (var sort in data2){
                                locationArr1.push(data2[sort].name);
                                locationIdArr1.push(data2[sort].id);
                                locationArr2.push(data2[sort].sub);
                            }

                            console.log('locationArr1',locationArr1);
                            console.log('locationArr2',locationArr2);
                            for(var i=0; i<locationArr1.length; i++){
                                (function(i){
                                    if(locationIdArr1[i] == data.addr_l1){
//                                        alert(i);
                                        console.log(i);
                                        addressStr += locationArr1[i];

                                        for(var j=0; j<locationArr2[i].length; j++){
                                            for (var info in locationArr2[i][j]){
                                                //console.log('locationArr2[i][j][info]',locationArr2[i][j]);
                                                if(locationArr2[i][j].id == data.addr_l2){
//                                                    alert(j);
                                                    addressStr2 = locationArr2[i][j].name;
                                                }
                                            }
                                        }


                                    }
                                })(i);
                            }
                            $('.detailBox .detail .detailLeft .attr .addressText').html(addressStr +' '+addressStr2 +' '+ data.addr_l4);


                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });


                //price
                if(data.price == 0){
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .thePrice').show().html("Negotiated").css({"color":'#FF4720'});
                    $('#mianYi').html("Negotiated").css({"color":'#FF4720',"paddingLeft":'8px'});
                }else{
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .thePrice').show();
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .thePrice .thePriceNum').html(data.price);
                }



                //获得商品发布者用户信息
                $.ajax({
                    type: "get",
                    url: baseUrl+"/apigateway/getuserinfo_pub?uid="+pubUid+"&token="+token,
                    dataType:"json",
                    success: function(data){
                        console.log('获得商品发布者用户信息', data);
                        data = data.data;

                        //显示用户手机号
                        $('.detailBox .detail .detailLeft .getPhone .left .leftText').html(data.phone);

                        //详情页信息
                        $('.detailBox .detail .detailLeft .headImg').show().attr('src',baseImgSrc+data.logo).click(function(){
                            window.location.href = 'profile.html?pubUid='+pubUid;
                        });
                        /*$('.detailBox .detail .detailRight .userInfo .userInfoImg').show().attr('src',baseImgSrc+data.logo);
                         $('.detailBox .detail .detailRight .name').html(data.nickname);
                         $('.detailBox .detail .detailRight .goHome').html(data.nickname + '\'s home').click(function(){
                         window.location.href = 'profile.html?pubUid='+pubUid;
                         });*/


                        //匿名发布隐藏
                        /*if(data.id != 0){
                         $('.detailBox .detail .detailRight .talk').css('visibility', 'inherit');
                         }*/
                    },
                    error:function(error){
                        console.log(error);
                    }
                });




            }else{
                commonPopFun1(data.msg, 'Failed');
            }
        },
        error:function(error){
            console.log(error);
        }
    });



    //点击收藏/取消收藏

    //获得收藏信息
    if(token == null){
        token = '';
    }
    var checkwishInfo = {
        "token":token,
        "goodid":getParamByUrl('id'),
        "timestamp":timestamp
    };
    $.ajax({
        type:"POST",
        url:baseUrl + "/apigateway/checkwish",
        dataType:"json",
        data:JSON.stringify(checkwishInfo),
        success:function(data){
            console.log(data);
            if(data.status == 200){
                console.log("检测指定商品是否被当前用户收藏",data);
                var isCollect;
                if(data.data == 0){
                    isCollect = false;
                }else if(data.data == 1){
                    isCollect = true;
                }

                if(isCollect == true){//如果默认已经收藏
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .aboutShare .btn3 img').attr("src", "image/detailPage/remove.png");
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .aboutShare .btn3 span').html("Remove");

                }else{//如果默认未收藏
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .aboutShare .btn3 img').attr("src", "image/detailPage/asMyWish.png");
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .aboutShare .btn3 span').html("As my favorite");
                }

                $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .aboutShare .btn3').click(function () {
                    if(token == null){
                        alert('请先登录~');
                    }else{
                        if(isCollect == true){//如果默认已经收藏
                            //删除收藏
                            var delwishInfo = {
                                "token":token, 			//用户登录凭证，必须登录状态
                                "goodid":getParamByUrl('id'),			//产品ID
                                "timestamp":timestamp
                            };
                            $.ajax({
                                type:"POST",
                                url:baseUrl + "/apigateway/delwish",
                                dataType:"json",
                                data:JSON.stringify(delwishInfo),
                                success:function(data){
                                    //console.log(data);
                                    if(data.status == 200){
//                    data = JSON.parse(data.data);
                                        console.log("删除收藏",data);
                                        isCollect = false;
                                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .aboutShare .btn3 img').attr("src", "image/detailPage/asMyWish.png");
                                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .aboutShare .btn3 span').html("As my favorite");
                                    }else if(data.status == 501){//token失效
                                        commonPopFun1(data.msg, 'Failed');
                                    }else{
                                        commonPopFun1(data.msg, 'Failed');
                                    }
                                },
                                error:function(error){
                                    console.log(error);
                                }
                            });
                        }else{//如果默认未收藏
                            //提交收藏
                            var putwishInfo = {
                                "token":token, 			//用户登录凭证，必须登录状态
                                "goodid":getParamByUrl('id'),			//产品ID
                                "timestamp":timestamp
                            };
                            $.ajax({
                                type:"POST",
                                url:baseUrl + "/apigateway/putwish",
                                dataType:"json",
                                data:JSON.stringify(putwishInfo),
                                success:function(data){
                                    //console.log(data);
                                    if(data.status == 200){
//                    data = JSON.parse(data.data);
                                        console.log("提交收藏",data);
                                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .aboutShare .btn3 img').attr("src", "image/detailPage/remove.png");
                                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .aboutShare .btn3 span').html("Remove");
                                        isCollect = true;
                                    }else if(data.status == 501){//token失效
                                        commonPopFun1(data.msg, 'Failed');
                                    }else{
                                        commonPopFun1(data.msg, 'Failed');
                                    }
                                },
                                error:function(error){
                                    console.log(error);
                                }
                            });
                        }
                    }

                });

                //如果用户登录了，显示完整的手机号
                var timer = setInterval(function(){
                    if(getGoodPhone != ''){
                        clearInterval(timer);
//                            $('.detailBox .detail .detailLeft .getPhone .left .leftText').html(getGoodPhone);
                        $('.detailBox .detail .detailLeft .getPhone .right .rightText').hide();
                    }
                }, 100);

            }else if(data.status == 501){//token失效
//                    commonPopFun1(data.msg, 'Failed');
            }else{
//                    commonPopFun1(data.msg, 'Failed');
            }
        },
        error:function(error){
            console.log(error);
        }
    });


//        $('.tipOffPopBox .tipOffBox').css('top',($(window).height() - $(".tipOffPopBox .tipOffBox").height())/2.6);

    ////点击tipOff
    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .tipOff').click(function(event){
        event.stopPropagation();
        $('#tipOffPopBox').show();
        $('body, html').css({
            'overflow': 'hidden',
            'height':'100%'
        });
    });


    ////新增 关闭tipOff
    $('.tipOffPopBox .tipOffBox .closeTipOff').click(function(event){
        event.stopPropagation();
        $('#tipOffPopBox').hide();
        $('body, html').css({
            'overflow': 'auto',
            'height':'auto'
        });
    });

    /*$('.tipOffPopBox .tipOffBox').click(function(event){
        event.stopPropagation();
    });
    $('.tipOffPopBox').click(function(event){
        event.stopPropagation();
//            $('.tipOffPopBox').hide();
    });*/
    $('.tipOffPopBox .tipOffBox .submit .submitBtn').unbind('click').click(function(event){
        event.stopPropagation();
        if($('.tipOffPopBox .tipOffBox #detail').val() != ''){
            $('.tipOffPopBox').hide();
            //提交投诉
            if(token == null){
                token = '';
            }
            var subtipoffInfo = {
                "token":token, 			//有token,传token,没有就不传了，当做匿名了
                "goodid":goodIdFromCategory,			//产品ID
                "content":$('.tipOffPopBox .tipOffBox #detail').val(),			//投诉内容
                "phonenumber":$('.tipOffPopBox .tipOffBox #content').val(),		//联系电话
                "timestamp":timestamp			//时间戳
            };
            console.log(subtipoffInfo);
            $.ajax({
                type:"POST",
                url:baseUrl + "/apigateway/subtipoff",
                dataType:"json",
                data:JSON.stringify(subtipoffInfo),
                success:function(data){
                    console.log(data);
                    if(data.status == 200){
                        console.log('提交投诉', data);
                        commonPopFun1(data.data,'Successfully');
                    }else{
                        commonPopFun1(data.msg, 'Failed');
                    }
                },
                error:function(error){
                    console.log(error);
                }
            });
        }else{
            $('.tipOffPopBox .tipOffBox #detail').css('border', '1px solid red');
        }
    });


});