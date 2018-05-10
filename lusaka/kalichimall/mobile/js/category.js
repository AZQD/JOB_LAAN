$(function(){

    var eachPageMaxSize = 6;//每页显示最多数量

    //重点：点击除div之外的任意位置隐藏div
    $(document).unbind('click').click(function(){
        $('.classifyBoxWrap').slideUp();//类别列表
        $('.toggleSortBox .toggleList .priceUl').slideUp();//价格列表
        $('.toggleSortBox .toggleList .qualityUl').slideUp();//质量列表
        $('.toggleSortBox .toggleList .areaUl').slideUp();//地址列表
    });

    //头部中间位置显示内容
    var categoryMiddleCidName;
    if(getParamByUrl('searchOrTab') == 'tab'){
        var linkCid = getParamByUrl('cid');
        //categoryMiddleCidName = window.localStorage.getItem('mobileCidName');
        categoryMiddleCidName = getCookie('mobileCidName');
        if(linkCid == 21){
            categoryMiddleCidName = "Students";
        }else if(linkCid == 2){
            categoryMiddleCidName = "Vehicles";
        }else if(linkCid == 3){
            categoryMiddleCidName = "Digtals";
        }else if(linkCid == 4){
            categoryMiddleCidName = "Buildings";
        }else if(linkCid == 5){
            categoryMiddleCidName = 'Life Goods';
        }else if(linkCid == 1){
            categoryMiddleCidName = "Others";
        }
        if(categoryMiddleCidName == 'Family'){
            categoryMiddleCidName = 'Family House';
        }
        $('.headerBox .categoryMiddle .categoryMiddleCidName').html(categoryMiddleCidName);
    }else if(getParamByUrl('searchOrTab') == 'search'){
        //categoryMiddleCidName = window.localStorage.getItem('searchKeyWord');
        categoryMiddleCidName = getCookie('searchKeyWord');
        $('.headerBox .categoryMiddle .categoryMiddleCidName').html(categoryMiddleCidName);
    }


    //产品分类显示
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/categorys",
        dataType:"json",
        success: function(data){
            if(data.status == 200){
                data = JSON.parse(data.data);
                console.log("获得产品分类",data);

                for(var i=0; i<data.length; i++){
//                    for(var i=0; i<1; i++){
                    var secondStr = '';
                    for(var j=0; j<data[i].sub.length; j++){
                        secondStr+='<span class="secondName" cid='+data[i].sub[j].cid+' cidName='+data[i].sub[j].name+'>'+data[i].sub[j].name+'</span>';
                    }
                    $('.classifyBox').append('' +
                        '<div class="classifyLi">' +
                        '<div class="col-xs-3 col-sm-3 firstName" cid='+data[i].cid+' cidName='+data[i].name+'>'+data[i].name+'</div>' +
                        '<div class="col-xs-9 col-sm-9 secondNames">' +
                        secondStr+
                        '</div>' +
                        '</div>');
                }
                $('.classifyBox .classifyLi').eq(1).children().css('color','#FF4F0D');

                //点击展示二级菜单
                $('.headerBox .categoryMiddle').unbind('click').click(function(ev){
                    ev.stopPropagation();
                    $('.classifyBoxWrap').slideToggle();
                    $('.toggleSortBox .toggleList .priceUl').slideUp();//价格列表
                    $('.toggleSortBox .toggleList .qualityUl').slideUp();//质量列表
                    $('.toggleSortBox .toggleList .areaUl').slideUp();//地址列表
                });

                //点击事件
                $('.classifyBox .classifyLi .firstName,.classifyBox .classifyLi .secondName').unbind('click').click(function(){
                    //window.localStorage.setItem('mobileCidName', $(this).attr('cidName'));
                    setCookie('mobileCidName', $(this).attr('cidName'), 1);
                    window.location.href = 'category.html?searchOrTab=tab&cid='+$(this).attr('cid');
                });

            }else{
                commonPopFun1(data.msg, 'Failed');
            }
        },
        error:function(error){
            console.log(error);
        }

    });



    /*//产品分类显示
     $.ajax({
     type: "get",
     url: baseUrl+"/apigateway/categorys",
     dataType:"json",
     success: function(data){
     if(data.status == 200){
     data = JSON.parse(data.data);
     console.log("获得产品分类",data);

     for(var i=0; i<data.length; i++){

     var firstStr = '<span class="eachClassName" cid='+data[i].cid+' cidName='+data[i].name+'>'+data[i].name+'</span>'+':';
     var secondStr = '';
     for(var j=0; j<data[i].sub.length; j++){
     secondStr+='<span class="eachClassName" cid='+data[i].sub[j].cid+' cidName='+data[i].sub[j].name+'>'+data[i].sub[j].name+'</span>';
     }
     $('.classifyBox').append('' +
     '<div class="col-xs-12 col-sm-12 eachClass">'+firstStr+secondStr+'</div>');
     }

     //                    $('.classifyBox .eachClass').eq(1).children().css('color','#FF4F0D');

     /!*$('.headerBox .left .sort').unbind('click').click(function(){
     $('.classifyBox').slideToggle();
     });*!/

     //点击事件
     $('.classifyBox .eachClass .eachClassName').unbind('click').click(function(){
     window.localStorage.setItem('mobileCidName', $(this).attr('cidName'));
     window.location.href = 'category.html?searchOrTab=tab&cid='+$(this).attr('cid');
     });

     //点击展示二级菜单
     $('.headerBox .categoryMiddle').unbind('click').click(function(ev){
     ev.stopPropagation();
     $('.classifyBoxWrap').slideToggle();
     $('.toggleSortBox .toggleList .priceUl').slideUp();//价格列表
     $('.toggleSortBox .toggleList .qualityUl').slideUp();//质量列表
     $('.toggleSortBox .toggleList .areaUl').slideUp();//地址列表
     });

     //取消冒泡
     $('.classifyBoxWrap .classifyBox').unbind('click').click(function(ev){
     ev.stopPropagation();
     });
     //点击空白处隐藏
     $('.classifyBoxWrap').unbind('click').click(function(){
     $('.classifyBoxWrap').hide();
     });

     }else{
     commonPopFun1(data.msg, 'Failed');
     }
     },
     error:function(error){
     console.log(error);
     }

     });*/



    //头部显示地址列表
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



                //新增
                $('.toggleSortBox .toggleSort .areaTab').unbind('click').click(function(ev){
                    ev.stopPropagation();
                    $('.toggleSortBox .toggleList .areaUl').slideToggle();
                    $('.classifyBoxWrap').slideUp();//类别列表
                    $('.toggleSortBox .toggleList .priceUl').slideUp();//价格列表
                    $('.toggleSortBox .toggleList .qualityUl').slideUp();//质量列表
                });
                for (var sort in data){
                    if(data[sort].name){
                        $('.toggleSortBox .toggleList .areaUl').append(
                            '<li areaid='+data[sort].id+'>'+data[sort].name+'</li>'
                        );
                    }
                }
                $('.toggleSortBox .toggleList .areaUl li').unbind('click').click(function(){
                    $('.toggleSortBox .toggleSort .tab .areaText').html($(this).html());
                    areaid = $(this).attr('areaid');
                    if(lastGetGoodFun == 'searchFun'){
                        searchPageControl();
//                searchFun(searchKeyWord,startSearch, hasImage);
                        searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, needSort, hasImage, goodstatus);
                    }else{
                        tabPageControl();
                        getGoods(cid, pmin, pmax, areaid, issell, orderby, needSort, startTab, hasImage, goodstatus);
                    }
                    $('.toggleSortBox .toggleList .areaUl').hide();
                });



                var locationArr1 = [];
                var locationArrId1 = [];
                var locationArr2 = [];
                for (var sort in data){
                    locationArr1.push(data[sort].name);
                    locationArrId1.push(data[sort].id);
                    locationArr2.push(data[sort].sub);
                }
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
                $('.headerBox .indexMiddle .address').unbind('click').click(function(){
                    $('.headerBox .indexMiddle .addressUl').slideToggle();
                });

                $('.headerBox .indexMiddle .addressUl').prepend('<div id="addressAll" style="text-align: center;width: 6.375rem;height: 1.875rem;line-height:1.875rem;border: 1px solid #999;border-bottom: none;margin:0 auto;">ALL</div>');


                $('#addressAll').unbind('click').click(function(){
                    $('.headerBox .indexMiddle .address').text('ALL');
                    $('.headerBox .indexMiddle .addressUl').hide();

                    var strAllArea = '<span class="area">AREA</span><a href="#" nowAreaid="" class="selectChoose active">ALL</a>';
                    for(var j=0; j<locationArrId1.length; j++){
                        strAllArea += '<a href="#" class="selectChoose" nowAreaid='+locationArrId1[j]+'>'+locationArr1[j]+'</a>';
                    }
                    $('.selectArea').empty().append(strAllArea);

                    $('.selectBox .select .selectArea').children('.selectChoose').each(function(index){
                        $(this).click(function () {
                            areaid = $(this).attr('nowAreaid');
                            $('.selectBox .select .selectArea .selectChoose').removeClass("active");
                            $(this).addClass('active');
                            console.log('areaid='+areaid);
                            tabPageControl();
                            getGoods(cid, pmin, pmax, areaid, issell, orderby, needSort, startTab, hasImage, goodstatus);
                        });
                    });

                });

                //选择地址
                controlAreaId2();
                $('.headerBox .indexMiddle .addressUl .addressLi').unbind('click').click(function(){
                    var index = $(this).index();
                    index = index-1;
                    //localStorage.setItem('areaId', areaIdArr[index]);
                    setCookie('areaId', areaIdArr[index], 1);
                    //localStorage.setItem('areaName', areaNameArr[index]);
                    setCookie('areaName', areaNameArr[index], 1);
                    $('.headerBox .indexMiddle .address').html(areaNameArr[index]);
                    $('.headerBox .indexMiddle .addressUl').hide();

                    controlAreaId2();

                });

                function controlAreaId2(){
                    var areaIdArr2 = [];
//                        areaid = locationArr2[0][0].id;
                    console.log('**********', areaid);
                    for(var i=0; i<locationArr1.length; i++){
                        (function(i){
                            var strArea = '<span class="area">AREA</span><a href="#" class="selectChoose active">ALL</a>';
                            if($('.headerBox .indexMiddle .address').html() == locationArr1[i]){
                                //alert(i);
                                for(var j=0; j<locationArr2[i].length; j++){
                                    strArea += '<a href="#" class="selectChoose">'+locationArr2[i][j].name+'</a>';
                                    areaIdArr2.push(locationArr2[i][j].id);
                                }
                                $('.selectArea').empty().append(strArea);
                            }
                        })(i);
                    }
                    console.log("areaIdArr2",areaIdArr2);

                    $('.selectBox .select .selectArea').children('.selectChoose').each(function(index){
                        $(this).click(function () {
                            areaid = areaIdArr2[index-1];
                            $('.selectBox .select .selectArea .selectChoose').removeClass("active");
                            $(this).addClass('active');
                            console.log('areaid='+areaid);
                            tabPageControl();
                            getGoods(cid, pmin, pmax, areaid, issell, orderby, needSort, startTab, hasImage, goodstatus);
                        });
                    });
                }

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



    //loading动画
    $('#dongHua').css('marginTop',$('body').height()/2);

    //
    var lastGetGoodFun;
    var searchKeyWord;

    var cid;

    var hasImage = '';//默认空字符串，选择hasimage为1，取消选择为0
    var hasImageClickNum = 0;
    $('#hasImage').change(function(){

        if(hasImageClickNum%2 == 0){
            hasImage = 1;
            if(lastGetGoodFun == 'searchFun'){
                searchPageControl();
                searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus);
//                    searchFun(searchKeyWord,startSearch, hasImage);
            }else{
                tabPageControl();
                getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
            }
        }else {
            hasImage = 0;
            if(lastGetGoodFun == 'searchFun'){
                searchPageControl();
//                    searchFun(searchKeyWord,startSearch, hasImage);
                searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus);
            }else{
                tabPageControl();
                getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
            }
        }
        console.log('hasImage', hasImage);
        hasImageClickNum ++;

    });

    //一级菜单
    $(".searchBox .search .menuUl").delegate(".menuLi","click",function(){
        /*console.log($(this));
         cid = getCid;
         tabPageControl();
         getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);*/
    });

    //二级菜单
    setInterval(function(){
        if(categoryErJiCidBtn == true){
            categoryErJiCidBtn = false;
            cid = categoryErJiCid;
            tabPageControl();
            getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
        }
    }, 100);

    //





    //tab切换(Celler/Buyer)
    var issell = 1; //1:celler, 0:buyer
    $('.tabsBox .tabs .tabsLeft .tabLink').click(function () {
        var index = $(this).index();
        if(index ==0){
            issell = 1;
        }else{
            issell = 0;
        }
        console.log("issell="+issell);
        $('.tabsBox .tabs .tabsLeft .tabLink').removeClass("active");
        $(this).addClass("active");
        if(lastGetGoodFun == 'searchFun'){
            searchPageControl();
//                searchFun(searchKeyWord,startSearch, hasImage);
            searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus);
        }else{
            tabPageControl();
            getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
        }

    });

    //排序字段(orderby, price 按价格排序，date按时间排序)
    //排序方式(sort, desc降序、asc升序,  desc 降序 从上往下是降序, asc 升序 从上往下是升序)
    var orderby = '';
    var sort = '';
    var needSort = '';//为了解决选择区域时的bug
    var priceClickNum = 0;
    var dateClickNum = 0;
    $('.tabsBox .tabs .tabsRight .tabBtn1').click(function () {
        $('.tabsBox .tabs .tabsRight .tabBtn2').removeClass('tabBtn2Up').removeClass('tabBtn2Down');
        orderby = 'date';
        if(dateClickNum%2 == 0){
            sort = 'desc';
            $(this).removeClass('tabBtn1Up');
            $(this).addClass('tabBtn1Down');
        }else{
            sort = 'asc';
            $(this).removeClass('tabBtn1Down');
            $(this).addClass('tabBtn1Up');
        }
        dateClickNum ++;
        console.log(sort);
        needSort = sort;
        if(lastGetGoodFun == 'searchFun'){
            searchPageControl();
//                searchFun(searchKeyWord,startSearch, hasImage);
            searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus);
        }else{
            tabPageControl();
            getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
        }
    });
    $('.tabsBox .tabs .tabsRight .tabBtn2').click(function () {
        $('.tabsBox .tabs .tabsRight .tabBtn1').removeClass('tabBtn1Up').removeClass('tabBtn1Down');
        orderby = 'price';
        if(priceClickNum%2 == 1){
            sort = 'desc';
            $(this).removeClass('tabBtn2Down');
            $(this).addClass('tabBtn2Up');
        }else{
            sort = 'asc';
            $(this).removeClass('tabBtn2Up');
            $(this).addClass('tabBtn2Down');
        }
        priceClickNum ++;
        console.log(sort);
        needSort = sort;
        if(lastGetGoodFun == 'searchFun'){
            searchPageControl();
//                searchFun(searchKeyWord,startSearch, hasImage);
            searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus);
        }else{
            tabPageControl();
            getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
        }
    });


    //定义全局变量
    var pmin = '';
    var pmax = '';
    var areaid = '';
    /*$('.selectBox .select .selectPrice').children('.selectChoose').each(function(index){
     $(this).click(function () {
     if(index == 0){
     pmin = '';pmax = '';
     }else if(index == 1){
     pmin = 0;pmax = 100;
     }else if(index == 2){
     pmin = 100;pmax = 200;
     }else if(index == 3){
     pmin = 200;pmax = 500;
     }else if(index == 4){
     pmin = 500;pmax = '';
     }
     $('.selectBox .select .selectPrice .selectChoose').removeClass("active");
     $(this).addClass('active');
     console.log(pmin,pmax);
     if(lastGetGoodFun == 'searchFun'){
     searchPageControl();
     //                searchFun(searchKeyWord,startSearch, hasImage);
     searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus);
     }else{
     tabPageControl();
     getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
     }
     });
     });*/

    //定义全局变量
    var goodstatus = '';
    $('.selectBox .select .selectQuality').children('.selectChoose').each(function(index){
        $(this).click(function () {
            if(index == 0){
                goodstatus = '';
            }else if(index == 1){
                goodstatus = 0;
            }else if(index == 2){
                goodstatus = 1;
            }else if(index == 3){
                goodstatus = 2;
            }else if(index == 4){
                goodstatus = 3;
            }
            $('.selectBox .select .selectQuality .selectChoose').removeClass("active");
            $(this).addClass('active');
            console.log(goodstatus);
            if(lastGetGoodFun == 'searchFun'){
                searchPageControl();
//                searchFun(searchKeyWord,startSearch, hasImage);
                searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus);
            }else{
                tabPageControl();
                getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
            }
        });
    });

    //新增
    $('.toggleSortBox .toggleSort .qualityTab').unbind('click').click(function(ev){
        ev.stopPropagation();
        $('.toggleSortBox .toggleList .qualityUl').slideToggle();
        $('.classifyBoxWrap').slideUp();//类别列表
        $('.toggleSortBox .toggleList .priceUl').slideUp();//价格列表
        $('.toggleSortBox .toggleList .areaUl').slideUp();//地址列表
    });

    $('.toggleSortBox .toggleList .qualityUl li').unbind('click').click(function(){
        $('.toggleSortBox .toggleSort .tab .qualityText').html($(this).html());
        var index = $(this).index();
//            alert($(this).attr('goodstatus'));
        goodstatus = $(this).attr('goodstatus');
        if(lastGetGoodFun == 'searchFun'){
            searchPageControl();
//                searchFun(searchKeyWord,startSearch, hasImage);
            searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus);
        }else{
            tabPageControl();
            getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
        }
        $('.toggleSortBox .toggleList .qualityUl').hide();
    });



    //获取地址areaid
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/areas",
        dataType:"json",
        success: function(data){
            if (data.status == 200){
                data = JSON.parse(data.data);
                console.log("获得区域信息2", data);
                var locationArr1 = [];
                var locationArrId1 = [];
                var locationArr2 = [];
                for (var sort in data){
                    locationArr1.push(data[sort].name);
                    locationArrId1.push(data[sort].id);
                    locationArr2.push(data[sort].sub);
                }

                controlAreaId();
                $('.headerBox .header .changeUl .changeLi').click(function(){
                    var index = $(this).index();
                    //当点击除ALL之外的其他地址时执行
                    if(index>0){
                        controlAreaId();
                    }
                });

                //点击addressAll
                $('.headerBox .header .changeUl').prepend('<div id="addressAll" style="text-align: center;border-bottom: 1px solid #999">ALL</div>');
                $('#addressAll').hover(
                    function () {
                        $(this).css('color','#FF4720');
                    },
                    function () {
                        $(this).css('color','#666');
                    }
                );

                //点击addressAll

                /*$('#addressAll').unbind('click').click(function(){
                 $('.headerBox .header .headerLeft .lusaka').text('ALL');
                 var strAllArea = '<span class="area">AREA</span><a href="#" nowAreaid="" class="selectChoose active">ALL</a>';
                 for(var j=0; j<locationArrId1.length; j++){
                 strAllArea += '<a href="#" class="selectChoose" nowAreaid='+locationArrId1[j]+'>'+locationArr1[j]+'</a>';
                 }
                 $('.selectArea').empty().append(strAllArea);

                 $('.selectBox .select .selectArea').children('.selectChoose').each(function(index){
                 $(this).click(function () {
                 areaid = $(this).attr('nowAreaid');
                 $('.selectBox .select .selectArea .selectChoose').removeClass("active");
                 $(this).addClass('active');
                 console.log('areaid='+areaid);
                 if(lastGetGoodFun == 'searchFun'){
                 searchPageControl();
                 //                searchFun(searchKeyWord,startSearch, hasImage);
                 searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, needSort, hasImage, goodstatus);
                 }else{
                 tabPageControl();
                 getGoods(cid, pmin, pmax, areaid, issell, orderby, needSort, startTab, hasImage, goodstatus);
                 }
                 });
                 });

                 });*/


                function controlAreaId(){
                    var areaIdArr = [];
//                        areaid = locationArr2[0][0].id;
                    console.log('**********', areaid);
                    for(var i=0; i<locationArr1.length; i++){
                        (function(i){
                            var strArea = '<span class="area">AREA</span><a href="#" class="selectChoose active">ALL</a>';
                            if($('.headerBox .header .headerLeft .lusaka').html() == locationArr1[i]){
                                for(var j=0; j<locationArr2[i].length; j++){
                                    strArea += '<a href="#" class="selectChoose">'+locationArr2[i][j].name+'</a>';
                                    areaIdArr.push(locationArr2[i][j].id);
                                }
                                $('.selectArea').empty().append(strArea);
                            }
                        })(i);
                    }
                    console.log("areaIdArr",areaIdArr);

                    $('.selectBox .select .selectArea').children('.selectChoose').each(function(index){
                        $(this).click(function () {
                            areaid = areaIdArr[index-1];
                            $('.selectBox .select .selectArea .selectChoose').removeClass("active");
                            $(this).addClass('active');
                            console.log('areaid='+areaid);
                            if(lastGetGoodFun == 'searchFun'){
                                searchPageControl();
//                searchFun(searchKeyWord,startSearch, hasImage);
                                searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, needSort, hasImage, goodstatus);
                            }else{
                                tabPageControl();
                                getGoods(cid, pmin, pmax, areaid, issell, orderby, needSort, startTab, hasImage, goodstatus);
                            }
                        });
                    });
                }

            }
        },
        error: function (error) {
            console.log(error);
        }
    });




    var totalCountTab = 0;
    var startTab = 0;

    var totalCountSearch = 0;
    var startSearch = 0;
    function searchPageControl(){

        $('.pageControl .nextPage').unbind('click').click(function(){
            startSearch += eachPageMaxSize ;
            if(startSearch<=totalCountSearch){
//                    searchFun(searchKeyWord, startSearch, hasImage);
                searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus);
            }else{
                startSearch -= eachPageMaxSize ;
//                    alert('已经是最后一页了！');
                commonPopFun1('This is last page','Kalichimall');
            }
        });
        $('.pageControl .lastPage').unbind('click').click(function(){
            startSearch -= eachPageMaxSize ;
            if(startSearch >= 0){
//                    searchFun(searchKeyWord, startSearch, hasImage);
                searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus);
            }else{
                startSearch += eachPageMaxSize ;
//                    alert('已经是第一页了！');
                commonPopFun1('This is first page','Kalichimall');
            }
        });
    }


    //cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage
    function searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus){
        lastGetGoodFun = 'searchFun';
        $('#dongHua').show();
        $('.goodsBox').hide();
        if(searchKeyWord == undefined || searchKeyWord == 'false'){
            searchKeyWord = '';
        }
        //if(window.localStorage.getItem('clickBanner') == 1){
        if(getCookie('clickBanner') == 1){
            if(getParamByUrl('cid') == 2){
                $('.searchBox .search .searchLeft .second').html('Vehicles');//二级标题
            }else if(getParamByUrl('cid') == 5){
                $('.searchBox .search .searchLeft .second').html('Life Goods');//二级标题
            }
        }else {
            $('.searchBox .search .searchLeft .second').html(searchKeyWord);//二级标题
        }
        $.ajax({
            type: "get",
            url: baseUrl+"/apigateway/search?key="+searchKeyWord+"&start="+startSearch+'&pmin='+ pmin +'&pmax='+ pmax +'&areaid='+ areaid +'&issell='+ issell +'&orderby='+ orderby +'&sort='+ sort +'&n='+eachPageMaxSize+'&hasImage='+hasImage +'&goodstatus='+ goodstatus,
            dataType:"json",
            success: function(data){
                if(data.status == 200){

                    var searchTimer = setInterval(function(){
                        if(yijidizhiIdArr.length != 0){
                            clearInterval(searchTimer);

                            totalCountSearch = data.extdata;
                            console.log("搜索",data);
                            console.log("搜索url="+baseUrl+"/apigateway/search?key="+searchKeyWord+"&start="+startSearch+'&pmin='+ pmin +'&pmax='+ pmax +'&areaid='+ areaid +'&issell='+ issell +'&orderby='+ orderby +'&sort='+ sort +'&n='+eachPageMaxSize+'&hasImage='+hasImage +'&goodstatus='+ goodstatus);

                            data = JSON.parse(data.data);
                            console.log("搜索",data);
                            var str = '';

                            var goodIdArr = [];
                            for (var list in data) {
                                var imgsLth = 0;
                                var priceStr = '';
                                var priceHtml = '';
                                if(data[list].price == 0){
                                    priceStr = 'Negotiated';
                                    priceHtml = '<span class="goodsRight1"></span><span class="goodsRight2">'+priceStr+'</span>';
                                }else{
                                    priceStr = data[list].price;
                                    priceHtml = '<span class="goodsRight1">ZMW</span><span class="goodsRight2">'+priceStr+'</span>';
                                }
                                goodIdArr.push(data[list].id);
                                var imgs = data[list].imgs;
                                if(imgs != null){
                                    imgs = imgs.split(',');
                                    imgsLth = imgs.length;
                                }
                                console.log('111111',data[list].addr_l1);
                                console.log(imgsLth);
//                            console.log(data[list]);

                                var detailsText = data[list].details;
                                if(detailsText.length>22){
                                    detailsText = detailsText.substring(0, 22) + '...';
                                }

                                //aboutQuality
                                var aboutQuality = '';
                                if(data[list].goodstatus == 0){
                                    aboutQuality = 'Brand New';
                                }else if(data[list].goodstatus == 1){
                                    aboutQuality = 'New';
                                }else if(data[list].goodstatus == 2){
                                    aboutQuality = 'As New';
                                }else if(data[list].goodstatus == 3){
                                    aboutQuality = 'A Half New';
                                }





                                var thisIndex;
                                var yijiName,erjiName;

                                console.log('yijidizhiIdArr',yijidizhiIdArr);
                                for(var i=0; i<yijidizhiIdArr.length; i++){
                                    if(yijidizhiIdArr[i] == data[list].addr_l1){
                                        thisIndex = i;
                                        yijiName = yijidizhiNameArr[i];
                                    }
                                }
                                console.log('yijiName',yijiName);

                                for(var k=0; k<erjidizhiArr[thisIndex].length; k++){
                                    if(erjidizhiArr[thisIndex][k].id == data[list].addr_l2){
                                        erjiName = erjidizhiArr[thisIndex][k].name;
                                    }
                                };
                                console.log('erjiName',erjiName);
                                str += '<div class="row goods">' +
                                    '<div class="col-xs-3 col-sm-3 goodsLeft" style="background: url('+baseImgSrc+data[list].cimg+') no-repeat center center;background-size:100% auto;">' +
                                    '<span class="tip">'+imgsLth+'</span>' +
                                    '</div>' +
                                    '<div class="col-xs-6 col-sm-6 goodsMiddle">' +
                                    '<p class="goodName">'+data[list].title+'</p>' +
                                    '<p class="goodDesc">'+detailsText+'</p>' +
                                    '<p class="goodDesc">'+yijiName+" "+erjiName+" "+data[list].addr_l3+" "+data[list].addr_l4+' ' +
                                    '<div class="goodDate">'+data[list].pubtime+'</div>' +
                                    '</p>' +
                                    '</div>' +
                                    '<div class="col-xs-3 col-sm-3 goodsRight">'+priceHtml+'<span class="aboutQuality">'+aboutQuality+'</span></div>' +
                                    '</div>';
                            }
                            $('.goodsBox').empty().append(str).show();
                            $('#dongHua').hide();

                            //搜索结果总数
                            if(totalCountSearch > eachPageMaxSize){
                                $('.goodsBox').css('marginBottom', '0.5rem');
                                $('.pageControl').show();
                            }

                            console.log(str == '');
                            if(str == ''){
                                $('.goodsBox').empty().append('Sorry,No product found!').css({
                                    'textAlign':'center',
                                    'paddingBottom':'10px'
                                });
                            }
                            console.log($('.goodsBox .goods').length);
                            //.goodsBox .goods
                            $('.goodsBox .goods').unbind('click').click(function () {
                                var index = $(this).index();
                                var goodId = goodIdArr[index];
                                //localStorage.setItem('goodIdFromCategory',goodId);
                                setCookie('goodIdFromCategory',goodId, 1);
//                            window.location.href = "detail.html?id="+goodId;
                                window.open("detail.html?id="+goodId);

                            });

                        }
                    }, 100);


                }else{
                    commonPopFun(data.msg, 'Failed');
                }
            },
            error:function(error){
                console.log(error);
            }
        });
    }



    //用户搜索
    $('.searchBox .search .searchRight .searchImg').click(function () {
        searchKeyWord = $.trim($('.searchBox .search .searchRight .ipt').val());
        if(searchKeyWord != ''){
            $('.goodsBox').empty();//清空goodsBox
            searchPageControl();
            searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus);
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
                searchKeyWord = $.trim($('.searchBox .search .searchRight .ipt').val());
                if(searchKeyWord != ''){
                    $('.goodsBox').empty();//清空goodsBox
                    searchPageControl();
//                searchFun(searchKeyWord, startSearch, hasImage);
                    searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus);
                }else{
//                alert('请输入搜索关键词！');
                }
            }
            return false;
        }
    };


    //点击发布
    $('.searchBox .search .searchRight .searchBtn').unbind('click').click(function () {
        window.location.href = "publish.html";
    });




    //通过搜索进入商品列表
//        var searchOrTab = localStorage.getItem("searchOrTab");
    var searchOrTab = getParamByUrl('searchOrTab');
    if(searchOrTab == 'search'){//用户点击搜索进入
        console.log("用户点击search进入");
//            var searchKeyWord = localStorage.getItem("searchKeyWord");
        searchKeyWord = getParamByUrl('searchKeyWord');

        //修改title
        $('#categoryTitle').html(searchKeyWord+' kalichimall, make money by your second-hand goods.');

        searchPageControl();
//            searchFun(searchKeyWord,startSearch, hasImage);
        searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus);



    }else if(searchOrTab == 'tab'){
        console.log("用户点击tab进入");
        //var cidName = localStorage.getItem("cidName");
        var cidName = getCookie("cidName");
//            cid = localStorage.getItem("cid");
        cid = getParamByUrl('cid');

        //修改title
        $('#categoryTitle').html(cidName+' kalichimall, make money by your second-hand goods.');

        //if(window.localStorage.getItem('clickBanner') == 1){
        if(getCookie('clickBanner') == 1){
            if(getParamByUrl('cid') == 2){
                $('.searchBox .search .searchLeft .second').html('Vehicles');//二级标题
            }else if(getParamByUrl('cid') == 5){
                $('.searchBox .search .searchLeft .second').html('Life Goods');//二级标题
            }
        }else {
            $('.searchBox .search .searchLeft .second').html(cidName);//二级标题
        }

        tabPageControl();
        getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
    }




    function tabPageControl(){
        $('.pageControl .nextPage').unbind('click').click(function(){
            startTab += eachPageMaxSize ;
            if(startTab<=totalCountTab){
                tabPageControl();
                getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
            }else{
                startTab -= eachPageMaxSize ;
//                    alert('已经是最后一页了！');
                commonPopFun1('This is last page','Kalichimall');
            }
        });
        $('.pageControl .lastPage').unbind('click').click(function(){
            startTab -= eachPageMaxSize ;
            if(startTab >= 0){
                tabPageControl();
                getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
            }else{
                startTab += eachPageMaxSize ;
//                    alert('已经是第一页了！');
                commonPopFun1('This is first page','Kalichimall');
            }
        });
    }





    var daLeiCidArr = [];
    var daLeiIntervalArr = [];

    var daLeiSubArr = [];

    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/categorys",
        dataType:"json",
        success: function(data){
            if(data.status == 200){
                data = JSON.parse(data.data);
                console.log("获得产品daLeiCid",data);
                var aaaa = [];

                for(var i=0; i<data.length; i++){
                    daLeiCidArr.push(data[i].cid);
                    daLeiIntervalArr.push(data[i].interval);
                    daLeiSubArr.push(data[i].sub);

                    var bbbb = [];
                    bbbb.push(data[i].cid);
                    for(var j=0; j<data[i].sub.length; j++){
                        bbbb.push(data[i].sub[j].cid);
                    }
                    aaaa.push(bbbb);
                }
                console.log('mmmmm', daLeiCidArr);
                console.log('mmmmm', daLeiIntervalArr);
                console.log('mmmmm', daLeiSubArr);
                var daLeiIndex;

                //如果是all，特殊处理
                var allCid = false;

                //cid = localStorage.getItem('cid');
                cid = getCookie('cid');
                if(cid == ''){
                    cid = getParamByUrl('cid');
                    allCid = true;
                }
                console.log('aaaaaaaaaaaaaaa', aaaa);
                for(var m=0; m<aaaa.length; m++){

                    for(var n=0; n<aaaa[m].length; n++){
                        console.log('aaa[m][n]', aaaa[m][n]);
                        if(allCid = false){
                            if(aaaa[m][n] == cid){
                                daLeiIndex = m;
                                console.log('7777777777777',daLeiIndex);
                            }
                        }else{
                            if(aaaa[m][n] == 22){
                                daLeiIndex = m;
                                console.log('7777777777777',daLeiIndex);
                            }
                        }

                    }
                }

                console.log('8888888888888',daLeiIntervalArr);
                console.log('8888888888888',daLeiIndex);
                console.log('8888888888888',daLeiIntervalArr[daLeiIndex]);
                $('.selectBox .select .selectPrice').empty();
                $('.selectBox .select .selectPrice').append('<span class="price">PRICE</span><a href="#" class="selectChoose active">ALL</a>');


                //如果是搜索，点击价格更新列表
                $('.toggleSortBox .toggleSort .pricesTab').unbind('click').click(function(ev){
                    ev.stopPropagation();
                    $('.toggleSortBox .toggleList .priceUl').slideToggle();
                    $('.classifyBoxWrap').slideUp();//类别列表
                    $('.toggleSortBox .toggleList .qualityUl').slideUp();//质量列表
                    $('.toggleSortBox .toggleList .areaUl').slideUp();//地址列表
                });
                //取消冒泡
                $('.toggleSortBox .toggleList .priceUl').unbind('click').click(function(ev){
                    ev.stopPropagation();
                });
                //点击price中的li
                $('.toggleSortBox .toggleList .priceUl li').unbind('click').click(function(ev){
                    $('.toggleSortBox .toggleSort .tab .pricesText').html($(this).html());//修改显示文本
                    ev.stopPropagation();
                    pmin = $(this).attr('min');
                    pmax = $(this).attr('max');
                    console.log(pmin,pmax);
                    if(getParamByUrl('searchOrTab') == 'search'){//用户点击搜索进入
                        searchKeyWord = getParamByUrl('searchKeyWord');
                        searchPageControl();
                        searchFun(searchKeyWord, startSearch, pmin, pmax, areaid, issell, orderby, sort, hasImage, goodstatus);
                    }
                    $('.toggleSortBox .toggleList .priceUl').hide();
                });



                var timer = setInterval(function(){
                    if(daLeiIndex != undefined){
                        clearInterval(timer);
                        for(var i=0; i<daLeiIntervalArr[daLeiIndex].length; i++){
                            var thisMin = daLeiIntervalArr[daLeiIndex][i].min;
                            var thisMax = daLeiIntervalArr[daLeiIndex][i].max;
                            thisMax= '-'+thisMax;
                            if(thisMax == '-undefined'){
                                thisMax = '++';
                            }

                            $('.selectBox .select .selectPrice').append('<a href="#" class="selectChoose">'+thisMin+thisMax+'</a>');

                            $('.selectBox .select .selectPrice').children('.selectChoose').unbind('click').click(function(){
                                var index = $(this).index();
                                if(index==1){
                                    getGoods(cid, '', '', areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
                                }else{
                                    var pmin = daLeiIntervalArr[daLeiIndex][index-2].min;
                                    var pmax = daLeiIntervalArr[daLeiIndex][index-2].max;
                                    if(pmax == undefined){
                                        pmax = '';
                                    }
                                    getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
                                }
                            });


                            //新增
                            $('.toggleSortBox .toggleList .priceUl').append('<li min='+daLeiIntervalArr[daLeiIndex][i].min+' max='+daLeiIntervalArr[daLeiIndex][i].max+'>' +
                                ''+thisMin+thisMax+'' +
                                '</li>');
                        }

                        $('.toggleSortBox .toggleSort .pricesTab').unbind('click').click(function(ev){
                            ev.stopPropagation();
                            $('.toggleSortBox .toggleList .priceUl').slideToggle();
                            $('.classifyBoxWrap').slideUp();//类别列表
                            $('.toggleSortBox .toggleList .qualityUl').slideUp();//质量列表
                            $('.toggleSortBox .toggleList .areaUl').slideUp();//地址列表
                        });

                        //取消冒泡
                        $('.toggleSortBox .toggleList .priceUl').unbind('click').click(function(ev){
                            ev.stopPropagation();
                        });
                        //点击price中的li
                        $('.toggleSortBox .toggleList .priceUl li').unbind('click').click(function(ev){
                            $('.toggleSortBox .toggleSort .tab .pricesText').html($(this).html());//修改显示文本
                            ev.stopPropagation();
                            pmin = $(this).attr('min');
                            pmax = $(this).attr('max');
                            console.log(pmin,pmax);
                            getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus);
                            $('.toggleSortBox .toggleList .priceUl').hide();
                        });
                    }
                }, 100);




            }
        },
        error:function(error){
            console.log(error);
        }
    });






    function getGoods(cid, pmin, pmax, areaid, issell, orderby, sort, startTab, hasImage, goodstatus){
        lastGetGoodFun = 'getGoods';
        $('#dongHua').show();
        $('.goodsBox').hide();







        /*
         * ?cid=深层分类id&pmax=400&pmin=300&areaid=区域id&start=&n=&issell=0/1&orderby=price/date&sort=desc/asc
         过滤条件:分类(cid)、价格区间(pmax,pmin)、区域(area)、是否是售卖(issell,等于1则是售卖(celler)，等于0则是需要(buyer), 默认是售卖)、
         排序字段(orderby, price 按价格排序，date按时间排序)、排序方式(sort, desc降序、asc升序,  desc 降序 从上往下是降序, asc 升序 从上往下是升序)
         * */
        console.log("cid, pmin, pmax, areaid, issell, orderby, sort, start",cid, pmin, pmax, areaid, issell, orderby, sort, startTab);
        //产品列表查看
        $.ajax({
            type: "get",
            url: baseUrl+'/apigateway/getgoods?'+'cid='+ cid +'&pmin='+ pmin +'&pmax='+ pmax +'&areaid='+ areaid +'&issell='+ issell +'&orderby='+ orderby +'&sort='+ sort +'&start='+startTab+'&n='+eachPageMaxSize+'&hasImage='+hasImage +'&goodstatus='+ goodstatus,
            dataType:"json",
            success: function(data){
                console.log("url="+baseUrl+'/apigateway/getgoods?'+'cid='+ cid +'&pmin='+ pmin +'&pmax='+ pmax +'&areaid='+ areaid +'&issell='+ issell +'&orderby='+ orderby +'&sort='+ sort +'&start='+startTab+'&n='+eachPageMaxSize+'&hasImage='+hasImage +'&goodstatus='+ goodstatus);
                if (data.status == 200) {


                    var getGoodsTimer = setInterval(function(){
                        if(yijidizhiIdArr.length != 0){
                            clearInterval(getGoodsTimer);

                            totalCountTab = data.extdata;
                            console.log("产品列表查看",data);
                            data = JSON.parse(data.data);
                            console.log("产品列表查看888",data);
                            ;
                            var str = '';
                            var goodIdArr = [];

                            for (var list in data) {

                                var imgsLth = 0;
                                var priceStr = '';
                                var priceHtml = '';
                                if(data[list].price == 0){
                                    priceStr = 'Negotiated';
                                    priceHtml = '<span class="goodsRight1"></span><span class="goodsRight2">'+priceStr+'</span>';
                                }else{
                                    priceStr = data[list].price;
                                    priceHtml = '<span class="goodsRight1">ZMW</span><span class="goodsRight2">'+priceStr+'</span>';
                                }
                                var imgs = data[list].imgs;
                                if(imgs != null){
                                    imgs = imgs.split(',');
                                    imgsLth = imgs.length;
                                }
                                console.log(imgsLth);
                                goodIdArr.push(data[list].id);
//                            console.log(data[list]);

                                var detailsText = data[list].details;
                                if(detailsText.length>22){
                                    detailsText = detailsText.substring(0, 22) + '...';
                                }
                                //aboutQuality
                                var aboutQuality = '';
                                if(data[list].goodstatus == 0){
                                    aboutQuality = 'Brand New';
                                }else if(data[list].goodstatus == 1){
                                    aboutQuality = 'New';
                                }else if(data[list].goodstatus == 2){
                                    aboutQuality = 'As New';
                                }else if(data[list].goodstatus == 3){
                                    aboutQuality = 'A Half New';
                                }



                                var thisIndex;
                                var yijiName,erjiName;

                                console.log('yijidizhiIdArr',yijidizhiIdArr);

                                for(var i=0; i<yijidizhiIdArr.length; i++){
                                    if(yijidizhiIdArr[i] == data[list].addr_l1){
                                        thisIndex = i;
//                                    alert(thisIndex);
                                        yijiName = yijidizhiNameArr[i];
                                    }
                                }
                                console.log('yijiName',yijiName);

                                for(var k=0; k<erjidizhiArr[thisIndex].length; k++){
                                    if(erjidizhiArr[thisIndex][k].id == data[list].addr_l2){
                                        erjiName = erjidizhiArr[thisIndex][k].name;
                                    }
                                }
                                console.log('88888888888');




                                str += '<div class="row goods">' +
                                    '<div class="col-xs-3 col-sm-3 goodsLeft" style="background: url('+baseImgSrc+data[list].cimg+') no-repeat center center;background-size:100% auto;">' +
                                    '<span class="tip">'+imgsLth+'</span>' +
                                    '</div>' +
                                    '<div class="col-xs-6 col-sm-6 goodsMiddle">' +
                                    '<p class="goodName">'+data[list].title+'</p>' +
                                    '<p class="goodDesc">'+detailsText+'</p>' +
                                    '<p class="goodDesc">'+yijiName+" "+erjiName+" "+data[list].addr_l3+" "+data[list].addr_l4+' ' +
                                    '<div class="goodDate">'+data[list].pubtime+'</div>' +
                                    '</p>' +
                                    '</div>' +
                                    '<div class="col-xs-3 col-sm-3 goodsRight">'+priceHtml+'<span class="aboutQuality">'+aboutQuality+'</span></div>' +
                                    '</div>';
                            }
                            $('.goodsBox').empty().append(str).show();
                            $('#dongHua').hide();


                            $('.pageControl').hide();
                            if(totalCountTab > eachPageMaxSize){
                                $('.goodsBox').css('marginBottom', '0.5rem');
                                $('.pageControl').show();
                            }

                            console.log(str == '');

                            if(str == ''){
                                $('.goodsBox').empty().append('Sorry, No product found!').css({
                                    'textAlign':'center',
                                    'paddingBottom':'10px'
                                });
                            }
                            console.log($('.goodsBox .goods').length);
                            //.goodsBox .goods
                            $('.goodsBox .goods').unbind('click').click(function () {
                                var index = $(this).index();
                                var goodId = goodIdArr[index];
                                //localStorage.setItem('goodIdFromCategory',goodId);
                                setCookie('goodIdFromCategory',goodId, 1);
                                window.open("detail.html?id="+goodId);
//                            window.location.href = "detail.html?id="+goodId;

                            });

                        }
                    }, 100);


                } else {
                    commonPopFun1(data.msg,'Failed');
                }
            },
            error:function(error){
                console.log(error);
            }
        });

    }


});