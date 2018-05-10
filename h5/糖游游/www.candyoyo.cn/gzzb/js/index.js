$(function(){
    $('#headerPicBg').css({
        backgroundImage:'url("'+appData.headImg+'")',
        backgroundSize:'cover'
    });
    $('#appTitle').html(appData.appName);
    $('#espcialImg').attr('xlink:href',appData.headImg);
    $('.contentBox .appNameBox .appName').html(appData.appName);
    $('.contentBox .headImgBox .headImg').attr("src",appData.headImg);
    $('.contentBox .dataBox .fen').html(appData.fen);
    $('.contentBox .dataBox .downloadNum').html(appData.downloadNum);
    $('.contentBox .dataBox .size').html(appData.size);
    $('.bottomBox .instruct .desc').html(appData.desc);
    $('.bottomBox .version .versionNum').html(appData.versionNum);
    $('.bottomBox .updataTime .updataDate').html(appData.updataDate);



    for(var i=0; i<appData.banner.length; i++){
        $('.bannerBox .banner').append('<div class="swiper-slide"><img src="'+appData.banner[i]+'"></div>');
    }


    var bannerImgWidth = $('.bannerBox img').width();
    var bannerImgHeight = $('.bannerBox img').height();
    if(bannerImgWidth<=bannerImgHeight){

        var bottomBoxWidth = $('.contentBox .bottomWrap .bottomBox').width();

        $('.bannerBox img').width(bottomBoxWidth/2-10);

        var swiper = new Swiper('.swiper-container', {
            pagination: '.swiper-pagination',
            loop: true,
            autoplay: 2000,
            slidesPerView: 2,
            paginationClickable: true

        });

    }else{

        var bottomBoxWidth = $('.contentBox .bottomWrap .bottomBox').width();

        $('.bannerBox img').width(bottomBoxWidth-10);

        var swiper = new Swiper('.swiper-container', {
            pagination: '.swiper-pagination',
            loop: true,
            autoplay: 2000,
            slidesPerView: 1,
            paginationClickable: true
//            spaceBetween: 30
        });
    }



    $('.bottomBox .instruct .desc').click(function(){
        $(this).toggleClass('ellipsis');
    });



    var userAgentInfo = navigator.userAgent;
    var isAndroid = userAgentInfo.indexOf('Android') > -1 || userAgentInfo.indexOf('Adr') > -1;//android终端
    var isiOS = !!userAgentInfo.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
    var isPc = function IsPC() {//是否是PC

        var Agents = ["Android", "iPhone",
            "SymbianOS", "Windows Phone",
            "iPad", "iPod"];
        var isPC = true;
        for (var v = 0; v < Agents.length; v++) {
            if (userAgentInfo.indexOf(Agents[v]) > 0) {
                isPC = false;
                break;
            }
        }
        return isPC;
    };


    if(isPc()){
        //alert("isPc");
        if(appData.adUrl && appData.iosUrl){
            $('.contentBox .downloadBox').hide().eq(1).show();
            $('.contentBox .download1').unbind("click").click(function(){
                window.location.href = appData.iosUrl;
            });
            $('.contentBox .download2').unbind("click").click(function(){
                window.location.href = appData.adUrl;
            });
        }else {
            $('.contentBox .downloadBox').hide().eq(2).show();
        }

    }else if(isAndroid){
        //alert("isAndroid");
        if(appData.adUrl){
            $('.contentBox .downloadBox').hide().eq(0).show();
            $('.contentBox .download').unbind("click").click(function(){
                window.location.href = appData.adUrl;
            });
        }else{
            $('.contentBox .downloadBox').hide().eq(2).show();
        }
    }else if(isiOS){
        //alert("isiOS");
        $('.contentBox .downloadBox').hide().eq(0).show();
        if(appData.iosUrl){
            $('.contentBox .download').unbind("click").click(function(){
                window.location.href = appData.iosUrl;
            });
        }else{
            $('.contentBox .downloadBox').hide().eq(2).show();
        }

    }
});


var BJ_REPORT=function(c){if(c.BJ_REPORT){return c.BJ_REPORT}var h=[],a={id:0,uin:0,url:"",combo:1,ext:{},level:4,ignore:[],random:1,delay:1000,submit:null},f=function(p,q){return Object.prototype.toString.call(p)==="[object "+(q||"Object")+"]"},d=function(p){var q=typeof p;return q==="object"&&!!p},j=c.onerror;c.onerror=function(r,s,t,u,q){var p=r;q&&q.stack&&(p=k(q));f(p,"Event")&&(p+=p.type?"--"+p.type+"--"+(p.target?p.target.tagName+"::"+p.target.src:""):"");b.push({msg:p,target:s,rowNum:t,colNum:u});i();j&&j.apply(c,arguments)};var m=function(p){try{if(p.stack){var q=p.stack.match("http://[^\n]+");q=q?q[0]:"";var r=q.match(":([0-9]+):([0-9]+)");!r&&(r=[0,0,0]);var s=k(p);return{msg:s,rowNum:r[1],colNum:r[2],target:q.replace(r[0],"")}}else{return p}}catch(t){return p}},k=function(q){var p=q.stack.replace(/\n/gi,"").split(/\bat\b/).slice(0,5).join("@").replace(/\?[^:]+/gi,""),r=q.toString();p.indexOf(r)<0&&(p=r+"@"+p);return p},n=function(q,v){var s=[],t=[],u=[];if(d(q)){q.level=q.level||a.level;for(var r in q){var p=q[r]||"";if(p){if(d(p)){try{p=JSON.stringify(p)}catch(w){p="[BJ_REPORT detect value stringify error] "+w.toString()}}u.push(r+":"+p);s.push(r+"="+encodeURIComponent(p));t.push(r+"["+v+"]="+encodeURIComponent(p))}}}return[t.join("&"),u.join(","),s.join("&")]},o=[],l=function(p){if(a.submit){a.submit(p)}else{var q=new Image();o.push(q);q.src=p}},e=[],g=0,i=function(w){if(!a.report){return}while(h.length){var t=false,r=h.shift(),p=n(r,e.length);if(f(a.ignore,"Array")){for(var s=0,x=a.ignore.length;s<x;s++){var q=a.ignore[s];if(f(q,"RegExp")&&q.test(p[1])||f(q,"Function")&&q(r,p[1])){t=true;break}}}!t&&(a.combo?e.push(p[0]):l(a.report+p[2]+"&_t="+ +new Date()),a.onReport&&a.onReport(a.id,r))}var u=e.length;if(u){var v=function(){clearTimeout(g);l(a.report+e.join("&")+"&count="+u+"&_t="+ +new Date());g=0;e=[]};w?v():!g&&(g=setTimeout(v,a.delay))}},b={push:function(p){if(Math.random()>=a.random){return b}h.push(d(p)?m(p):{msg:p});i();return b},report:function(p){p&&b.push(p);i(true);return b},info:function(p){if(!p){return b}d(p)?p.level=2:p={msg:p,level:2};b.push(p);return b},debug:function(p){if(!p){return b}d(p)?p.level=1:p={msg:p,level:1};b.push(p);return b},init:function(p){if(d(p)){for(var q in p){a[q]=p[q]}}var r=parseInt(a.id,10);r&&(a.report=(a.url||"http://badjs2.qq.com/badjs")+"?id="+r+"&uin="+parseInt(a.uin||(document.cookie.match(/\buin=\D+(\d+)/)||[])[1],10)+"&from="+encodeURIComponent(location.href)+"&ext="+JSON.stringify(a.ext)+"&");return b},__onerror__:c.onerror};return b}(window);typeof exports!=="undefined"&&(typeof module!=="undefined"&&module.exports&&(exports=module.exports=BJ_REPORT),exports.BJ_REPORT=BJ_REPORT);BJ_REPORT.init({id:15,combo:1,delay:1000,url:"http://badjs.3g.qq.com/badjs",random:0.001,repeat:5,onReport:function(a,b){},ext:{}});
window.gTimeStamps=[Date.now()]; //基准点 0
window.gTimeStamps.push(Date.now());//dom节点初次渲染完成 21
document.addEventListener('DOMContentLoaded',function() {
    var bodyWidth = document.body.clientWidth;
    var wCanvasHight = 200;
    var hWhiteCanvas = document.getElementById("headerWhiteBg");
    hWhiteCanvas.style.width  = bodyWidth + "px";
    hWhiteCanvas.style.height = wCanvasHight + "px";
    hWhiteCanvas.width = bodyWidth;
    hWhiteCanvas.height = wCanvasHight;
    var whiteCt = hWhiteCanvas.getContext("2d");
    whiteCt.moveTo(0, 41);
    whiteCt.lineTo(parseInt(bodyWidth/2), 0);
    whiteCt.lineTo(bodyWidth, 41);
    whiteCt.closePath();
    whiteCt.fillStyle = "#ffffff";
    whiteCt.fill();
    whiteCt.lineWidth = 1;
    whiteCt.strokeStyle = "#ffffff";
    whiteCt.stroke();
    whiteCt.beginPath();
    whiteCt.moveTo(0, 41);
    whiteCt.lineTo(bodyWidth, 41);
    whiteCt.lineTo(bodyWidth, wCanvasHight);
    whiteCt.lineTo(0, wCanvasHight);
    whiteCt.closePath();
    whiteCt.fillStyle = "#ffffff";
    whiteCt.fill();
    whiteCt.lineWidth = 1;
    whiteCt.strokeStyle = "#ffffff";
    whiteCt.stroke();
}, false);
window.LC = {
    BaseUrl: "/o"
};
window.AppInfoData=null;
window.appLinkInfo = "";

window.AppInfoData={};

window.appLinkInfo="";

window.isDownBase = true;
//setTimeout(function(){alert($('.bottomWrap').offset().top);}, 2000)