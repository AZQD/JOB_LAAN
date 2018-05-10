!function(){function t(t){var e=t.getAttribute("data-src");t.src=e,t.removeAttribute("data-src")}function e(t){var e=t.getBoundingClientRect(),n=window.innerHeight||document.documentElement.clientHeight;if(e.left>=0)if(e.top>=0){if(e.top<=n)return!0}else if(e.bottom>=0)return!0;return!1}function n(){for(var n=0;n<i.length;)e(i[n])?(t(i[n]),i.splice(n,1)):n++}var o,i=$("img[data-src]"),r=20;i=Array.prototype.slice.apply(i),$(["scroll","resize"]).each(function(t,e){$(window).on(e,function(){var t=arguments.callee;clearTimeout(o),o=setTimeout(function(){return n(),0===i.length?($(window).off(e,t),!0):void 0},r)})}),$(window).on("load",function(){var t=arguments.callee;clearTimeout(o),o=setTimeout(function(){n(),$(window).off("load",t)},r)})}();

var mylazyload = function(i){
	function t(t) {
		var e = t.getAttribute("data-src");
		t.src = e, t.removeAttribute("data-src")
	}
	function e(t) {
		var e = t.getBoundingClientRect(),
			n = window.innerHeight || document.documentElement.clientHeight;
		if (e.left >= 0) if (e.top >= 0) {
			if (e.top <= n) return !0
		} else if (e.bottom >= 0) return !0;
		return !1
	}
	function n() {
		for (var n = 0; n < i.length;) e(i[n]) ? (t(i[n]), i.splice(n, 1)) : n++
	}
	
	//var o, i = $("img[data-src]"),
	var o, r = 20;
	i = Array.prototype.slice.apply(i), $(["scroll", "resize"]).each(function(t, e) {
		$(window).on(e, function() {
			var t = arguments.callee;
			clearTimeout(o), o = setTimeout(function() {
				return n(), 0 === i.length ? ($(window).off(e, t), !0) : void 0
			}, r)
		})
	}), $(window).on("load", function() {
		var t = arguments.callee;
		clearTimeout(o), o = setTimeout(function() {
			n(), $(window).off("load", t)
		}, r)
	});
}
