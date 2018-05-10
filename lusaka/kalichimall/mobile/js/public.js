var baseUrl = "http://www.kalichimall.com:81";
var baseImgSrc = baseUrl+"/gimg/";

//opera mini
var isOperaMiniLow = false;
try {
    window.localStorage.foobar = "foobar";
} catch (_) {
    //opera mini 自动模式/极致模式
    isOperaMiniLow = true;
}
//alert(isOperaMiniLow);

function getParamByUrl(paramKey){
  var url=window.location.search.substring(1);
  var arr=url.split("&");
  var result=[];
  for(var i=0;i < arr.length;i++){ 
      var param=arr[i].split("=");
      if(paramKey == param[0]){
        if(paramKey=="webver"){
          return  parseInt(param[1]);
        }
        return  param[1];
      }
  }
   return "false";
}
function removeParamByUrl(paramKey){
  var url=window.location.search.substring(1);
  var arr=url.split("&");
  var result=[];
  var str='?';
  for(var i=0;i < arr.length;i++){ 
      var param=arr[i].split("=");
      if(paramKey != param[0]){
        str+='&'+param[0]+'='+param[1];
        //return  param[1];
      }
  }
  return str;
}
function getCookie(c_name){
    if (document.cookie.length>0){
        c_start=document.cookie.indexOf(c_name + "=");
        if (c_start!=-1){ 
            c_start=c_start + c_name.length+1 ;
            c_end=document.cookie.indexOf(";",c_start)
            if (c_end==-1)
            c_end=document.cookie.length;
            return unescape(document.cookie.substring(c_start,c_end));
        } 
    }
    return "";
}
function setCookie(c_name,value,expiredays){
    var exdate=new Date();
    exdate.setDate(exdate.getDate()+expiredays);
    document.cookie=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
}
//设置带路径的cookie
function setCookiePath(c_name,value,expiredays,path){
    var exdate=new Date();
    exdate.setDate(exdate.getDate()+expiredays);
    document.cookie=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString())+'; path='+path;
}
function delCookie(name){
  var exp = new Date();
  exp.setTime(exp.getTime() - 1);
  var cval=getCookie(name);
  if(cval!=null)
  document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}
function strToJson(str){
//var json = eval('(' + str + ')');
  if(typeof(str)=='string'){
    var json = eval('(' + str + ')');
  }
  else{
    var json = str;
  }
  return json;
}




function escapeContent(str){
    /*str=str.replace(/<br\s*\/?>/g, "\n");*/
    str=str.replace(/\%25/g, "%");
    str=str.replace(/\%26/g, "&");
    str=str.replace(/\%2B/g, "+");
    str=str.replace(/\%23/g, "#");
    return str;
}
var loadingTime1;
var loadingTime2;
function loading(){
  //loading动画
  var loadingIndex=1;
  loadingTime=setInterval(function(){
    if(loadingIndex==$(".loading-point").length){
      loadingIndex=0;
    }
    $(".loading-point").removeClass("loading-point-active");
    $(".loading-point").eq(loadingIndex).addClass("loading-point-active");
    loadingIndex++; 
  },300);
}
function loading2(){
  //loading动画
  var loadingIndex2=1;
  loadingTime2=setInterval(function(){
    if(loadingIndex2==$(".loading-point2").length){
      loadingIndex2=0;
    }
    $(".loading-point2").removeClass("loading-point-active2");
    $(".loading-point2").eq(loadingIndex2).addClass("loading-point-active2");
    loadingIndex2++; 
  },300);
}
function stopLoading(){

  $(".loading-load").css("display","none");
  clearInterval(loadingTime);
}
function stopLoading2(){
  $(".loading-load2").css("display","none");
  clearInterval(loadingTime2);
}

//commonPopBox1:第一种弹窗//提示信息，标题；
function commonPopFun1(dataMsg, title){
    var top = $(document).scrollTop();
    $('.commonPopBox1').show().css('top',top);//滚动条的高度
    $('.commonPopBox1 .commonPop .title').html(title);
    $('.commonPopBox1 .commonPop .detailTip').html(dataMsg);
    if($('.commonPopBox1').is(':visible')){
        $('body, html').css({
            'overflow': 'hidden',
            'height':'100%'
        });
    }
    $('.commonPopBox1 .commonPop .confirmBox .confirmBtn').unbind('click').click(function(){
        $('.commonPopBox1').hide();
        $('body, html').css({
            'overflow': 'auto',
            'height':'auto'
        });
    });
}

//commonPopBox2:第二种弹窗：//提示信息，标题，左边按钮名称，右边按钮名称，左边函数名，右边函数名；
function commonPopFun2(dataMsg, title, leftBtnName, rightBtnName, fun1, fun2){
    var top = $(document).scrollTop();
    $('.commonPopBox2').show().css('top',top);//滚动条的高度
    $('.commonPopBox2 .commonPop .title').html(title);
    $('.commonPopBox2 .commonPop .detailTip').html(dataMsg);
    if($('.commonPopBox2').is(':visible')){
        $('body, html').css({
            'overflow': 'hidden',
            'height':'100%'
        });
    }
    $('.commonPopBox2 .commonPop .confirmBox .confirmBtn1').html(leftBtnName).unbind('click').click(function(){
        fun1();
        $('.commonPopBox2').hide();
        $('body, html').css({
            'overflow': 'auto',
            'height':'auto'
        });
    });
    $('.commonPopBox2 .commonPop .confirmBox .confirmBtn2').html(rightBtnName).unbind('click').click(function(){
        fun2();
        $('.commonPopBox2').hide();
        $('body, html').css({
            'overflow': 'auto',
            'height':'auto'
        });
    });
}

//favicon
$('.favicon').attr('href', 'image/favicon.ico');

//var token = localStorage.getItem("token");
var token = getCookie("token");
var timestamp=new Date().getTime();//获取时间戳

//判断用户是否登录
var userInfo;
if(token == null){
    bottomBtnControlNotLogin();
    console.log("用户未登陆（没有token）");

    //publish.html
    $('.publishPopBox').show();
    $('.publishPopBox').css('top', $(window).scrollTop());

}else{
    var authInfo = {
        "token":token,
        "timestamp":timestamp
    };
    $.ajax({
        type: "POST",
        url: baseUrl + "/apigateway/getuserinfo",
        dataType:"json",
        data:JSON.stringify(authInfo),
        success: function(data){
            if(data.status == 200){//用户已登陆

                //首页是否有积分提示 : 如果有cookie，并且是index.html页面(积分功能滞后，这个面板先不显示)
                /*if((getCookie('indexShowJiFenBox') != 1) && (window.location.href.substr(-10) == 'index.html')){
                    $('body, html').css({
                        'overflow': 'hidden',
                        'height': '100%'
                    });
                    $('.showPointBox').show();
                }*/

                data = JSON.parse(data.data);
                userInfo = data;
                console.log("用户已登陆");
                console.log("获得用户信息",userInfo);

                bottomBtnControlHasLogin(data.uid);

                //显示logout按钮
                //不显示：新增需求
                /*$('.headerBox .right .logout').show().unbind('click').click(function(){
                    localStorage.removeItem('token');
                   window.location.reload();
                });*/
                //manage.html
                $('.infoBox .info .infoWrap .infoRight .part1 .logoutBox').show();





                //manage.html:
                $('.headerBox .manageMiddle').unbind('click').click(function(){//进入profile.html
                    //window.open("profile.html?pubUid="+data.uid);
                    window.location.href = "profile.html?pubUid="+data.uid;
                });

                //profile.html:
                $('.headerBox .profileMiddle').unbind('click').click(function(){
                    //window.open("profile.html?pubUid="+data.uid);
                    window.location.href = "index.html";
                });

                //publish.html:登录之后默认显示用户昵称和手机号
                $('.sortBox .sort .partInner2 .partInner2Box .right .contactName').val(data.nickname);
                $('.sortBox .sort .partInner2 .partInner2Box .right .contactPhone').val(data.phone);

            }else if(data.status == 501){//token失效

                bottomBtnControlNotLogin();

                console.log("用户未登陆（token过期）", data);

                //publish.html
                $('.publishPopBox').show();
                $('.publishPopBox').css('top', $(window).scrollTop());

            }else {

                bottomBtnControlNotLogin();

                console.log("登录失败",data);
            }
        },
        error:function(error){

            bottomBtnControlNotLogin();

            console.log(error);
        }
    });
}



//底部按钮控制（如果用户未登录）
function bottomBtnControlNotLogin(){
    //index.html
    $('.infos .indexPublish').unbind('click').click(function () {
        window.location.href = "publish.html";
    });
    $('.infos .indexSignInUp').unbind('click').click(function () {
        window.location.href = "login.html?goLogin="+1;
    });

    //category.html
    $('.infos .categoryPublish').unbind('click').click(function () {
        window.location.href = "publish.html";
    });
    $('.infos .categorySignInUp').unbind('click').click(function () {
        window.location.href = "login.html?goLogin="+1;
    });

    //detail.html
    $('.infos .detailPublish').unbind('click').click(function () {
        window.location.href = "publish.html";
    });
    $('.infos .detailSignInUp').unbind('click').click(function () {
        window.location.href = "login.html?goLogin="+1;
    });

    //profile.html
    $('.infos .profilePublish').unbind('click').click(function () {
        window.location.href = "publish.html";
    });
    $('.infos .profileSignInUp').unbind('click').click(function () {
        window.location.href = "login.html?goLogin="+1;
    });

    //pre-sales.html
    $('.infos .preSalesPublish').unbind('click').click(function () {
        window.location.href = "publish.html";
    });
    $('.infos .preSalesSignInUp').unbind('click').click(function () {
        window.location.href = "login.html?goLogin="+1;
    });

    //points_lottery.html
    $('.infos .pointsLotteryPublish').unbind('click').click(function () {
        window.location.href = "publish.html";
    });
    $('.infos .pointsLotterySignInUp').unbind('click').click(function () {
        window.location.href = "login.html?goLogin="+1;
    });
}

//底部按钮控制（如果用户已登录）
function bottomBtnControlHasLogin(uid){
    //index.html
    $('.infos .indexPublish').unbind('click').click(function () {
        window.location.href = "publish.html";
    });
    $('.infos .indexSignInUp').hide();
    $('.infos .indexProfile').show().unbind('click').click(function () {
        window.location.href = "profile.html?pubUid="+uid;
    });

    //category.html
    $('.infos .categoryPublish').unbind('click').click(function () {
        window.location.href = "publish.html";
    });
    $('.infos .categorySignInUp').hide();
    $('.infos .categoryProfile').show().unbind('click').click(function () {
        window.location.href = "profile.html?pubUid="+uid;
    });

    //detail.html
    $('.infos .detailPublish').unbind('click').click(function () {
        window.location.href = "publish.html";
    });
    $('.infos .detailSignInUp').hide();
    $('.infos .detailProfile').show().unbind('click').click(function () {
        window.location.href = "profile.html?pubUid="+uid;
    });

    //profile.html
    $('.infos .profilePublish').unbind('click').click(function () {
        window.location.href = "publish.html";
    });
    $('.infos .profileSignInUp').hide();
    $('.infos .profileManage').show().unbind('click').click(function () {
        window.location.href = "manage.html";
    });

    //pre-sales.html
    $('.infos .preSalesPublish').unbind('click').click(function () {
        window.location.href = "publish.html";
    });
    $('.infos .preSalesSignInUp').hide();
    $('.infos .preSalesProfile').show().unbind('click').click(function () {
        window.location.href = "profile.html?pubUid="+uid;
    });

    //points_lottery.html
    $('.infos .pointsLotteryPublish').unbind('click').click(function () {
        window.location.href = "publish.html";
    });
    $('.infos .pointsLotterySignInUp').hide();
    $('.infos .pointsLotteryProfile').show().unbind('click').click(function () {
        window.location.href = "profile.html?pubUid="+uid;
    });
}






var categoryErJiCid;
var categoryErJiCidBtn = false;

//用户商品列表页展示地址：
var yijidizhiIdArr = [];
var yijidizhiNameArr = [];
var erjidizhiArr = [];
var erjidizhiNameArr = [];
//获取地址id

$.ajax({
    type: "get",
    url: baseUrl+"/apigateway/areas",
    dataType:"json",
    success: function(data){
        if (data.status == 200){
            data = JSON.parse(data.data);
            console.log("获得区域信息2", data);
            var locationArr1 = [];
            var locationArr1Id = [];
            var locationArr2 = [];
            for (var sort in data){
                yijidizhiIdArr.push(data[sort].id);
                yijidizhiNameArr.push(data[sort].name);
                erjidizhiArr.push(data[sort].sub);
            }
            console.log('yijidizhiIdArr',yijidizhiIdArr);
            console.log('yijidizhiNameArr',yijidizhiNameArr);
            console.log('erjidizhiArr',erjidizhiArr);
            console.log('erjidizhiArr,7',erjidizhiArr[7]);
//                    addr_l1 = locationArr1Id[data[list].addr_l1];
//                    addr_l2 = locationArr2[data[list].addr_l1][data[list].addr_l2].id;
//                    console.log(addr_l1);
//                    console.log(addr_l2);

        }
    },
    error: function (error) {
        console.log(error);
    }
});

//5-20的随机数
var mathRandomArr = [];
var mathRandomResult = 1;
for(var i=0; i<5; i++){
    mathRandomArr[i] = Math.floor(Math.random()*15+5);
    for(var j=0; j<i; j++){
        //遍历i之前的所有项，进行对比
        if(mathRandomArr[i] == mathRandomArr[j]){
            i--;
        }
    }
}
for(var i=0; i<mathRandomArr.length; i++){
    mathRandomResult*=mathRandomArr[i];
}
console.log(mathRandomResult);

//头部logo
$('.headerBox .left .logo').unbind('click').click(function(){
    window.location.href = 'index.html';
});
//头部搜索按钮
$('.headerBox .right .search').unbind('click').click(function(){
    window.location.href = 'search.html';
});
//alert($(window).clientTop);
//$('.infos').css('top', document.documentElement.clientHeight - $('.infos').height());
//$(window).on('scroll', function () {
//    $('.infos').css('top', document.documentElement.clientHeight - $('.infos').height() + $(window).scrollTop());
//});