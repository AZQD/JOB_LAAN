function isMobile() {
	for(var e = new Array("Android", "iPhone", "Windows Phone", "iPod", "BlackBerry", "MeeGo", "SymbianOS"), i = navigator.userAgent, n = e.length, s = 0; n > s; s++)
		if(i.indexOf(e[s]) >= 0) return "isMobile";
	return "isPC"
}
$(function() { var e = isMobile(); "isMobile" == e ? ($("body").show(), $("section").hide().eq(0).show(), $(".sectionMobile").addClass("swiper-container"), $(".sectionPC .contentInner").removeClass("swiper-container"), $("#viewport").show(), $("#linkHref").attr("href", "css/indexMobile.min.css"), $("#scriptSrc").attr("src", "js/indexMobile.min.js"), setTimeout(function() { $(".page1 .gameRule,.page1 .swipeUp").css("opacity", "1") }, 100)) : ($("body").show().css('opacity', 0), $("section").hide().eq(1).show(), $(".sectionMobile").removeClass("swiper-container"), $(".sectionPC .contentInner").addClass("swiper-container"), $("#viewport").hide(), $("#linkHref").attr("href", "css/indexPC.min.css"), $("#scriptSrc").attr("src", "js/indexPC.min.js"), setTimeout(function() { $(".contentBox").css("opacity", "1") }, 100)) });

setTimeout(function(){
    $("body").css('opacity', 1);
}, 200);

$(function() {
    //alert($(window).height());
    $('#ClickMe').click(function() {
        $('#code').center();
        $('#goodcover').show();
        $('#code').fadeIn();
    });
    $('#closebt').click(function() {
        $('#code').hide();
        $("#goodcover").hide();
    });
	$('#goodcover').click(function() {
        $('#code').hide();
        $('#goodcover').hide();
    });
    //
    $('.follow').click(function() {
			$('#code1').center();
			$('#goodcover1').show();
			$('#code1').fadeIn();
		});
	    $('#closebt1').click(function() {
		    $('#code1').hide();
		    $("#goodcover1").hide();
	    });
	    $('#goodcover1').click(function() {
	 	    $('#code1').hide();
		    $('#goodcover1').hide();
	    });
	//
	$('#gzwm').click(function() {
			$('#code2').center();
			$('#goodcover2').show();
			$('#code2').fadeIn();
		});
	    $('#closebt2').click(function() {
		    $('#code2').hide();
		    $("#goodcover2").hide();
	    });
	    $('#goodcover2').click(function() {
	 	    $('#code2').hide();
		    $('#goodcover2').hide();
	    });
    /*var val=$(window).height();
	var codeheight=$("#code").height();
    var topheight=(val-codeheight)/2;
	$('#code').css('top',topheight);*/
    jQuery.fn.center = function(loaded) {
        var obj = this;
        body_width = parseInt($(window).width());
        body_height = parseInt($(window).height());
        block_width = parseInt(obj.width());
        block_height = parseInt(obj.height());

        left_position = parseInt((body_width / 2) - (block_width / 2) + $(window).scrollLeft());
        if (body_width < block_width) {
            left_position = 0 + $(window).scrollLeft();
        };

        top_position = parseInt((body_height / 2) - (block_height / 2) + $(window).scrollTop());
        if (body_height < block_height) {
            top_position = 0 + $(window).scrollTop();
        };

        if (!loaded) {

            obj.css({
                'position': 'absolute'
            });
            obj.css({
                'top': ($(window).height() - $('#code').height()) * 0.5,
                'left': left_position
            });
            $(window).bind('resize', function() {
                obj.center(!loaded);
            });
            $(window).bind('scroll', function() {
                obj.center(!loaded);
            });

        } else {
            obj.stop();
            obj.css({
                'position': 'absolute'
            });
            obj.animate({
                'top': top_position
            }, 200, 'linear');
        }
    }

})