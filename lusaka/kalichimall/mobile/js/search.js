$(function(){

    //新增
    /*//产品分类显示
     $.ajax({
     type: "get",
     url: baseUrl+"/apigateway/categorys",
     dataType:"json",
     success: function(data){
     if(data.status == 200){
     data = JSON.parse(data.data);
     console.log("获得产品分类",data);

     for(var i=0; i<1; i++){

     var firstStr = '<span class="eachClassName" cid='+data[i].cid+' cidName='+data[i].name+'>'+data[i].name+'</span>'+'<span style="color: #ff4720;">:</span>';
     var secondStr = '';
     for(var j=0; j<data[i].sub.length; j++){
     secondStr+='<span class="eachClassName" cid='+data[i].sub[j].cid+' cidName='+data[i].sub[j].name+'>'+data[i].sub[j].name+'</span>';
     }
     $('.classifyBox').append('' +
     '<div class="col-xs-12 col-sm-12 eachClass">'+firstStr+secondStr+'</div>');
     }

     $('.classifyBox .eachClass').eq(0).children().css('color','#FF4F0D');

     /!*$('.headerBox .left .sort').unbind('click').click(function(){
     $('.classifyBox').slideToggle();
     /!*if($('.classifyBox').is(":visible")){
     $('.swiper-container').css('marginTop',0);
     }else{
     $('.swiper-container').css('marginTop','2.5rem');
     }*!/
     });*!/

     //点击事件
     $('.classifyBox .eachClass .eachClassName').unbind('click').click(function(){
     window.localStorage.setItem('mobileCidName', $(this).attr('cidName'));
     window.location.href = 'category.html?searchOrTab=tab&cid='+$(this).attr('cid');
     });

     }else{
     commonPopFun1(data.msg, 'Failed');
     }
     },
     error:function(error){
     console.log(error);
     }

     });*/


    //产品分类显示
    $.ajax({
        type: "get",
        url: baseUrl+"/apigateway/categorys",
        dataType:"json",
        success: function(data){
            if(data.status == 200){
                data = JSON.parse(data.data);
                console.log("获得产品分类",data);

//                    for(var i=0; i<data.length; i++){
                for(var i=0; i<1; i++){
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
                $('.classifyBox .classifyLi').eq(0).children().css('color','#FF4F0D');

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


    //搜索
    function searchBoxRightFun(){
        var searchKeyWord = $.trim($('.searchBox .search .ipt').val());
        if(searchKeyWord != ''){
            //localStorage.setItem('searchOrTab',"search");
            setCookie('searchOrTab',"search", 1);
            //localStorage.setItem('searchKeyWord',searchKeyWord);
            setCookie('searchKeyWord',searchKeyWord, 1);
            window.location.href = "category.html?searchOrTab=search&searchKeyWord="+searchKeyWord;
        }
    }

    $('.searchBox .search .searchBtn').unbind('click').click(function () {
        searchBoxRightFun();
    });



    //getbestgoods
    $.ajax({
        type: "get",
        url: baseUrl + "/apigateway/getbestgoods?n=4",
        success: function (data) {
            if (data.status == 200) {
                data = JSON.parse(data.data);
                console.log("getbestgoods", data);
                var imgsLength = data.length;
                if(imgsLength>4){
                    imgsLength = 4;
                }
                for(var i=0; i<imgsLength; i++){
                    $('.bestGoods .imgsBox').append(
//                            '<div class="col-xs-3 col-sm-3 imgBox"><img src='+baseUrl+data[i].cimg+' id='+data[i].id+'></div>'
                        '<div class="col-xs-3 col-sm-3 imgBox" id='+data[i].id+' style="background: url('+baseImgSrc+data[i].cimg+') no-repeat center center;background-size:100% auto;">' +
                        '</div>'
                    );
                }
                $('.bestGoods .imgsBox .imgBox').unbind('click').click(function(){
                    var index = $(this).index();
//                        window.location.href = 'detail.html?id='+$(this).attr('id');
                    window.open('detail.html?id='+$(this).attr('id'));
                });
            } else {
                commonPopFun1(data.msg, 'Failed');
            }
        },
        error:function(error){
            console.log(error);
        }
    });
});