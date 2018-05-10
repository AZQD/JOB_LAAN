var adName;
var linkURL;
var imageURL;
var showTrackingURLs;
var clickTrackingURLs;


function init(name, url, image, st, ct){
	adName = name;
	linkURL = url;
	imageURL = image;
	
	if (st && st.match(/^\{\{/) == null) {
		showTrackingURLs = [st];
	}
	if (ct && ct.match(/^\{\{/) == null) {
		clickTrackingURLs = [ct];
	}

	var urlParameters = new Object();
	var url = location.search; //获取url中"?"符后的字串 
	if (url.indexOf("?") != -1) { 
		var str = url.substr(1); 
		strs = str.split("&"); 
		for(var i = 0; i < strs.length; i ++) { 
			urlParameters[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]); 
		} 
	}
	
	if (urlParameters["js"]) {
		try {
		  var script = document.createElement('script');
		  script.src = urlParameters["js"];
		  document.getElementsByTagName('head')[0].appendChild(script);
		} catch (e) {
		}
	} else if (urlParameters["ads"]) {
		var ads = JSON.parse(urlParameters["ads"]);
		var index = parseInt(Math.random() * ads.length);
		setAdData(ads[index]);
	} else {
		setAdData(urlParameters);
	}
	
	//channel
	var adC = document.getElementById("adC_");
	if (adC) {
		var images = adC.getElementsByTagName("img");
		if (images && images.length > 0) {
			var channelName = images[0].alt;
			if (channelName && channelName.length > 0) {
				adName = channelName + "_" + adName;
			}
		}
	}
	
	//google analytics	
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','http://www.google-analytics.com/analytics.js','ga');
	ga('create', 'UA-62646409-4', 'auto');
	ga('send', 'pageview');
	ga('send', 'event', 'button', 'click', '[' + adName + ']init');
}

function setAdData(adData) {
	if (adData["channel"]) {
		adName = adData["channel"] + "_" + adName;
	}
	
	if (adData["linkURL"]) {
		linkURL = adData["linkURL"];
	}
	
	if (adData["imageURL"]) {
		imageURL = adData["imageURL"];
	}
	
	if (imageURL) {
		var adImage = document.getElementById("adImage");
		if (adImage) adImage.src = imageURL;
	}
	
	//show ad tracking
	if (adData["st"]) {
		showTrackingURLs = [adData["st"]];
	} else if(adData["sts"]) {
		showTrackingURLs = adData["sts"];
	}
	
	//click ad tracking
	if (adData["ct"]) {
		clickTrackingURLs = [adData["ct"]];
	} else if (adData["cts"]) {
		clickTrackingURLs = adData["cts"];
	}
	
	checkPageVisibleTimer = setInterval(checkPageVisible, 100);
}

var checkPageVisibleTimer;

function checkPageVisible() {
	if (isVisible()) {
		//console.log("go");
		clearInterval(checkPageVisibleTimer);
		
		//show ad tracking
		sendTracking(showTrackingURLs);
		
		ga('send', 'event', 'button', 'click', '[' + adName + ']show');
	}    		

}

function isVisible() {
	//console.log(document.hidden, document.hidden == false);
	//console.log(document.visibilityState, document.visibilityState == "hidden");
	if (document.hidden === true) return false;
	if (document.visibilityState == "hidden") return false;
	
	if (window.innerWidth == 0 || window.innerHeight == 0) {
		//console.log(window.innerWidth, window.innerHeight)
		return false;
	}
	if (document.body.clientWidth == 0 || document.body.clientHeight == 0) {
		//console.log(document.body.clientWidth, document.body.clientHeight)
		return false;
	}
	if (document.documentElement.clientWidth == 0 || document.documentElement.clientHeight == 0) {
		//console.log(document.documentElement.clientWidth, document.documentElement.clientHeight)
		return false;
	}
	
	return true;
}

//send a tracking request
function sendTracking(trackURLs) {
	if (!trackURLs) return;
	
	for(var key in trackURLs) {
		var url = trackURLs[key];
    	if (url && url.match(/^\{\{/) == null) {
			try {
			  var script = document.createElement('script');
			  script.src = url;
			  document.getElementsByTagName('head')[0].appendChild(script);
			} catch (e) {
			}
    		//document.getElementById("tackingImage").src = url;
    	}
	}
}


function toExit() {
	ga('send', 'event', 'button', 'click', '[' + adName + ']exit');
	location.href = '[cmd_exit_app]';
	setTimeout(toExit2, 200);
}

function toExit2() {
	location.href = '[cmd_exitapp]';;
}

function toClose() {
	ga('send', 'event', 'button', 'click', '[' + adName + ']close');
	location.href = '[cmd_close]';
}

function toOpen() {
	ga('send', 'event', 'button', 'click', '[' + adName + ']open');
	
	//send the click ad tracking
	if (linkURL) {
		if (clickTrackingURLs && clickTrackingURLs.length > 0) {
			sendTracking(clickTrackingURLs);
		
			setTimeout(function(){
				location.href = linkURL;
			}, 400);
		} else {
			location.href = linkURL;
		}
	}
}


