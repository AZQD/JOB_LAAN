$('.sectionPC .aboutVideo iframe').attr('src','http://open.iqiyi.com/developer/player_js/coopPlayerIndex.html?vid=24e0c2bf29bd80c75bf77e5f87255e89&tvId=714914300&accessToken=2.f22860a2479ad60d8da7697274de9346&appKey=3955c3425820435e86d0f4cdfe56f5e7&appId=1368&height=100%&width=100%');
var ajaxBtn = false;
var ajaxResult;
var ajaxKey;
var clickNum = 0;
//$('body').height($('html').height());
$('.sectionPC').height($("body").height());
var windowHeight = $('body').height();
var windowWidth = $('body').width();
//console.log(windowWidth);
//console.log(windowHeight);
var contentBoxHeight = $(".bodyContent .contentBox").height();
//console.log(contentBoxHeight);

var aa = $('.bodyContent .copyRight').height();
/*$("#erWeiMa").css({//调整二维码
	left:$('.contentBox').offset().left+$('.contentBox').width(),
	//bottom:(windowHeight-contentBoxHeight)/2
	bottom:aa+22
});*/
if(windowWidth > 1800){
	$('.bodyContent .contentBox').css('marginLeft',windowWidth/5-122);
	$('.sectionPC #fangKuaiXiong').css('left',35+'%');
}else if(windowWidth > 1700 && windowWidth <= 1800){
	$('.bodyContent .contentBox').css('marginLeft',windowWidth/6-110);
	$('.sectionPC #fangKuaiXiong').css('left',30+'%');
}else if(windowWidth > 1600 && windowWidth <= 1700){
	$('.bodyContent .contentBox').css('marginLeft',windowWidth/7-100);
	$('.sectionPC #fangKuaiXiong').css('left',26+'%');
}else if(windowWidth > 1500 && windowWidth <= 1600){
	$('.bodyContent .contentBox').css('marginLeft',windowWidth/8-90);
	$('.sectionPC #fangKuaiXiong').css('left',24+'%');
}else if(windowWidth > 1400 && windowWidth <= 1500){
	$('.bodyContent .contentBox').css('marginLeft',windowWidth/9-80);
	$('.sectionPC #fangKuaiXiong').css('left',21+'%');
}else if(windowWidth > 1300 && windowWidth <= 1400){
	$('.bodyContent .contentBox').css('marginLeft',windowWidth/10-45);
	$('.sectionPC #fangKuaiXiong').css('left',19+'%');
}else if(windowWidth > 1200 && windowWidth <= 1300){
	$('.bodyContent .contentBox').css('marginLeft',windowWidth/11-20);
	$('.sectionPC #fangKuaiXiong').css('left',17+'%');
}else if(windowWidth > 1100 && windowWidth <= 1200){
	$('.bodyContent .contentBox').css('marginLeft',windowWidth/12-10);
	$('.sectionPC #fangKuaiXiong').css('left',16+'%');
}else if(windowWidth > 1000 && windowWidth <= 1100){
	$('.bodyContent .contentBox').css('marginLeft',windowWidth/13-5);
	$('.sectionPC #fangKuaiXiong').css('left',15+'%');
}else if(windowWidth <= 1000){
	$('.bodyContent .contentBox').css('marginLeft',70+'px');
	$('.sectionPC #fangKuaiXiong').css('left',14+'%');
}
$('#addLog').attr('src', 'http://boxbear.youkongwan.cn/iqiyi/pigsdream/image/PC/logo_iqiyi.png');
$('#addLog').css({"position":"absolute","zIndex":99,"width":220});
$('#addLog').css('left',$('.bodyContent .contentBox').css('marginLeft'));
var topSize = $('.bodyContent .contentBox').offset().top;
$('#addLog').css('top',(topSize+36.5)/2);
//alert(windowWidth);
//alert($('.bodyContent .contentBox').css('marginLeft'));
$('.bodyContent .tips').css('marginLeft',$('.bodyContent .contentBox').offset().left+60);

if(windowHeight>=contentBoxHeight){
	$("#erWeiMa").css({//调整二维码
		left:$('.contentBox').offset().left+$('.contentBox').width(),
		bottom:(windowHeight-contentBoxHeight)/2-12
	});
}else{
	$("#erWeiMa").css({//调整二维码
		left:$('.contentBox').offset().left+$('.contentBox').width(),
		bottom:aa+10
	});
}

//console.log("$('.contentBox').offset().left",$('.contentBox').offset().left);
//console.log("$('.contentBox').width()",$('.contentBox').width());

$(window).resize(function(ev) {
	var windowWidth2 = $('body').width();
	ev = ev || event;
	//console.log(ev);
	//$('.sectionPC #fangKuaiXiong').css('left',16*windowWidth2/windowWidth*1.2+'%');

	/*$("#erWeiMa").css({
		left:$('.contentBox').offset().left+$('.contentBox').width(),
		//bottom:(windowHeight-contentBoxHeight)/2
	});*/
	if(windowHeight>=contentBoxHeight){
		$("#erWeiMa").css({//调整二维码
			left:$('.contentBox').offset().left+$('.contentBox').width(),
			bottom:(windowHeight-contentBoxHeight)/2-12
			//bottom:aa+22
		});
	}else{
		$("#erWeiMa").css({//调整二维码
			left:$('.contentBox').offset().left+$('.contentBox').width(),
			//bottom:(windowHeight-contentBoxHeight)/2
			bottom:aa+10
		});
	}
	/*if($('.bodyContent .contentBox').width() == 20){
		$('.bodyContent .contentBox').css('marginLeft',"50%");
	}*/
});

//$('.bodyContent .contentBox').css('marginLeft',windowWidth/5);


$(".bodyContent .contentBox").css({
	marginTop:(windowHeight-contentBoxHeight)/2
});
function ajaxFunction(){
	var xhr = $.ajax({
		type: "get",
		url: "https://j020d4ksuc.execute-api.us-west-2.amazonaws.com/boxbear/videoprom/guajiang",
		success: function (data){
			console.log(data);
			ajaxBtn = true;
			ajaxResult = data.result;
			if(ajaxResult){
				ajaxKey = data.key;
			}
		}
	});
	setTimeout(function(){
		if(ajaxBtn == false){
			xhr.abort();//停止ajax
			ajaxBtn = true;
			ajaxResult = false;
		}
	}, 5000);
}
$('#erWeiMa,#fangKuaiXiong,#copyRight').show();
$('#pcIframe').css('width',$('#pcDJM').width());
function randomNum(e, n, t) { for(var o = [], a = 0; t > a; a++) { o[a] = Math.floor(Math.random() * (n - e) + e); for(var i = 0; a > i; i++) o[a] == o[i] && a-- } return o } $(function() {
	$(".bodyContent .contentBox").css("background", "rgba(255,255,255,0.6)"), setInterval(function() { $(".page1 .swipeUp").css({ bottom: "0", opacity: 0 }).animate({ bottom: "1.875rem", opacity: 1 }, 600, "linear").delay(200).animate({ bottom: "2.5rem", opacity: 0 }, 600, "linear") }, 1800), $(".page1 .gameRule").unbind("click").click(function() { $(".tips").show(), $(".page1 .bg").show() }), $(".page1 .tips .title .btnClose img").unbind("click").click(function() { $(".tips").hide(), $(".page1 .bg").hide() }), $(".bodyContent .contentBox .contentTitle").click(function() { $(".bodyContent .tips").show(), $('#erWeiMa').css('opacity',1), $(".bodyContent .bg").hide(), $(".contentInner").css("opacity", "0.5") }), $(".bodyContent .tips .title .btnClose img").unbind("click").click(function() { $(".tips").hide(),$('#erWeiMa').css('opacity',1), $(".bodyContent .bg").hide(), $(".contentInner").css("opacity", "1") });
	var e = new Swiper(".swiper-container", { direction: "vertical", height: 690, initialSlide: 0, freeModeSticky: !0, touchMoveStopPropagation: !0, onSlideChangeEnd: function(n) { 1 == e.activeIndex && e.lockSwipes() } });
	e.lockSwipes(),$("body").css("overflow-y",'scroll'); $(".page2 .page2Content .introduce .btnToQue").click(function() {$(".aboutVideo iframe").attr("src",""); $("body").css("overflow",'scroll');ajaxFunction(); e.unlockSwipes(), e.slideTo(1, 1e3, !1), e.lockSwipes() });
	var n = randomNum(0, 3, 3),
		t = randomNum(0, 3, 3),
		o = [
			{ id: 0, questionTitleName: "本期节目里蛋蛋猪因为用功学习获得了什么奖励呢？", answerABC: ["趣威小手机", "趣威点读书", "趣威小汽车"], answerA: "趣威小手机", answerB: "趣威点读书", answerC: "趣威小汽车", titleImgUrl: "http://h.boxbeartv.com/iqiyi/0703/image/timu1.jpg", rightAnswer: "趣威小手机" },
			{ id: 1, questionTitleName: "以下哪个是报警电话呢？", answerABC: ["120", "110", "119"], answerA: "120", answerB: "110", answerC: "119", titleImgUrl: "http://h.boxbeartv.com/iqiyi/0703/image/timu2.jpg", rightAnswer: "110" },
			{ id: 4, questionTitleName: "本期节目里蛋蛋猪第一个电话打给谁了呢？", answerABC: ["月亮婆婆", "小兔子", "太阳公公"], answerA: "月亮婆婆", answerB: "小兔子", answerC: "太阳公公", titleImgUrl: "http://h.boxbeartv.com/iqiyi/0703/image/timu3.jpg", rightAnswer: "太阳公公" }
/*
			{ id: 0, questionTitleName: "本期节目里方块熊教谁做雪糕呢？", answerABC: ["佩奇", "乔治", "蛋蛋猪"], answerA: "佩奇", answerB: "乔治", answerC: "蛋蛋猪", titleImgUrl: "http://h.boxbeartv.com/iqiyi/0703/image/timu1.jpg", rightAnswer: "蛋蛋猪" },
			{ id: 1, questionTitleName: "蛋蛋猪为什么要学做雪糕呢？", answerABC: ["他想送给好朋友", "他想开个雪糕店", "他想送给家人吃"], answerA: "他想送给好朋友", answerB: "他想开个雪糕店", answerC: "他想送给家人吃", titleImgUrl: "http://h.boxbeartv.com/iqiyi/0703/image/timu2.jpg", rightAnswer: "他想开个雪糕店" },
			{ id: 2, questionTitleName: "故事里方块熊用的魔力沙是？", answerABC: ["伊比沙", "培培乐", "趣威"], answerA: "伊比沙", answerB: "培培乐", answerC: "趣威", titleImgUrl: "http://h.boxbeartv.com/iqiyi/0703/image/timu3.jpg", rightAnswer: "伊比沙" },
			{ id: 3, questionTitleName: "蛋蛋猪找谁帮忙做雪糕呢？", answerABC: ["小丸子", "西瓜猴", "方块熊"], answerA: "小丸子", answerB: "西瓜猴", answerC: "方块熊", titleImgUrl: "http://h.boxbeartv.com/iqiyi/0703/image/timu4.jpg", rightAnswer: "方块熊" },
			{ id: 4, questionTitleName: "是谁想在方块熊乐园里开雪糕店呢？", answerABC: ["蛋蛋猪", "西瓜猴", "方块熊"], answerA: "蛋蛋猪", answerB: "西瓜猴", answerC: "方块熊", titleImgUrl: "http://h.boxbeartv.com/iqiyi/0703/image/timu5.jpg", rightAnswer: "蛋蛋猪" }
*/
		],
		a = 0,
		i = !0,
		s = 0;
	$(".page3 .page3Content .questionTitle p .nums .num").html(a + 1), $(".page3 .page3Content .questionTitle p .questionTitleName").html(o[n[a]].questionTitleName), $(".page3 .page3Content .questionTitle img").attr("src", o[n[a]].titleImgUrl), $(".page3 .page3Content .answer .answerA").html(o[n[a]].answerABC[t[0]]), $(".page3 .page3Content .answer .answerB").html(o[n[a]].answerABC[t[1]]), $(".page3 .page3Content .answer .answerC").html(o[n[a]].answerABC[t[2]]), $(".page3 .page3Content .answerBox .answer").on("touchstart", function() {console.log($(this)); $(this).css({ background: "#FD6568"}) }).on("touchend", function() { $(this).css({ background: "#fff"}) }).click(function() {
		if(i) {
			i = !1;
			var r = $(this).index();
			$(".page3 .page3Content .answerBox2 .answer .answerContent").eq(r).html() == o[n[a]].rightAnswer ? (s += 33, $(".page3 .page3Content .answerBox2 .answer .isTrue img").css("opacity", 0).eq(r).css("opacity", 1).attr("src", "http://h.boxbeartv.com/iqiyi/0703/image/three_right.png")) : $(".page3 .page3Content .answerBox2 .answer .isTrue img").css("opacity", 0).eq(r).css("opacity", 1).attr("src", "http://h.boxbeartv.com/iqiyi/0703/image/three_wrong.png"), a++
		}
		setTimeout(function() {if(s == 99){s = 100;} 3 == a && (e.unlockSwipes(), e.slideTo(2, 1e3, !1), e.lockSwipes(),  $(".page4 .page4Content .page4Box .four_myScore").html(s)),

		console.log(s);

			console.log(clickNum++);
			
			if(s < 33){



				//$(".page4 .page4Content .page4Box .btnChooses .chouJiang").html("关注微信群");
				$(".page4 .page4Content .page4Box .lessCount").html("分数不够，无法抽奖");
				$(".page4 .page4Content .page4Box .chouJiang").html("再试一次").unbind("click").click(function(){
					window.location.reload();
				});
			}else{


				if(clickNum == 3){
					setTimeout(function () {
						$(".page4 .alertBoxNoGift").show();
						$(".page4 .alertBoxNoGift .zhongJiang").hide();
						$(".page4 .alertBoxNoGift .writeMsg").hide();
						$(".page4 .alertBoxNoGift .alertBoxText .writeMsg").unbind("click").click(function(){//显示二维码
							window.location.reload();
						});
					}, 2000);
				}
				$('.page4 .page4Content .page4Box .btnChooses .chouJiang').hide();
				$(".page4 .page4Content .page4Box .lessCount").html("");//分数过关提示

				/*setTimeout(function () {
					$(".page4 .alertBoxNoGift").show();
					$(".page4 .alertBoxNoGift .zhongJiang").hide();
					$(".page4 .alertBoxNoGift .writeMsg").hide();
					$(".page4 .alertBoxNoGift .alertBoxText .writeMsg").unbind("click").click(function(){//显示二维码
						window.location.reload();
					});
				}, 2000);*/


                /*console.log(ajaxBtn);
				$(".page4 .page4Content .page4Box .lessCount").html("恭喜您获得一次抽奖机会！").hide();
				$(".page4 .page4Content .page4Box .chouJiang").html("立即抽奖！").hide().unbind("click").click(function(){
                    if(ajaxBtn == true){
                        //console.log(data);
                        if(ajaxResult){//中奖
                            $(".page4 .alertBoxSuccess").show();
                            $(".page4 .alertBoxSuccess .duiJiangID").html(ajaxKey);
                            $(".page4 .alertBoxSuccess .writeMsg").unbind("click").click(function(){//跳转到填写表单页面
                                //window.location.href = "http://cn.mikecrm.com/HFOjv1P";
                                e.unlockSwipes(),
                                    e.slideTo(3, 1e3, !0),
                                    e.lockSwipes()
                                $(".page5 .aboutDJM .aboutDJMID").html(ajaxKey);
                                $('#mobileIframe').css('width',$(".page5 .aboutDJM").width());

                            });
                        }else{//没有中奖:参与集体抽奖活动
                            $(".page4 .alertBoxNoGift").show();
                            $(".page4 .alertBoxNoGift .alertBoxText .writeMsg").unbind("click").click(function(){//显示二维码
                                window.location.reload();
                            });
                        }
                    }else{
                        $(".page4 .alertLoading").show();
                        htmlobj = $.ajax({
                            url: "https://j020d4ksuc.execute-api.us-west-2.amazonaws.com/boxbear/videoprom/guajiang",
                            //async: false
                            success:function(data){
                                $(".page4 .alertLoading").hide();
                                console.log(data);
                                if(data.result){//中奖
                                    $(".page4 .alertBoxSuccess").show();
                                    $(".page4 .alertBoxSuccess .duiJiangID").html(data.key);
                                    $(".page4 .alertBoxSuccess .writeMsg").unbind("click").click(function(){//跳转到填写表单页面
                                        //window.location.href = "http://cn.mikecrm.com/HFOjv1P";
                                        e.unlockSwipes(),
                                            e.slideTo(3, 1e3, !0),
                                            e.lockSwipes()
                                        $(".page5 .aboutDJM .aboutDJMID").html(data.key);
                                        $('#pcIframe body').css("background","rgba(255, 255, 255,0.5)");
                                        //$('#pcIframe').css('width',$('#pcDJM').width());

                                    });
                                }else{//没有中奖:参与集体抽奖活动
                                    $(".page4 .alertBoxNoGift").show();
                                    $(".page4 .alertBoxNoGift .alertBoxText .writeMsg").unbind("click").click(function(){//显示二维码
                                        window.location.reload();
                                    });
                                }
                            }
                        });
                    }
				});*/
			}


		3 > a && ($(".page3 .page3Content .questionTitle p .questionTitleName").html(o[n[a]].questionTitleName), $(".page3 .page3Content .questionTitle img").attr("src", o[n[a]].titleImgUrl), $(".page3 .page3Content .answer .answerA").html(o[n[a]].answerABC[t[0]]), $(".page3 .page3Content .answer .answerB").html(o[n[a]].answerABC[t[1]]), $(".page3 .page3Content .answer .answerC").html(o[n[a]].answerABC[t[2]]), $(".page3 .page3Content .answer .isTrue img").css("opacity", 0), $(".page3 .page3Content .questionTitle p .nums .num").html(a + 1)), i = !0 }, 1e3)

	}), $(".page4 .page4Content .page4Box .try").click(function() {
		window.location.reload() 
	}), 
	$(".page4 .page4Content .page4Box .btnChooses .shareGame").click(function() { 
		$(".page4 .shareBg").show() }), 
		$(".page4 .shareBg").click(function() { 
			$(".page4 .shareBg").hide() 
		}),
		/*$(".page4 .page4Content .page4Box .btnChooses .chouJiang").click(function () {
			alert(1);
			//$(".page4 .alertLoading").show();
			$(".page4 .alertBoxSuccess").show();
			$(".page4 .alertBoxSuccess .duiJiangID").html(1111);
			$(".page4 .alertBoxSuccess .writeMsg").unbind("click").click(function(){//跳转到填写表单页面
				//window.location.href = "http://cn.mikecrm.com/HFOjv1P";
				e.unlockSwipes(),
					e.slideTo(3, 1e3, !0),
					e.lockSwipes()
				$(".page5 .aboutDJM .aboutDJMID").html(1111);
				$('#mobileIframe').css('width',$(".page5 .aboutDJM").width());

			});
			htmlobj = $.ajax({
				url: "https://j020d4ksuc.execute-api.us-west-2.amazonaws.com/boxbear/videoprom/guajiang",
				//async: false
				success:function(data){
					$(".page4 .alertLoading").hide();
					console.log(data);
					if(data.result){//中奖
						$(".page4 .alertBoxSuccess").show();
						$(".page4 .alertBoxSuccess .duiJiangID").html(data.key);
						$(".page4 .alertBoxSuccess .writeMsg").unbind("click").click(function(){//跳转到填写表单页面
							//window.location.href = "http://cn.mikecrm.com/HFOjv1P";
							e.unlockSwipes(),
								e.slideTo(3, 1e3, !0),
								e.lockSwipes()
							$(".page5 .aboutDJM .aboutDJMID").html(data.key);
							$('#mobileIframe').css('width',$(".page5 .aboutDJM").width());

						});
					}else{//没有中奖:参与集体抽奖活动
						$(".page4 .alertBoxNoGift").show();
						$(".page4 .alertBoxNoGift .alertBoxText .writeMsg").unbind("click").click(function(){//显示二维码
							window.location.reload();
						});
					}
				}
			});


			/!*e.unlockSwipes(),
				e.slideTo(3, 1e3, !1),
				e.lockSwipes(),

				//mik6Zra0Bd
				$('#mkin6Zra0Bd1').on("load", function () {
					e.unlockSwipes(),
						e.slideTo(4, 1e3, !1),
						e.lockSwipes()
				});*!/
		}),*/

		$(".page4 .page4Content .page4Box .btnChooses .chouJiang").click(function() {
			//alert("您的分数没有及格哦，请重新观看视频答题及格后再来抽奖~");
			$(".page4 .alertLowCount").show();
			$(".page4 .alertLowCount .chouJiangImg").show();
			$(".page4 .alertLowCount .chouJiangImg .closeImg").unbind("click").click(function(){//展示二维码
				$(".page4 .alertLowCount").hide();
			});
			/*$(".page4 .alertLowCount .writeMsg1").unbind("click").click(function(){//展示二维码
			 $(".page4 .alertLowCount .chouJiangImg").show();
			 $(".page4 .alertLowCount .chouJiangImg .closeImg").unbind("click").click(function(){//展示二维码
			 $(".page4 .alertLowCount .chouJiangImg").hide();
			 });
			 });
			 $(".page4 .alertLowCount .writeMsg2").unbind("click").click(function(){//刷新页面
			 window.location.reload();
			 });*/

			//mkin6Zra0Bd
			//setTimeout(function() {
			theW = $('#formContainer').width();
			$('#mkin6Zra0Bd').attr("width", theW);
			$('#mkin6Zra0Bd').css("width", theW);
			//}, 1000);

			$('#mkin6Zra0Bd').on("load", function() {
				e.unlockSwipes(),
					e.slideTo(4, 1e3, !0),
					e.lockSwipes()
			});
		}),

		e.lockSwipes();

	
	$(".page5 .page5Content .submitInfo").click(function() { 
	$.trim($(".page5 .page5Content .page5Box .infoCommon .nameInfo2").val()) && $.trim($(".page5 .page5Content .page5Box .infoCommon .phoneInfo2").val()) && $.trim($(".page5 .page5Content .page5Box .infoCommon .addressInfo2").val()) && $.trim($(".page5 .page5Content .page5Box .infoCommon .weChatInfo2").val()) ? (e.unlockSwipes(), e.slideTo(4, 1e3, !1), e.lockSwipes()) : alert("请填写完整内容") }), $(".page6 .page6Content .page6Box .try").click(function() { window.location.reload() }), $(".page6 .page6Content .page6Box .btnChooses .shareGame").click(function() { $(".page6 .shareBg").show() }), $(".page6 .shareBg").click(function() { $(".page6 .shareBg").hide() })

});
