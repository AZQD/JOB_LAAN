<link rel="stylesheet" href="/js/lanrenzhijia.css" />
<script type="text/javascript" src="/js/lanrenzhijia.js"></script>
<script>

function clickme(i){
	var tip = "";
	switch(i){
		case 1:
			tip = "服务器繁忙，请稍后再试。";
		break;
		case 4:
			tip = "设置成功！";
		break;
		case 5:
			tip = "数据拉取失败";
		break;
		case 6:
			tip = "正在加载中，请稍后...";
		break;
	}
	ZENG.msgbox.show(tip, i);
}
function clickhide(){
	ZENG.msgbox._hide();
}
function clickautohide(i,m){
	
	switch(m){
		case 1:
			tip = (i);
		break;
		case 4:
			tip = (i);
		break;
		case 5:
			tip = (i);
		break;
		case 6:
			tip = (i);
		break;
	}
	ZENG.msgbox.show(i, m, 2000);
}
</script>

<%       ' ## 变量必须定义
	Response.Expires = 0   ' ## 直接读取服务器资料
	'response.buffer = true ' ## 是否要输出到缓冲区
	'on error resume next  ' ## 跳过错误
	Session.TimeOut = 60  'Session保留时间240分钟
sub mgbox(str,str1,str2)
response.Write("<script>clickautohide('"&str&"',"&str1&")</script><meta charset=utf-8' http-equiv='Refresh' content='2;URL="&str2&"'  />")
end sub

sub mbox(str,str1)
response.Write("<script>clickautohide('"&str&"',"&str1&")</script>")
end sub
%>
