$(function(){


    //tab切换
    $('.detailBox .detail .detailLeft .tabToggle .tabLink').click(function () {
        alert(1);
        var index = $(this).index();
        $('.detailBox .detail .detailLeft .tabToggle .tabLink').removeClass("active").eq(index).addClass("active");
    });

    //
    $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .userBtn .getPhone .right .rightText').unbind('click').click(function(){
        window.location.href = 'login.html';
    });


    //商品发布者的nickname
    var nickname = '';


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
    $('#fackbookNeedId').attr('data-href', "http://www.kalichimall.com:81/detail.html"+window.location.search);

    //图片预览
    $('#dowebok').viewer({});




    //获得指定产品的产品信息
//        var goodIdFromCategory = localStorage.getItem("goodIdFromCategory");
    var goodIdFromCategory = getParamByUrl('id');
//        alert(goodIdFromCategory);
    var getGoodPhone = '';
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/getgood?id="+goodIdFromCategory,
//            url: baseUrl+"/apigateway/getgood?id="+4,
        dataType:"json",
        success: function(data){
            if(data.status == 200){
                data = JSON.parse(data.data);
                console.log("获得指定产品的产品信息",data);
                console.log(baseUrl+"/apigateway/getgood?id="+goodIdFromCategory);
                getGoodPhone = data.phone;


                $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .attr .view').html(data.views);


                var nowGoodCid = data.cid;
                //searchLeft箭头右侧显示内容：
                $.ajax({
                    type: "get",
                    url: baseUrl+"/apigateway/categorys",
                    dataType:"json",
                    success: function(data){
                        if(data.status == 200){
                            data = JSON.parse(data.data);
                            console.log("获得产品分类",data);
                            var categorysNameArr = [];
                            var categorysCidArr = [];
                            for(var i=0; i<data.length; i++){
                                var sub = data[i].sub;
                                for(var j=0; j<sub.length; j++){
                                    categorysNameArr.push(sub[j].name);
                                    categorysCidArr.push(sub[j].cid);
                                }
                            }
                            console.log('categorysNameArr',categorysNameArr);
                            console.log('categorysCidArr',categorysCidArr);

                            for(var i=0; i<categorysCidArr.length; i++){
                                if(categorysCidArr[i] == nowGoodCid){
                                    $('.searchBox .search .searchLeft .second').html(categorysNameArr[i]);
                                }
                            }
                        }
                    },
                    error:function(error){
                        console.log(error);
                    }
                });



                //aboutQuality
                var aboutQuality = '';
                if(data.goodstatus == 0){
                    aboutQuality = 'Brand New';
                }else if(data.goodstatus == 1){
                    aboutQuality = 'New';
                }else if(data.goodstatus == 2){
                    aboutQuality = 'As New';
                }else if(data.goodstatus == 3){
                    aboutQuality = 'A Half New';
                }
                $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .attr .quality').html(aboutQuality);

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
                localStorage.setItem('pubUid',pubUid);


                //获得发布者的售卖信息
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
                            /*if(data.length>4){
                             $('#publishNum').html(4);
                             }else{
                             $('#publishNum').html(data.length);
                             }*/
                            var goodIdArr = [];
                            for(var i=0; i<data.length; i++){
                                goodIdArr.push(data[i].id);
                            }
                            if((pubUid == 0)){
                                for(var i=0; i<data.length; i++){
                                    $('.detailBox .detail .detailRight .selling .sellingListBox').append(
                                        '<div class="col-xs-6 col-sm-6 sellingList"><img class="sellingImg" src='+baseImgSrc+data[i].cimg+'></div>'
                                    );
                                }
                            }else{
                                if(data.length <= 4){
                                    for(var i=0; i<data.length; i++){
                                        $('.detailBox .detail .detailRight .selling .sellingListBox').append(
                                            '<div class="col-xs-6 col-sm-6 sellingList"><img class="sellingImg" src='+baseImgSrc+data[i].cimg+'></div>'
                                        );
                                    }
                                }else{
                                    $('.detailBox .detail .detailRight .selling .more').show();
                                    for(var i=0; i<4; i++){
                                        $('.detailBox .detail .detailRight .selling .sellingListBox').append(
                                            '<div class="col-xs-6 col-sm-6 sellingList"><img class="sellingImg" src='+baseImgSrc+data[i].cimg+'></div>'
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
                            commonPopFun(data.msg, 'Failed');
                        }
                    },
                    error:function(error){
                        console.log(error);
                    }
                });


                var imgs = data.imgs;
                var imgsArr = imgs.split(',');
                console.log(imgsArr);
                for(var i=0; i<imgsArr.length; i++){

                    //获取图片的真实宽高
                    var real_width,real_height,
                        im = document.createElement('img');
                    im.src= baseImgSrc+imgsArr[i];
//                                real_width  = im.width,
//                                real_height = im.height;

                    var showLittleImgBgStr = '';
                    if((data.status == 1) || (data.status == 2)){
                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPicWrapBg').show();
                        showLittleImgBgStr = '<div class="isShowLittleImgBg" style="width: 100%;height: 100%;line-height:80px; position: absolute;text-align:center;background: RGBA(0,0,0,0.4);">' +
                            '<span style="color: #FF4720;font-size: 1.4rem;font-weight: bold;">offline</span>' +
                            '</div>';
                    }

                    /*if(im.width>im.height){
                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul').append('' +
                            '<li class="img_li" style="position:relative; background: url('+baseImgSrc+imgsArr[i]+') no-repeat center center;background-size: 100% auto;">' +
                            showLittleImgBgStr+
                            '<img style="opacity: 0;" src='+baseUrl+'/gimg/'+imgsArr[i]+'>' +
                            '</li>');
                    }else{
                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul').append('' +
                            '<li class="img_li" style="position:relative; background: url('+baseImgSrc+imgsArr[i]+') no-repeat center center;background-size: auto 100%;">' +
                            showLittleImgBgStr+
                            '<img style="opacity: 0;" src='+baseUrl+'/gimg/'+imgsArr[i]+'>' +
                            '</li>');
                    }*/
                    if(im.width>im.height){
                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul').append('' +
                            '<li class="img_li" style="position:relative;"><div class="img_liBg" style="display:none;position: absolute;width: 100%;height: 100%;background: RGBA(0,0,0,0.1);"></div>' +
                            showLittleImgBgStr+
                            '<img style="" src='+baseUrl+'/gimg/'+imgsArr[i]+'>' +
                            '</li>');
                    }else{
                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul').append('' +
                            '<li class="img_li" style="position:relative;"><div class="img_liBg" style="display:none;position: absolute;width: 100%;height: 100%;background: RGBA(0,0,0,0.1);"></div>' +
                            showLittleImgBgStr+
                            '<img style="" src='+baseUrl+'/gimg/'+imgsArr[i]+'>' +
                            '</li>');
                    }

                }

                //切换大图的左右按钮
                $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPic').attr('src', baseUrl+'/gimg/'+imgsArr[0]);
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

//                    alert(hei);
                var timer = setInterval(function(){
                    if($('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPic').width() != 0){
                        clearInterval(timer);
                        var bigImgPicHeight = $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPic').height();
                        var bigImgPicWidth = $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPic').width();
//                            alert(bigImgPicWidth);
//                            alert(bigImgPicHeight);
                        /*if(bigImgPicWidth >= bigImgPicHeight){
                            $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg').css({
                                'background': 'url('+baseImgSrc+imgsArr[0]+') no-repeat center center',
//                                    'backgroundSize': '100% auto',
                                'backgroundSize': 'auto 100%'
                            });
                        }else{
                            $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg').css({
                                'background': 'url('+baseImgSrc+imgsArr[0]+') no-repeat center center',
                                'backgroundSize': 'auto 100%'
                            });
                        }*/
                    }
                }, 100);

                var moveNum = 0;
                var imgsLength = imgsArr.length;
                $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .leftFlag').click(function(){
                    if(moveNum != 0){
                        moveNum --;
                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul').animate({'left': -111*moveNum+'px'}, 'ease');
                    }
                });
                $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .rightFlag').click(function(){
                    if((imgsLength > 4) && (moveNum<(imgsLength-4))){
                        moveNum ++;
                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul').animate({'left': -111*moveNum+'px'}, 'ease');
                    }
                });
                $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul .img_li').click(function(){
                    var index = $(this).index();
                    thisImg = index;
                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPic').attr('src', $(this).children('img').attr('src'));
//                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg .bigImgPic').css('background', 'url('+$(this).children('img').attr('src')+') no-repeat center center');

                    //新增
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .littleImg .img_ul .img_li').children('.img_liBg').hide();
                    $(this).children('.img_liBg').show();

                    //获取图片的真实宽高
                    var real_width,real_height,
                        im = document.createElement('img');
                    im.src= $(this).children('img').attr('src'),
                        real_width  = im.width,
                        real_height = im.height;
                    /*if(real_width>=real_height){
                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg').css({
                            'background': 'url('+$(this).children('img').attr('src')+') no-repeat center center',
//                                'backgroundSize': '100% auto',
                            'backgroundSize': 'auto 100%'
                        });
                    }else{
                        $('.detailBox .detail .detailLeft .goodDesc .goodDescLeft .bigImg').css({
                            'background': 'url('+$(this).children('img').attr('src')+') no-repeat center center',
                            'backgroundSize': 'auto 100%'
                        });
                    }*/

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
                            for(let i=0; i<locationArr1.length; i++){
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
                            }
                            $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .attr .address').html(addressStr +' '+addressStr2 +' '+ data.addr_l4);


                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });


                //price
                if(data.price == 0){
                    $('#mianYi').html("Negotiated").css({"color":'#FF4720',"paddingLeft":'8px'});
                }else{
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .attr .aboutNum').show();
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .attr .price').html(data.price);
                }



                //获得商品发布者用户信息
                $.ajax({
                    type: "get",
                    url: baseUrl+"/apigateway/getuserinfo_pub?uid="+pubUid+"&token="+token,
                    dataType:"json",
                    success: function(data){
                        console.log('获得商品发布者用户信息', data);
                        data = data.data;
                        //详情页信息
                        nickname = data.nickname;
                        if(nickname == ''){
                            nickname = data.phone;
                        }

                        $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .userBtn .getPhone .left .leftText').html(data.phone);

                        $('.detailBox .detail .detailRight .userInfo .userInfoImg').show().attr('src',baseImgSrc+data.logo);
                        $('.detailBox .detail .detailRight .name').html(data.nickname.substring(0,6)+'xxxx');
                        $('.detailBox .detail .detailRight .goHome').html(data.nickname.substring(0,6)+'xxxx' + '\'s home').click(function(){
                            window.location.href = 'profile.html?pubUid='+pubUid;
                        });


                        //匿名发布隐藏
                        if(data.id != 0){
                            $('.detailBox .detail .detailRight .talk').css('visibility', 'inherit');
                        }
                        if(data.id == 0){
                            if($('.searchBox .search .searchLeft .second').html() == ''){
                                $('.searchBox .search .searchLeft .second').html('...');
                            }
                        }
                    },
                    error:function(error){
                        console.log(error);
                    }
                });




            }else{
                commonPopFun(data.msg, 'Failed');
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
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .userBtn .btn3 img').attr("src", "image/detailPage/remove.png");
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .userBtn .btn3 span').html("Remove");

                }else{//如果默认未收藏
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .userBtn .btn3 img').attr("src", "image/detailPage/asMyWish.png");
                    $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .userBtn .btn3 span').html("As my favorite");
                }

                $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .userBtn .btn3').click(function () {
                    if(token == null){
//                            alert('请先登录~');
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
                                        $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .userBtn .btn3 img').attr("src", "image/detailPage/asMyWish.png");
                                        $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .userBtn .btn3 span').html("As my favorite");
                                    }else{
                                        commonPopFun(data.msg, 'Failed');
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
                                        $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .userBtn .btn3 img').attr("src", "image/detailPage/remove.png");
                                        $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .userBtn .btn3 span').html("Remove");
                                        isCollect = true;
                                    }else{
                                        commonPopFun(data.msg, 'Failed');
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
//                            $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .userBtn .getPhone .left .leftText').html(getGoodPhone);
                        $('.detailBox .detail .detailLeft .goodDesc .goodDescRight .userBtn .getPhone .right .rightText').hide();
                    }
                }, 100);


                var timer2 = setInterval(function(){
                    if(nickname != ''){
                        clearInterval(timer2);
                        $('.detailBox .detail .detailRight .name').html(nickname);
                        $('.detailBox .detail .detailRight .goHome').html(nickname + '\'s home');
                    }
                }, 100);


            }else{
//                    commonPopFun(data.msg, 'Failed');
            }
        },
        error:function(error){
            console.log(error);
        }
    });



    ////点击tipOff
    $('.detailBox .detail .detailLeft .tipOff').click(function(event){
        event.stopPropagation();
        $('#tipOffPopBox').show();
    });
    $('.tipOffPopBox .tipOffBox').click(function(event){
        event.stopPropagation();
    });
    $('.tipOffPopBox').click(function(event){
        event.stopPropagation();
        $('.tipOffPopBox').hide();
    });
    $('.tipOffPopBox .tipOffBox .submit .submitBtn').unbind('click').click(function(event){
        if($('.tipOffPopBox .tipOffBox #detail').val()){
            event.stopPropagation();
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
            $.ajax({
                type:"POST",
                url:baseUrl + "/apigateway/subtipoff",
                dataType:"json",
                data:JSON.stringify(subtipoffInfo),
                success:function(data){
                    console.log('提交投诉', data);
                    if(data.status == 200){
                        console.log('提交投诉', data);
                        commonPopFun(data.data, 'Successfully');
                    }else{
                        commonPopFun(data.msg, 'Failed');
                    }
                },
                error:function(error){
                    console.log(error);
                }
            });
        }else{
            $('#detail').css('border', '1px solid red');
        }
    });








});