$('.sectionMobile .aboutVideo iframe').attr('src','http://open.iqiyi.com/developer/player_js/coopPlayerIndex.html?vid=d705f539b3e718d8b09f45cc9b65f7b6&tvId=656246600&accessToken=2.f22860a2479ad60d8da7697274de9346&appKey=3955c3425820435e86d0f4cdfe56f5e7&appId=1368&height=100%&width=100%');
var str = "";

function randomNum(e, n, t) {
	for(var a = [], o = 0; t > o; o++) {
		a[o] = Math.floor(Math.random() * (n - e) + e);
		for(var i = 0; o > i; i++) a[o] == a[i] && o--
	}
	return a
}
var ajaxBtn = false;
var ajaxResult;
var ajaxKey;
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
$('#mobileIframe').css('width',$('#mobileDJM').width());
$(function() {

	$(".bodyContent .contentBox").css("background", "rgba(255,255,255,0.6)"),
		setInterval(function() {
				$(".page1 .swipeUp").css({
					bottom: "0",
					opacity: 0
				}).animate({
						bottom: "1.875rem",
						opacity: 1
					},
					600, "linear").delay(200).animate({
						bottom: "2.5rem",
						opacity: 0
					},
					600, "linear")
			},
			1800),
    
	    $(".page2 .gameRule").unbind("click").click(function() {
			$(".tips").show(),
				$(".page2 .bg").show()
		}),
		$(".page2 .tips .title .btnClose img").unbind("click").click(function() {
			$(".tips").hide(),
				$(".page2 .bg").hide()
		}),
		$(".bodyContent .contentBox .contentTitle").click(function() {
			$(".bodyContent .tips").show(),
				$(".bodyContent .bg").show(),
				$(".contentInner").css("opacity", "0.5")
		}),
		$(".bodyContent .tips .title .btnClose img").unbind("click").click(function() {
			$(".tips").hide(),
				$(".bodyContent .bg").hide(),
				$(".contentInner").css("opacity", "1")
		});
	var e = new Swiper(".swiper-container", {
		direction: "vertical",
		height: $(window).height(),
		initialSlide: 0,
		freeModeSticky: !0,
		touchMoveStopPropagation: !0,
		onSlideChangeEnd: function(n) {
			1 == e.activeIndex && e.lockSwipes()
		}
	});
	e.lockSwipes();
	$(".page2 .page2Content .introduce .btnToQue").click(function() {
		$(".sectionMobile .aboutVideo iframe").attr("src","");
		$(".sectionMobile .aboutVideo").remove();
        ajaxFunction();
		e.unlockSwipes(),
			e.slideTo(1, 1e3, !0),
			e.lockSwipes()
	});
	var n = randomNum(0, 5, 5),
		t = randomNum(0, 3, 3),
		a = [{ id: 0, questionTitleName: "本期节目里方块熊教谁做雪糕呢？", answerABC: ["佩奇", "乔治", "蛋蛋猪"], answerA: "佩奇", answerB: "乔治", answerC: "蛋蛋猪", titleImgUrl: "http://boxbear.youkongwan.cn/iqiyi/pigsdream/image/timu1.jpg", rightAnswer: "蛋蛋猪" }, 
			{ id: 1, questionTitleName: "蛋蛋猪为什么要学做雪糕呢？", answerABC: ["他想送给好朋友", "他想开个雪糕店", "他想送给家人吃"], answerA: "他想送给好朋友", answerB: "他想开个雪糕店", answerC: "他想送给家人吃", titleImgUrl: "http://boxbear.youkongwan.cn/iqiyi/pigsdream/image/timu2.jpg", rightAnswer: "他想开个雪糕店" }, 
			{ id: 2, questionTitleName: "故事里方块熊用的魔力沙是？", answerABC: ["伊比沙", "培培乐", "趣威"], answerA: "伊比沙", answerB: "培培乐", answerC: "趣威", titleImgUrl: "http://boxbear.youkongwan.cn/iqiyi/pigsdream/image/timu3.jpg", rightAnswer: "伊比沙" }, 
			{ id: 3, questionTitleName: "蛋蛋猪找谁帮忙做雪糕呢？", answerABC: ["小丸子", "西瓜猴", "方块熊"], answerA: "小丸子", answerB: "西瓜猴", answerC: "方块熊", titleImgUrl: "http://boxbear.youkongwan.cn/iqiyi/pigsdream/image/timu4.jpg", rightAnswer: "方块熊" }, 
			{ id: 4, questionTitleName: "是谁想在方块熊乐园里开雪糕店呢？", answerABC: ["蛋蛋猪", "西瓜猴", "方块熊"], answerA: "蛋蛋猪", answerB: "西瓜猴", answerC: "方块熊", titleImgUrl: "http://boxbear.youkongwan.cn/iqiyi/pigsdream/image/timu5.jpg", rightAnswer: "蛋蛋猪" }
		],
		o = 0,
		i = !0,
		s = 0;
	$(".page3 .page3Content .questionTitle p .nums .num").html(o + 1),
		$(".page3 .page3Content .questionTitle p .questionTitleName").html(a[n[o]].questionTitleName),
		$(".page3 .page3Content .questionTitle img").attr("src", a[n[o]].titleImgUrl),
		$(".page3 .page3Content .answer .answerA").html(a[n[o]].answerABC[t[0]]),
		$(".page3 .page3Content .answer .answerB").html(a[n[o]].answerABC[t[1]]),
		$(".page3 .page3Content .answer .answerC").html(a[n[o]].answerABC[t[2]]),
		$(".page3 .page3Content .answerBox .answer").on("touchstart",
			function() {
				$(this).css({
					background: "#FD6568",
					//color: "#fff",
					//border: "1px solid #fff"
				})
			}).on("touchend",
			function() {
				$(this).css({
					background: "#fff",
					//color: "#FD6568",
					//border: "1px solid #abe0b5"
				})
			}).click(function() {
			if(i) {
				i = !1;
				var r = $(this).index();
				$(".page3 .page3Content .answer .answerContent").eq(r).html() == a[n[o]].rightAnswer ? (s += 20, $(".page3 .page3Content .answer .isTrue img").css("opacity", 0).eq(r).css("opacity", 1).attr("src", "http://boxbear.youkongwan.cn/iqiyi/pigsdream/image/three_right.png")) : $(".page3 .page3Content .answer .isTrue img").css("opacity", 0).eq(r).css("opacity", 1).attr("src", "http://boxbear.youkongwan.cn/iqiyi/pigsdream/image/three_wrong.png"),
					o++
			}
			
			
			setTimeout(function() {
					if (o == 5) {
						//alert("答题结束，分数为" + s);
						
						e.unlockSwipes();
						e.slideTo(2, 1e3, !0);
						e.lockSwipes();
						$(".page4 .page4Content .page4Box .four_myScore").html(s);
                        if(s < 40){
                            //$(".page4 .page4Content .page4Box .btnChooses .chouJiang").html("关注微信群");
                            $(".page4 .page4Content .page4Box .lessCount").html("分数不够，无法抽奖");
                            $(".page4 .page4Content .page4Box .tryAgain").html("再试一次").unbind("click").click(function(){
                                window.location.reload();
                            });
							$(".page4 .page4Content .page4Box .btnChooses").hide();
                        }else{
							$('.page4 .page4Content .page4Box .tryAgain').hide();
                            $(".page4 .page4Content .page4Box .lessCount").html("恭喜您获得一次抽奖机会");
                            $(".page4 .page4Content .page4Box .btnChooses .chouJiang").html("立即抽奖").unbind("click").click(function(){
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
                                            //$('#mobileIframe').css('width',$(".page5 .aboutDJM").width());

                                        });
                                    }else{//没有中奖:参与集体抽奖活动
                                        $(".page4 .alertBoxNoGift").show();
										$('.page4 .alertBoxNoGift .alertBoxText').css('top',($(window).height()-$('.page4 .alertBoxNoGift .alertBoxText').innerHeight())/2);
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
                                                    $('#mobileIframe').css('width',$(".page5 .aboutDJM").width());

                                                });
                                            }else{//没有中奖:参与集体抽奖活动
                                                $(".page4 .alertBoxNoGift").show();
												$('.page4 .alertBoxNoGift .alertBoxText').css('top',($(window).height()-$('.page4 .alertBoxNoGift .alertBoxText').innerHeight())/2);
                                                $(".page4 .alertBoxNoGift .alertBoxText .writeMsg").unbind("click").click(function(){//显示二维码
                                                    window.location.reload();
                                                });
                                            }
                                        }
                                    });
                                }
                            });
                        }
					} else {
						$(".page3 .page3Content .questionTitle p .questionTitleName").html(a[n[o]].questionTitleName);
						$(".page3 .page3Content .questionTitle img").attr("src", a[n[o]].titleImgUrl);
						$(".page3 .page3Content .answer .answerA").html(a[n[o]].answerABC[t[0]]);
						$(".page3 .page3Content .answer .answerB").html(a[n[o]].answerABC[t[1]]);
						$(".page3 .page3Content .answer .answerC").html(a[n[o]].answerABC[t[2]]);
						$(".page3 .page3Content .answer .isTrue img").css("opacity", 0);
						$(".page3 .page3Content .questionTitle p .nums .num").html(o + 1);
					}
					i = !0;
				},
				
				1e3)
			
		}),
		e.lockSwipes();
	$(".page4 .page4Content .page4Box .try").click(function() {
			window.location.reload()
		}),
		$(".page4 .page4Content .page4Box .btnChooses .shareGame").click(function() {
			$(".page4 .shareBg").show()
		}),
		$(".page4 .shareBg").click(function() {
			$(".page4 .shareBg").hide()
		}),

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
			$.trim($(".page5 .page5Content .page5Box .infoCommon .nameInfo").val()) && $.trim($(".page5 .page5Content .page5Box .infoCommon .phoneInfo").val()) && $.trim($(".page5 .page5Content .page5Box .infoCommon .addressInfo").val()) && $.trim($(".page5 .page5Content .page5Box .infoCommon .weChatInfo").val()) ? (e.unlockSwipes(), e.slideTo(5, 1e3, !1), e.lockSwipes()) : alert("请填写完整内容")
		}),
		$(".page6 .page6Content .page6Box .try").click(function() {
			window.location.reload()
		}),
		$(".page6 .page6Content .page6Box .btnChooses .shareGame").click(function() {
			$(".page6 .shareBg").show()
		}),
		$(".page6 .shareBg").click(function() {
			$(".page6 .shareBg").hide()
		})

});