var baseUrl = "http://www.kalichimall.com:81";
var baseImgSrc = baseUrl+"/gimg/";

var categoryErJiCid;
var categoryErJiCidBtn = false;

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
function getParamByStr(url, paramKey){
    //var url=window.location.search.substring(1);
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


// 自适应iframe的高度
function setIframeHeight(iframe) {
    if (iframe) {
        var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
        if (iframeWin.document.body) {
            iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
        }
    }
}

window.onload = function () {
    setIframeHeight(document.getElementById('footerIframe'));
};

//进入页面获取用户信息：
//通过localStorage获取token值
var token = localStorage.getItem("token");
//console.log('localStorage.getItem("token")',localStorage.getItem("token"));
//        var token = getCookie('token');//获取token
var timestamp=new Date().getTime();//获取时间戳

$('.favicon').attr('href', 'image/favicon.ico');

//commonPop
/*
* $('.commonPopBox').show();
 $('.commonPopBox .commonPop .title').html();
 $('.commonPopBox .commonPop .detailTip').html();
* */
$('.commonPopBox').css({
    'width':$(window).width(),
    'height':$(window).height(),
    'top':$(window).scrollTop()
});
//$('.commonPopBox').show();
/*if($('.commonPopBox').is(':visible')){
    $('body').css('overflow', 'hidden');
}*/
$('.commonPopBox .commonPop .confirmBox .confirmBtn').unbind('click').click(function(){
    $('.commonPopBox').hide();
    $('body').css('overflow', 'auto');
});

function commonPopFun(dataMsg, title){
    $('.commonPopBox').css({
        'width':$(window).width(),
        'height':$(window).height(),
        'top':$(window).scrollTop()
    });
    $('.commonPopBox').show();
    $('.commonPopBox .commonPop .title').html(title);
    $('.commonPopBox .commonPop .detailTip').html(dataMsg);
    if($('.commonPopBox').is(':visible')){
        $('body').css('overflow', 'hidden');
    }
}

//设置menuUl的left值
if($('.searchBox .search .searchLeft .second').length == 0){//没有menuUl

}else {
    var secondLeft = $('.searchBox .search .searchLeft .second').offset().left;
    $('.searchBox .search .menuUl').css('left', secondLeft);
}


//$('.searchBox .search').css('marginLeft','75px');
//搜索aside居中
if($(window).width()>=1200){
    $('.searchBox .search').css('marginLeft',($(window).width()-1200)/2);
}
$(window).resize(function(ev){
    if($(window).width()>1200){
        $('.searchBox .search').css('marginLeft',($(window).width()-1200)/2);
    }
});

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



