<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0;" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="stylesheet" href="images/style.css" type="text/css">

<title>后台管理系统—Powered by 9416.cn</title>
</head>
<script>

function chkform() {
if (cf.user.value == "")
	{alert("请输入用户名");
	cf.user.focus();
	return false; }
	if (cf.password.value == "")
	{alert("请输入密码");
	cf.password.focus();
	return false; }

	return true;
}

</script>
<body>
<%if request.Cookies("user1")("login")="ok" then
response.Redirect"manage.asp"
end if

%>
<div class="head">
<div class="header"><h1><a href="javascript:history.go(-1);">返回</a></h1>
</div></div>
<div class="logbg">
<form id="cf" name="cf" method="post" action="admin/checklogin.asp" onSubmit="javascript:return chkform()">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="2"><h1>用户登录</h1></td>
          </tr>
        <tr>
          <td width="60">用户名</td>
          <td><input name="user" type="text"  id="user" size="30" /></td>
        </tr>
        <tr>
          <td>密码</td>
          <td><input name="password" type="password"  id="password" size="30" /></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><span class="registerform">
            <input type="submit" name="button" id="button" value="确认登陆" />
          </span></td>
        </tr>
      </table>
 </form>
   </div>
</body>
</html>
