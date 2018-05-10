<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>后台管理登入</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="../images/style.css" type="text/css">
</head>
<script>

function chkform() {
if (cf.oldpass.value == "")
	{alert("请输入旧密码");
	cf.oldpass.focus();
	return false; }
	if (cf.newpass.value == "")
	{alert("请输入新密码");
	cf.newpass.focus();
	return false; }
		if (cf.newpass.value!=cf.password1.value)
	{alert("两次密码不一样");
	cf.newpass.focus();
	return false; }
		if (cf.password1.value == "")
	{alert("再输一次新密码");
	cf.password1.focus();
	return false; }
	

	return true;
}

</script>
<!--#include file="../include/config.asp"-->
<!--#include file="../include/access.asp"-->
<!-- #include file="../../inc/conn.asp"-->

<body >
<div class="main">
   <%set rs=Server.CreateObject("Adodb.RecordSet")
	
	strSql="select * from [admin] where user_id=" &request("id")
	rs.Open strSql,conn,3,3%>
      <table width="100%" border="0" cellpadding="0" cellspacing="1">
        <tr> 
          <td height="25" align="center" class="srot">修改密码</td>
        </tr>
        <tr> 
          <td bgcolor="#FFFFFF" class="linkfont" align="center" valign="middle"> 
            <form name="cf" method="post" action="?act=update&id=<%=request("id")%>" onSubmit="return chkform()">
          
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="100" height="50" align="right" valign="middle" class="font">用户名：</td>
                  <td align="left" valign="middle"><%=rs("username")%></td>
                </tr>
                <tr>
                  <td class="font" align="right" valign="middle">旧的密码：</td>
                  <td align="left" valign="middle"><input type="password" name="oldpass" size="30" /></td>
                </tr>
                <tr> 
                  <td class="font" align="right" valign="middle">新的密码：</td>
                  <td align="left" valign="middle">
                    <input type="password" name="newpass" size="30" >
                  </td>
                </tr>
                <tr> 
                  <td align="right" valign="middle" class="font">确认密码：</td>
                  <td align="left" valign="middle"> 
                    <input type="password" name="password1" size="30" >
                  </td>
                </tr>
                <tr> 
                  <td height="40" align="center">&nbsp;</td>
                  <td height="40"><input type="submit" name="Submit" value="修改密码"  id="button" /></td>
                </tr>
              </table>
            </form>
			
          </td>
        </tr>
      </table>
 </div>

<%
if request("act")="update" then
	newpass=request("newpass")	
	oldpass=request("oldpass")


	if rs.eof then
		mgbox"找不到改用户",5,"admin_ad_user.asp"
	else
		if rs("userpassword")=oldpass then
			rs("userpassword")=newpass
			rs.update
			mgbox"密码修改成功",4,"admin_ad_user.asp"
		else
			mgbox"你输入的旧密码和密码不一样！",5,"?id="&request("id")
		end if
	end if
	rs.close
	end if
	set rs=nothing
%>



</body>
</html>
