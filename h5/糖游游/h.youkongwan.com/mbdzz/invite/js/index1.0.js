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
    $('.container .partC .codeWrap .codeTip').html('*在遊戲中填寫以協助好友');
    $('.container .partC .codeWrap .copyBox .copyBtn .copy').html('複製');
    $('#copyBtn .copy').html('複製');
    $('#downloadBtn').html('前往下載');
    $('#helpBtn').html('馬上協助');
    $('.container .partC .codeWrap .copyBox .copyAlert').html('複製成功！');

    $('.container .partA .partAImg2').attr('src', 'image/partAImg2_fNew.png');
    $('.container .partB .partBImg2').attr('src', 'image/partBImg2_f.png');
    $('.container .partC .boxVS .xieZhu').attr('src', 'image/xieZhu_f.png');
    $('.container .partC .codeWrap .miLing .miLingImg').attr('src', 'image/miLingImg_f.png');
    $('.container .partC .downloadWarp .part .isInstall .leftNoInstall').attr('src', 'image/leftNoInstall_f.png');
    $('.container .partC .downloadWarp .part .isInstall .rightInstall').attr('src', 'image/rightInstall_f.png');
}else {
    $('.container .partC .codeWrap .codeTip').html('*在游戏中填写以协助好友');
    $('.container .partC .codeWrap .copyBox .copyBtn .copy').html('复制');
    $('#copyBtn .copy').html('复制');
    $('#downloadBtn').html('前往下载');
    $('#helpBtn').html('马上协助');
    $('.container .partC .codeWrap .copyBox .copyAlert').html('复制成功！');

    $('.container .partA .partAImg2').attr('src', 'image/partAImg2New.png');//肉球大战斗
    $('.container .partB .partBImg2').attr('src', 'image/partBImg2.png');//领主来袭
    $('.container .partC .boxVS .xieZhu').attr('src', 'image/xieZhu.png');//协助好友挑战强敌
    $('.container .partC .codeWrap .miLing .miLingImg').attr('src', 'image/miLingImg.png');//协助密令
    $('.container .partC .downloadWarp .part .isInstall .leftNoInstall').attr('src', 'image/leftNoInstall.png');//我还没安装游戏
    $('.container .partC .downloadWarp .part .isInstall .rightInstall').attr('src', 'image/rightInstall.png');//我已经安装游戏

}
var uid;//7126
uid = getParamByUrl('uid');



if(uid == 'false'){
	uid = '628';//official id
}

//数据交互
$.ajax({
	type: "get",
	url: 'http://rqdld-s2.youkongwan.com/api/boss_inv_data?uid='+ uid,//1727
	dataType:"json",
	success: function(data){
		console.log(data);

		var jsonData = data;
		$('.container .partC .boxVS .userName .left').html(jsonData.challenger.name);//左侧用户名称
		//$('.container .partC .boxVS .gamer .wanJia .wanJiaImg').attr('src', 'image/wanJiaImg.png');//左侧用户头像
		$('.container .partC .boxVS .gamer .wanJia .wanJiaImg').attr('src', jsonData.challenger.img);//左侧用户头像
		$('#copyCode').val(jsonData.challenger.invicode);//协助密码code

		$('.container .partC .boxVS .userName .right').html(jsonData.boss.name);//右侧用户名称
		//$('.container .partC .boxVS .gamer .lingZhu .lingZhuImg').attr('src', 'image/lingZhuImg.png');//右侧用户头像
		$('.container .partC .boxVS .gamer .lingZhu .lingZhuImg').attr('src', jsonData.boss.img);//右侧用户头像
		$('body').show();

		//复制功能
		var clipboard = new Clipboard('.btn');

		clipboard.on('success', function(e) {
			console.info('Action:', e.action);
			console.info('Text:', e.text);
			console.info('Trigger:', e.trigger);
			$('.container .partC .codeWrap .copyBox .copyAlert').stop(true).fadeIn(200).delay(1500).fadeOut(200);

			e.clearSelection();
		});

		clipboard.on('error', function(e) {
			console.error('Action:', e.action);
			console.error('Trigger:', e.trigger);
		});

		//前往下载
		$('#downloadBtn').unbind('click').bind('click', function(){
			window.location.href = jsonData.download;
		});

		/*//马上协助
		$('#helpBtn').unbind('click').bind('click', function(){
			alert('马上协助');
		});*/

	},
	error:function(error){
		console.log(error);
	}
});


