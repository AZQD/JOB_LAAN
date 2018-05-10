local _M = {
    _VERSION = '0.01',
    
    base_dir = "/usr/local/openresty/nginx/html/lusaka_relese/infopub/",

	debug = true,
	
	--每页最多显示多少条
	page_items = 10,
    --redis
    REDIS_HOST = '127.0.0.1',
    REDIS_PORT = 6379,
    comments_path = '/data/comments/',
    wishs_path = '/data/wishs/',
    ups_path = '/data/ups/',
    downs_path = '/data/downs/',
    imgs_path = '/data/imgs/',
    tmp_path = '/data/tmp/',
	api_host = 'http://127.0.0.1:82',
    aes_key = 'ka!ichI', --只用于图片上传/删除接口，可随意更改

    --mysql
    mysql_option = {
        host = "127.0.0.1",
		port = 3306,
		database = "infopub",
		user = "infopub",
		password = "infopub123",
		max_packet_size = 1024 * 1024 
    },
    
    wap_analytics = [[<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62646409-12', 'auto');ga('send', 'pageview');</script>]],

    web_analytics = [[<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');ga('create', 'UA-62646409-13', 'auto');ga('send', 'pageview');</script>]],

    img_host_interface = 'http://www.kalichimall.com/gimg',
}

return _M
