function deviceType() {
    for (var e = new Array("Android", "iPhone", "Windows Phone", "iPod", "BlackBerry", "MeeGo", "SymbianOS"), i = navigator.userAgent, n = e.length, s = 0; n > s; s++)
        if (i.indexOf(e[s]) >= 0) return "isMobile";
    return "isPC"
}
//    alert(deviceType());
if(deviceType() == 'isMobile'){
    window.location.href = '../mobile/index.html';
}else if(deviceType() == 'isPC'){
//        window.location.href = 'WEB/index.html';
}

$(function(){

    window.localStorage.removeItem('clickBanner');
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

    //getcount:获取浏览总数
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/getcount",
        dataType:"json",
        success: function(data){
            if(data.status ==200){
                data = JSON.parse(data.data);
                console.log('getcount',data);
                $('#totalUsers').html(data.tuser);
                $('#totalProduct').html(data.tgoods);
            }

        },
        error:function(error){
            console.log(error);
        }
    });


    ////getbestgoods
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/getbestgoods",
        success:function(data){
            if(data.status == 200){
                data = JSON.parse(data.data);
                console.log("getbestgoods",data);

                /*$('.bannerRightBox .bannerRightBoxImg').attr('src', baseImgSrc+data[0].cimg).show();
                 $('.bannerBox .banner .bannerRight .bannerRightBox .desc .left').html(data[0].cname);
                 if(data[0].price == 0){
                 $('.bannerBox .banner .bannerRight .bannerRightBox .desc .right').html("Negotiated");
                 }else{
                 $('.bannerBox .banner .bannerRight .bannerRightBox .desc .right').html(data[0].price);
                 }*/
                var bestGoodsLen = data.length;
                var thisSrcIndex = 0;
                setInterval(function(){
                    console.log('thisSrcIndex='+thisSrcIndex);
                    console.log(bestGoodsLen);

                    $('.bannerBox .banner .bannerRight .bannerRightBox .desc .left').html(data[thisSrcIndex].cname);
                    if(data[thisSrcIndex].price == 0){
                        $('.bannerBox .banner .bannerRight .bannerRightBox .desc .right').html("Negotiated");
                    }else{
                        $('.bannerBox .banner .bannerRight .bannerRightBox .desc .right').html(data[thisSrcIndex].price);
                    }

                    $('.bannerRightBox .bannerRightBoxImg').attr('src', baseImgSrc+data[thisSrcIndex].cimg).stop(true).fadeIn(1000).delay(3000).fadeOut(1000);
                    $('.bannerRightBox .bannerRightBoxImg').attr('id', data[thisSrcIndex].id);

                    thisSrcIndex++;
                    if(thisSrcIndex == bestGoodsLen){
                        thisSrcIndex = 0;
                    }

                }, 5000);

                $('.bannerRightBox .bannerRightBoxImg').unbind('click').click(function(){
                    localStorage.setItem('goodIdFromCategory',$(this).attr('id'));
                    window.open("detail.html?id="+$(this).attr('id'));
                });

                /*var num = 0;
                 $('.bannerBox .banner .bannerRight .bannerRightBox .desc .left').html(data[0].cname);
                 if(data[num].price == 0){
                 $('.bannerBox .banner .bannerRight .bannerRightBox .desc .right').html("Negotiated");
                 }else{
                 $('.bannerBox .banner .bannerRight .bannerRightBox .desc .right').html(data[0].price);
                 }*/

                /*var tt = document.styleSheets[0];
                 tt.deleteRule(6);//清除之前写入的动画样式
                 console.log(tt);
                 tt.insertRule("@keyframes donghua{" +
                 "0%{background:url("+baseUrl+data[0].cimg+")no-repeat;background-size: 100% 100%} " +
                 "100%{background:url("+baseUrl+data[1].cimg+")no-repeat;background-size: 100% 100%}}",6);//写入样式

                 $('#bannerRightBox').unbind('click').click(function(){
                 localStorage.setItem('goodIdFromCategory',data[0].id);
                 window.open("detail.html?id="+data[0].id);
                 //                        window.location.href = "detail.html?id="+data[0].id;
                 });
                 setInterval(function () {
                 if(num == 0){
                 num = 1;
                 }else{
                 num = 0
                 }
                 $('.bannerBox .banner .bannerRight .bannerRightBox .desc .left').html(data[num].cname);

                 if(data[num].price == 0){
                 $('.bannerBox .banner .bannerRight .bannerRightBox .desc .right').html("Negotiated");
                 }else{
                 $('.bannerBox .banner .bannerRight .bannerRightBox .desc .right').html(data[num].price);
                 }


                 $('#bannerRightBox').unbind('click').click(function(){
                 localStorage.setItem('goodIdFromCategory',data[num].id);
                 window.open("detail.html?id="+data[num].id);
                 //                            window.location.href = "detail.html?id="+data[num].id;
                 });
                 }, 3000);
                 $('.bannerBox .banner .bannerRight .bannerRightBox').click(function () {
                 console.log(data[num].id);
                 });*/
            }
        },
        error:function(error){
            console.log(error);
        }
    });



    //点击图片logo跳转到index页面；
    $('.searchBox .search .searchLeft .logo').click(function () {
        window.location.href = 'index.html' + window.location.search;
    });

    //hotBox显示效果
    $('.hotImgBox .refreshImg .refreshLi').fadeIn(1000).show();
//        $('.refreshImgBox .refreshImg .refreshLi').slideDown(1000).show();

    //refreshBox显示效果
    $('.refreshImgBox .refreshImg .refreshLi').fadeIn(1000).show();
//        $('.refreshImgBox .refreshImg .refreshLi').slideDown(1000).show();




    /*hotImgBox：hover图片动效*/
    $('.hotImgBox .refreshImg .refreshLi').hover(
        function(){
            $(this).children('.desc').fadeIn();
        },
        function(){
            $(this).children('.desc').fadeOut();
        }
    );


    /*refreshImgBox，nearbyImgBox：hover图片动效*/
    $('.refreshImgBox .refreshImg .refreshLi, .nearbyImgBox .nearbyImg .nearbyLi').hover(
        function(){
            $(this).children('.desc').fadeIn();
        },
        function(){
            $(this).children('.desc').fadeOut();
        }
    );

    var bannerNeedCid = [];//banner的两张图片需要cid
    var bannerNeedCidName = [];//banner的两张图片需要cidName
    //获得产品分类
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/categorys",
        dataType:"json",
        success: function(data){
            if(data.status == 200){
                data = JSON.parse(data.data);
                console.log("获得产品分类",data);


                var totalStr = "";
                var cidNameArr = [];
                var cidArr = [];
                for (var sort in data) {
                    //tab切换
                    $('.tabsBox .tabs .tabsLeft').append('<a href="#" class="tabLink">'+data[sort].name+'</a>');

                    cidNameArr.push(data[sort].name);
                    cidArr.push(data[sort].cid);



                    //二级菜单
                    var str = "";
                    var listStr = '<li class="listLi"></li>';
//                        console.log(data[sort].name);
                    str += ('<img class="listImg" src='+data[sort].imgsrc+'><a href="#" class="sortLink">'+data[sort].name+'</a>');
                    var details = data[sort].sub;
//                            console.log(details);
                    /*for (var detail in details){
                     //                            console.log(details[detail].name);
                     str += ('<a href="#" class="detailLink"><span class="detailLinkText">'+details[detail].name+'</span></a>');
                     }*/
                    if(details.length>3){
                        for(var i=0; i<4; i++){
                            str += ('<a href="#" class="detailLink"><span class="detailLinkText">'+details[i].name+'</span></a>');
                        }
                    }else {
                        for(var i=0; i<details.length; i++){
                            str += ('<a href="#" class="detailLink"><span class="detailLinkText">'+details[i].name+'</span></a>');
                        }
                    }
//                        console.log('str='+str);
                    listStr = '<li class="listLi">'+str+'</li>';
                    $('.bannerBox .banner .bannerLeft .listUl').append(listStr);
                    $('.bannerBox .banner .bannerLeft .listUl .listLi .detailLink:last').hide();

                }

                console.log(cidNameArr);
                console.log(cidArr);
                bannerNeedCid = cidArr;
                bannerNeedCidName = cidNameArr;
                //tabsBox：tab切换
                localStorage.removeItem("cidName");//分类的名称
                localStorage.removeItem("cid");//分类的cid
                localStorage.removeItem("searchOrTab");//点击进入到category的来源
                $('.tabsBox .tabs .tabsLeft .tabLink').click(function () {
                    var index = $(this).index();
                    $('.tabsBox .tabs .tabsLeft .tabLink').removeClass("active");
                    $(this).addClass("active");
                    if(index != 0){
                        var cidName = cidNameArr[index-1];
                        var cid = cidArr[index-1];
                        console.log(cidName);
                        console.log(cid);
                        localStorage.setItem('searchOrTab',"tab");
                        localStorage.setItem('cidName',cidName);
                        localStorage.setItem('cid',cid);
                        window.location.href = "category.html?searchOrTab=tab&cid="+cid;
                    }
                });

                //点击一级菜单
                $('.bannerBox .banner .bannerLeft .listUl .listLi').each(function(index){
                    var firstIndex = index;
                    $(this).delegate('.sortLink','click',function(){
                        var cidName = cidNameArr[index];
                        var cid = cidArr[index];
//                            alert(cidName);
//                            alert(cid);
                        localStorage.setItem('searchOrTab',"tab");
                        localStorage.setItem('cidName',cidName);
                        localStorage.setItem('cid',cid);
                        window.location.href = "category.html?searchOrTab=tab&cid="+cid;
                    });
                    $(this).children('.detailLink').click(function(){
//                            alert(firstIndex);
                        var secondIndex = $(this).index()-2;
//                            alert(secondIndex);
                        var cidSub = data[firstIndex].sub;
                        var cidName = cidSub[secondIndex].name;
                        var cid = cidSub[secondIndex].cid;
//                            alert(cidName);
//                            alert(cid);
                        localStorage.setItem('searchOrTab',"tab");
                        localStorage.setItem('cidName',cidName);
                        localStorage.setItem('cid',cid);
                        window.location.href = "category.html?searchOrTab=tab&cid="+cid;
                    });
                });



            }else{
                commonPopFun(data.msg, 'Failed');
            }
        },
        error:function(error){
            console.log(error);
        }
    });







    //获取图片
    var src = baseUrl+"/gimg/A8D5883AE4946D2C3AEA7E02B77CED30";
    console.log(src);

    //获得banner
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/getbanner?gname=index-top-middle",
        dataType:"json",
        success: function (data) {
            if(data.status == 200){
                data = JSON.parse(data.data);
                console.log('获得banner',data);
                /*
                 * <div class="swiper-wrapper">
                 <div class="col-xs-12 col-sm-12 swiper-slide"><a href="javascript:void(0);"><img class="bannerImg" src="image/index/banner1.png"></a></div>
                 <div class="col-xs-12 col-sm-12 swiper-slide"><a href="javascript:void(0);"><img class="bannerImg" src="image/index/banner2.png"></a></div>
                 </div>
                 * */
                var str = '';
                for(var i=0; i<data.length; i++){
                    str += '<div class="col-xs-12 col-sm-12 swiper-slide"><a href="#" name='+data[i].name+' hrefs='+data[i].target+'><img class="bannerImg" src='+data[i].imgsrc+' alt='+data[i].name+'></a></div>';
                }
                console.log(str);
                $('.swiper-wrapper').append(str);


                //bannerBox：轮播图
                var mySwiper = new Swiper ('.swiper-container', {
                    direction: 'horizontal',//水平滑动
                    loop: true, //循环播放
                    autoplay: 2000, //自动播放
                    autoplayDisableOnInteraction: false, //用户操作swiper之后，是否禁止autoplay。默认为true：停止。
                    pagination: '.swiper-pagination',  // 分页器
                    speed: 2000
                });

                $('.swiper-slide').click(function(){
                    window.localStorage.setItem('clickBanner',1);
                    var index = $(this).index();
//                        alert(index);
                    var hrefs= $(this).children('a').attr('hrefs');
                    var cidName= $(this).children('a').attr('name');
                    var cid = getParamByStr(hrefs, 'cid');
                    if(cid == 'false'){//进入主页
                        window.location.href = hrefs;
                    }else{//进入category.html
                        localStorage.setItem('searchOrTab',"tab");
                        localStorage.setItem('cidName',cidName);
                        localStorage.setItem('cid',cid);
                        window.location.href = hrefs;
                    }
//                        alert(hrefs);
//                        alert(cidName);
//                        alert(cid);
                    /*if(index == 1 || index == 5){//回到主页
                     window.location.href = $(this).children('a').attr('hrefs');
                     }else if(index ==2){//Life Goods
                     localStorage.setItem('searchOrTab',"tab");
                     localStorage.setItem('cidName',bannerNeedCidName[4]);
                     localStorage.setItem('cid',bannerNeedCid[4]);
                     window.location.href = $(this).children('a').attr('hrefs');
                     //                            window.location.href = 'category.html?searchOrTab=tab&cid=5';
                     }
                     else if(index ==3){//Vehicles
                     localStorage.setItem('searchOrTab',"tab");
                     localStorage.setItem('cidName',bannerNeedCidName[1]);
                     localStorage.setItem('cid',bannerNeedCid[1]);
                     window.location.href = $(this).children('a').attr('hrefs');
                     //                            window.location.href = 'category.html?searchOrTab=tab&cid=2';
                     }else if(index == 0 || index == 4){
                     localStorage.setItem('searchOrTab',"tab");
                     localStorage.setItem('cidName',bannerNeedCidName[0]);
                     localStorage.setItem('cid',bannerNeedCid[0]);
                     window.location.href = $(this).children('a').attr('hrefs');
                     //                            window.location.href = 'category.html?searchOrTab=tab&cid=21';
                     }*/
                });

            }else{
                commonPopFun(data.msg, 'Failed');
            }
        },
        error: function (error) {
            console.log(error);
        }
    });



    //.refreshImgBox .refreshImg

    /*
     * <li class="refreshLi">
     <img class="goodImg" src="image/index/good1.jpg">
     <div class="desc row">
     <div class="col-xs-6 col-sm-6 left">iPhone 5s</div>
     <div class="col-xs-6 col-sm-6 right">1054</div>
     </div>
     </li>
     * */
    //refreshImgBox 其实也就是recently
    $.ajax({
        type: "get",
        url: baseUrl + "/apigateway/getgoods?n=10",
        success: function (data) {
            if (data.status == 200) {
                data = JSON.parse(data.data);
                console.log("recently", data);
                var recentlyIdArr = [];
                for(var i=0; i<data.length; i++){
                    recentlyIdArr.push(data[i].id);
                    var price = data[i].price;
                    if(price == 0){
                        price = 'Negotiated';
                    }

                    var thisTitle = data[i].title;
                    if(thisTitle.length>9){
                        thisTitle = thisTitle.substring(0,9) + "...";
                    }

                    $('.refreshImgBox .refreshImg').append(
                        '<li class="refreshLi" style="background: url('+baseImgSrc+data[i].cimg+') no-repeat center center">' +
//                            '<img class="goodImg" src='+baseImgSrc+data[i].cimg+'><div class="desc row">' +
                        '<div class="desc row">' +
                        '<div class="col-xs-6 col-sm-6 left">'+thisTitle+'</div>' +
                        '<div class="col-xs-6 col-sm-6 right">'+price+'</div>' +
                        '</div>' +
                        '</li>'
                    );

                    if($(window).width()>=1200){
                        $('.searchBox .search').css('marginLeft',($(window).width()-1200)/2);
                    }

                }

                $('.refreshImgBox .refreshImg .refreshLi').unbind('click').click(function () {
                    var index = $(this).index();
                    window.open("detail.html?id="+recentlyIdArr[index]);
                    //window.location.href = "detail.html?id="+goodIdArr[index];
                });

                $('.refreshImgBox .refreshImg .refreshLi').hover(
                    function(){
                        $(this).children('.desc').fadeIn();
                    },
                    function(){
                        $(this).children('.desc').fadeOut();
                    }
                );


            } else {
                commonPopFun1(data.msg, 'Failed');
            }
        },
        error:function(error){
            console.log(error);
        }
    });








    //hotImgBox 其实也就是recently
    $.ajax({
        type: "get",
        url: baseUrl + "/apigateway/gethotgoods?n=10",
        success: function (data) {
            if (data.status == 200) {
                data = JSON.parse(data.data);
                console.log("获得最热的商品信息", data);
                var recentlyIdArr = [];
                for(var i=0; i<data.length; i++){
                    recentlyIdArr.push(data[i].id);
                    var price = data[i].price;
                    if(price == 0){
                        price = 'Negotiated';
                    }
                    var thisTitle = data[i].title;
                    if(thisTitle.length>9){
                        thisTitle = thisTitle.substring(0,9) + "...";
                    }
                    $('.hotImgBox .refreshImg').append(
                        '<li class="refreshLi" style="background: url('+baseImgSrc+data[i].cimg+') no-repeat center center">' +
//                            '<img class="goodImg" src='+baseImgSrc+data[i].cimg+'><div class="desc row">' +
                        '<div class="desc row">' +
                        '<div class="col-xs-6 col-sm-6 left">'+thisTitle+'</div>' +
                        '<div class="col-xs-6 col-sm-6 right"><img style="vertical-align: -2px;margin-left: 1px;" src="image/index/views.png">'+data[i].views+'</div>' +
                        '</div>' +
                        '</li>'
                    );

                    if($(window).width()>=1200){
                        $('.searchBox .search').css('marginLeft',($(window).width()-1200)/2);
                    }

                }

                $('.hotImgBox .refreshImg .refreshLi').unbind('click').click(function () {
                    var index = $(this).index();
                    window.open("detail.html?id="+recentlyIdArr[index]);
                    //window.location.href = "detail.html?id="+goodIdArr[index];
                });

                $('.hotImgBox .refreshImg .refreshLi').hover(
                    function(){
                        $(this).children('.desc').fadeIn();
                    },
                    function(){
                        $(this).children('.desc').fadeOut();
                    }
                );


            } else {
                commonPopFun1(data.msg, 'Failed');
            }
        },
        error:function(error){
            console.log(error);
        }
    });



    //获得最热的商品信息
    /*$.ajax({
     type: "get",
     url: baseUrl + "/apigateway/gethotgoods?n=10",
     success: function (data) {
     if (data.status == 200) {
     data = JSON.parse(data.data);
     console.log("获得最热的商品信息", data);

     } else {
     commonPopFun(data.msg, 'Failed');
     }
     },
     error:function(error){
     console.log(error);
     }
     });*/




});