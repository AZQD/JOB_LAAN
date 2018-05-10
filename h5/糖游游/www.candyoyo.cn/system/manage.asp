<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<html><head><title>后台系统管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<link rel="stylesheet" href="images/style.css" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0;" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<!--#include file="../inc/conn.asp"-->
<!--#include file="include/access.asp"-->
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><div class="head"><div class="header">
    <ul>
      <li>    <a href="admin/view_paper.asp" target="main">会员管理</a></li>

    <li>    <a href="admin/admin_ad_user.asp"  target="main">管理员</a></li>
     </ul>
     </div></div></td>
  </tr>
<tr><td height="100%" id=menu>

<iframe name="main" width="100%" height="100%" scrolling="yes" frameborder=0 id="main"  src="admin/view_paper.asp"></iframe></td>
  </tr>
<tr>
  <td><table width="100%" border="0" cellpadding="0" cellspacing="0"  class="buttom">
    <tr>
      <td height="35" align="center" valign="middle">欢迎你：<%=request.Cookies("user1")("username")%> <a href="admin/changepass.asp?id=<%=request.Cookies("user1")("uid")%>" target="main">修改密码</a>　<a href="logout.asp" >退出登录</a></td>
      <td><a href="/"></a></td>
      <td width="100"><a href="../">浏览主页</a></td>
    </tr>
  </table></td>
  </tr>
</table>


</body>

</html>
