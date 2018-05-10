<%
if request.Cookies("user1")("login") <> "ok"  then 
%>

<SCRIPT >
alert("对不起，登陆超时或者您还没有登录，请返回重新登录")
window.top.location.href="../"
-->
</SCRIPT>

<% end if %>