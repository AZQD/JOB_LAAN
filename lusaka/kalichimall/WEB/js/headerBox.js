$(function(){
    $('.headerBox .header .headerRight .home').click(function () {
        window.location.href = 'index.html';
    });
    /*$('.headerBox .header .headerRight .help').click(function () {
        window.location.href = 'help.html';
    });*/
    if(token == null){//用户未登陆
        console.log("用户未登陆（没有token）");

        //publish.html
        $('.publishPopBox').show();
        $('.publishPopBox').css('top', $(window).scrollTop());
        //$('body').css('overflow', 'hidden');


        $('.headerBox .header .headerRight1').show();
        $('.headerBox .header .headerRight .login, .headerBox .header .headerRight .register').unbind('click').click(function(){
            window.location.href = "login.html?goLogin="+1;
        });
    }else{
        var authInfo = {
            "token":token,
            "timestamp":timestamp
        };
        $.ajax({
            type:"POST",
            url:baseUrl + "/apigateway/getuserinfo",
            dataType:"json",
            data:JSON.stringify(authInfo),
            success:function(data){
                //console.log(data);
                if(data.status == 200){//用户已登陆
                    data = JSON.parse(data.data);
                    console.log("获得用户信息",data);
                    console.log("用户已登陆");
                    $('.headerBox .header .headerRight2').show();
//                        $('.headerBox .header .headerRight .headImgBox .headImg').show().attr('src',baseUrl+"/"+data.logo);
                    $('.headerBox .header .headerRight .headImgBox .headImg').show().attr('src',baseImgSrc+data.logo).css({'width':"15px", 'height':"15px", "borderRadius":'15px', "verticalAlign":'-3px'});
                    $('.headerBox .header .headerRight .headImgBox .headImg').attr('onerror',"this.src='http://www.kalichimall.com/gimg/5D4F97F160A824A15B7B4E63F95AAEFD'");
                    //$('.headerBox .header .headerRight .headImgBox .headImg').attr('onerror','../image/index/defaultAvatar.jpg');

                    $('.headerBox .header .headerRight .name').html(data.nickname);



                    $('.headerBox .header .headerRight .headImgBox').unbind('click').click(function(){
                        window.open("manage.html");
                        //window.location.href = "manage.html";
                    });
                    $('.headerBox .header .headerRight .profile').unbind('click').click(function(){//进入profile.html；
                        window.open("profile.html?pubUid="+data.uid);
                       //window.location.href = "profile.html?pubUid="+data.uid;
                    });
                    $('.headerBox .header .headerRight .logout').unbind('click').click(function(){//删除token，刷新页面；
//                            delCookie('token');
                        localStorage.removeItem("token");
                        window.location.reload();
                    });

                    //profile.html:登陆成功之后显示发布按钮；
                    $('.publishBox .publish .publishBtnBox').show();

                    //publish.html:登录之后默认显示用户昵称和手机号
                    $('.sortBox .sort .partInner2 .partInner2Box .right .contactName').val(data.nickname);
                    $('.sortBox .sort .partInner2 .partInner2Box .right .contactPhone').val(data.phone);

                    //detail.html:默认已填写用户投诉电话；
                    $('.tipOffPopBox .tipOffBox #content').val(data.phone);





                }else if(data.status == 501){//token失效
                    console.log("用户未登陆（token过期）");

                    //publish.html
                    $('.publishPopBox').show();
                    $('.publishPopBox').css('top', $(window).scrollTop());
                    //$('body').css('overflow', 'hidden');

                    $('.headerBox .header .headerRight1').show();
                    $('.headerBox .header .headerRight .login, .headerBox .header .headerRight .register').unbind('click').click(function(){
                        window.location.href = "login.html?goLogin="+1;
                    });

                }else{
                    commonPopFun(data.msg);
                }
            },
            error:function(error){
                console.log(error);
            }
        });
    }

    var areaId = localStorage.getItem("areaId");
    var areaName = localStorage.getItem("areaName");
//获得区域信息
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/areas",
        dataType:"json",
        success: function(data){
//                    console.log(data);
            if (data.status == 200) {
                data = JSON.parse(data.data);
                console.log("获得区域信息", data);
                var areaIdArr = [];
                var areaNameArr = [];
                //var changeLiStr = '<li class="changeLi"><a href="#" class="changeLiLink">ALL</a></li>';
                var changeLiStr = '';

                for (var areas in data) {
                    //console.log("data[areas].name="+data[areas]);


                    /*<li class="changeLi"><a href="#" class="changeLiLink">Lusaka6</a></li>
                     *
                     * .headerBox .header .changeUl .changeLi*/
                    
                    changeLiStr += '<li class="changeLi"><a href="#" class="changeLiLink">'+ data[areas].name +'</a></li>';
                    areaIdArr.push(data[areas].id);
                    areaNameArr.push(data[areas].name);
                }

                //获取附近商品信息
                console.log("areaId", areaIdArr);

                console.log(areaId);
                //areaId = areaId.toString();
                if(areaId == null){
                    $('.headerBox .header .headerLeft .lusaka').html(areaNameArr[0]);
                    areaId = areaIdArr[0];
                }else{
                    $('.headerBox .header .headerLeft .lusaka').html(areaName);
                }
                $.ajax({
                    type: "get",
                    url: baseUrl+'/apigateway/getgoods?areaid='+areaId,
                    success:function(data){
                        if(data.status == 200){
                            data = JSON.parse(data.data);
                            console.log('url', baseUrl+'/apigateway/getgoods?areaid='+areaId);
                            console.log('获取附近商品信息',data);
                            
                            $('.nearbyImgBox .nearbyImg').empty();
                            var goodIdArr = [];
                            for (var nearby in data){
                                goodIdArr.push(data[nearby].id);
                                var str;
                                if(data[nearby].price == 0){
                                    str = 'Negotiated';
                                }else{
                                    str = data[nearby].price;
                                }

                                var thisTitle = data[nearby].title;
                                if(thisTitle.length>9){
                                    thisTitle = thisTitle.substring(0,9) + "...";
                                }

                                $('.nearbyImgBox .nearbyImg').append('' +
                                    //'<li class="nearbyLi">' +
                                    '<li class="nearbyLi" style="background: url('+baseImgSrc+data[nearby].imgs+') no-repeat center center">' +
                                    //'<img class="goodImg" src='+baseUrl+'/gimg/'+data[nearby].imgs+'>' +
                                    '<div class="desc row">' +
                                    '<div class="col-xs-6 col-sm-6 left">'+thisTitle+'</div>' +
                                    '<div class="col-xs-6 col-sm-6 right">'+str+'</div>' +
                                    '</div>' +
                                    '</li>');

                                if($(window).width()>=1200){
                                    $('.searchBox .search').css('marginLeft',($(window).width()-1200)/2);
                                }

                            }
                            /*refreshImgBox，nearbyImgBox：hover图片动效*/
                            $(' .nearbyImgBox .nearbyImg .nearbyLi').hover(
                                function(){
                                    $(this).children('.desc').fadeIn();
                                },
                                function(){
                                    $(this).children('.desc').fadeOut();
                                }
                            );

                            $('.nearbyImgBox .nearbyImg .nearbyLi').unbind('click').click(function () {
                                var index = $(this).index();
                                window.open("detail.html?id="+goodIdArr[index]);
                                //window.location.href = "detail.html?id="+goodIdArr[index];
                            });

                        }else{
                            commonPopFun(data.msg);
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });





                $('.headerBox .header .changeUl').append(changeLiStr);



                //不显示默认地址
                $('.headerBox .header .changeUl .changeLi').each(function(index){
                    if($('.headerBox .header .changeUl .changeLi').eq(index).children('.changeLiLink').html() == ''){
                        $(this).hide();
                    }
                });
                /*//初始显示地址
                if(areaId){
                    alert(areaId);
                    $('.headerBox .header .headerLeft .lusaka').html(areaName);
                }else{
                    alert(1);
                    $('.headerBox .header .headerLeft .lusaka').html($('.headerBox .header .changeUl .changeLi .changeLiLink').eq(0).html());
                }*/


                /*headerBox：点击change切换地址*/
                var header = $('.headerBox .header').offset().left;
                var changeUlLeft = $('.headerBox .header .headerLeft .change').offset().left;
                $('.headerBox .header .changeUl').css('left', changeUlLeft-header);
                $('.headerBox .header .headerLeft .change').hover(function () {
                    $('.headerBox .header .changeUl').show();
                },function(){
                    $('.headerBox .header .changeUl').hide();
                });
                $('.headerBox .header .changeUl').hover(function () {
                    $('.headerBox .header .changeUl').show();
                },function () {
                    $('.headerBox .header .changeUl').hide();
                });
                $('.headerBox .header .changeUl .changeLi').click(function () {
                    var index = $(this).index();
                    //index = index - 1;
                    localStorage.setItem('areaId',areaIdArr[index].toString());
                    localStorage.setItem('areaName',areaNameArr[index]);

                    //areaId = localStorage.getItem("areaId");
                    $.ajax({
                        type: "get",
                        url: baseUrl+'/apigateway/getgoods?areaid='+areaIdArr[index],
                        success:function(data){
                            //console.log(typeof areaId);
                            if(data.status == 200){
                                data = JSON.parse(data.data);
                                console.log('url',baseUrl+'/apigateway/getgoods?areaid='+areaIdArr[index]);
                                console.log('获取附近商品信息',data);
                                $('.nearbyImgBox .nearbyImg').empty();
                                var goodIdArr = [];
                                for (var nearby in data){
                                    goodIdArr.push(data[nearby].id);
                                    var str;
                                    if(data[nearby].price == 0){
                                        str = 'Negotiated';
                                    }else{
                                        str = data[nearby].price;
                                    }

                                    var thisTitle = data[nearby].title;
                                    if(thisTitle.length>9){
                                        thisTitle = thisTitle.substring(0,9) + "...";
                                    }

                                    $('.nearbyImgBox .nearbyImg').append('' +
                                            //'<li class="nearbyLi">' +
                                        '<li class="nearbyLi" style="background: url('+baseImgSrc+data[nearby].imgs+') no-repeat center center">' +
                                            //'<img class="goodImg" src='+baseUrl+'/gimg/'+data[nearby].imgs+'>' +
                                        '<div class="desc row">' +
                                        '<div class="col-xs-6 col-sm-6 left">'+thisTitle+'</div>' +
                                        '<div class="col-xs-6 col-sm-6 right">'+str+'</div>' +
                                        '</div>' +
                                        '</li>');

                                    if($(window).width()>=1200){
                                        $('.searchBox .search').css('marginLeft',($(window).width()-1200)/2);
                                    }

                                }
                                /*refreshImgBox，nearbyImgBox：hover图片动效*/
                                $('.refreshImgBox .refreshImg .refreshLi .goodImg, .nearbyImgBox .nearbyImg .nearbyLi .goodImg').hover(
                                    function(){
                                        $(this).siblings('.desc').fadeIn();
                                    },
                                    function(){
                                        $(this).siblings('.desc').fadeOut();
                                    }
                                );

                                $('.refreshImgBox .refreshImg .refreshLi .goodImg, .nearbyImgBox .nearbyImg .nearbyLi').unbind('click').click(function () {
                                    var index = $(this).index();
                                    window.open("detail.html?id="+goodIdArr[index]);
                                    //window.location.href = "detail.html?id="+goodIdArr[index];
                                });

                            }else{
                                commonPopFun(data.msg);
                            }
                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });

                    $('.headerBox .header .changeUl').hide();
                    $('.headerBox .header .headerLeft .lusaka').text(areaNameArr[index]);

                });



            } else {
                commonPopFun(data.msg);
            }
        },
        error:function(error){
            console.log(error);
        }
    });

});