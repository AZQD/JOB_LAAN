//语言切换
var sysLanguage=window.navigator.systemLanguage?window.navigator.systemLanguage:window.navigator.language;
// alert(sysLanguage);
var lang;
switch(sysLanguage) {
    case "zh-TW"://中文繁体
        lang = 'fan';
        break;
    case "en_US"://英文
        lang = 'en';
        break;
    default://中文简体
}

if((lang == 'fan') || (getParamByUrl('test') == 'chaojie')){
    $('#downloadBtn').html('前往下載');//前往下载
    $('.container .partA .partAImg2').attr('src', 'image/partAImg2_fNew.png');//肉球大战斗
    $('.container .partB .partBImg2').attr('src', 'image/share_partBImg2_f.png');//领主来袭
    $('.container .partC .dangAnBox .title .dangAnTitle').attr('src', 'image/share_dangAnTitle_f.png');//玩家档案
    $('.container .partC .dangAnBox .info .desc1 .key').html('歷史最高階數：');
    $('.container .partC .dangAnBox .info .desc2 .key').html('歷史最高積分：');
    $('.container .partC .dangAnBox .info .desc3 .key').html('單人對戰勝率：');
}else {
    $('#downloadBtn').html('前往下载');
    $('.container .partA .partAImg2').attr('src', 'image/partAImg2New.png');
    $('.container .partB .partBImg2').attr('src', 'image/share_partBImg2.png');
    $('.container .partC .dangAnBox .title .dangAnTitle').attr('src', 'image/share_dangAnTitle.png');
    $('.container .partC .dangAnBox .info .desc1 .key').html('历史最高阶数：');
    $('.container .partC .dangAnBox .info .desc2 .key').html('历史最高积分：');
    $('.container .partC .dangAnBox .info .desc3 .key').html('单人对战胜率：');

}

//设备类型
var userAgentInfo = navigator.userAgent;
var isAndroid = userAgentInfo.indexOf('Android') > -1 || userAgentInfo.indexOf('Adr') > -1;//android
var isiOS = !!userAgentInfo.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios
var isPc = function IsPC() {//PC
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
//微信
function isWeiXin(){
    var ua = window.navigator.userAgent.toLowerCase();
    console.log(ua);
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }else{
        return false;
    }
}

//数据交互
/*var uid;//7126
uid = getParamByUrl('uid');
if(uid == 'false'){
	uid = '628';//official id
}
$.ajax({
	type: "get",
	url: 'http://rqdld-s2.youkongwan.com/api/boss_inv_data?uid='+ uid,//1727
	dataType:"json",
	success: function(data){
		console.log(data);
		var jsonData = data;
		$('.container .partC .boxVS .userName .left').html(jsonData.challenger.name);//左侧用户名称
		$('.container .partC .boxVS .userName .right').html(jsonData.boss.name);//右侧用户名称
		$('body').show();
		//前往下载
		$('#downloadBtn').unbind('click').bind('click', function(){
			window.location.href = jsonData.download;
		});
	},
	error:function(error){
		console.log(error);
	}
});*/

var jsonData = {
    //挑战者信息
    "me":{
        "name":"abc",
        "best_level":5,
        "best_score":4566,
        "win_rate":0.5
    },
    //协助者信息。
    //协助者信息可能为空（比如1v1的时候）。此时不显示协助者的名字
    "helper":{
        "name":"def"
    },
    //被挑战者信息
    "rival":{
        "name":"12阶苍狼"
    },
    //下载地址
    "download":"",
    //ios下载地址
    "download_ios":"",
    //android下载地址
    "download_and":""
};
$('.container .partC .boxVS .userName .leftBox .me').html(jsonData.me.name);//左侧用户名称me
if(jsonData.helper.name){//有协助者
    $('.container .partC .boxVS .userName').addClass('hasHelper');
    $('.container .partC .boxVS .userName .leftBox .helper').html(jsonData.helper.name);//左侧用户名称helper
}
$('.container .partC .boxVS .userName .right').html(jsonData.rival.name);//右侧用户名称
$('.container .partC .dangAnBox .info .name').html(jsonData.me.name);
$('.container .partC .dangAnBox .info .desc1 .value').html(jsonData.me.best_level);
$('.container .partC .dangAnBox .info .desc2 .value').html(jsonData.me.best_score);
$('.container .partC .dangAnBox .info .desc3 .value').html(jsonData.me.win_rate);
$('body').show();
//前往下载
$('#downloadBtn').unbind('click').bind('click', function(){
    if(isiOS){//iOS
        window.location.href = jsonData.download_ios;
	}else if(isAndroid){//Android
		if(isWeiXin()){//微信
            $('body, html').css({
                'overflow': 'hidden',
                'height':'100%'
            });
            $('.container .downTipBox').show().unbind('click').click(function(){
                $('.container .downTipBox').hide();
                $('body, html').css({
                    'overflow': 'auto',
                    'height':'auto'
                });
			});
		}else{//安卓
            window.location.href = jsonData.download_and;
		}
	}else {//其他
        window.location.href = jsonData.download;
	}
});


