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
          <td height="25" align="center" class="srot">修改资料</td>
        </tr>
        <tr> 
          <td bgcolor="#FFFFFF" class="linkfont" align="center" valign="middle"> 
            <form name="cf" method="post" action="?act=update&id=<%=request("id")%>" onSubmit="return chkform()">
          
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="100" height="40" align="right" valign="middle" class="font">用户名：</td>
                  <td align="left" valign="middle"><%=rs("username")%></td>
                </tr>
                
                <tr> 
                  <td class="font" align="right" valign="middle">邮箱地址：</td>
                  <td align="left" valign="middle">
                    <input name="email" type="text" id="email" value="<%=rs("email")%>" size="30" >
                  </td>
                </tr>
                <tr > 
                  <td height="40" align="center" >&nbsp;</td>
                  <td height="40" ><input type="submit" name="Submit" value="确认保存" id="button" /></td>
                </tr>
              </table>
            </form>
			
          </td>
        </tr>
      </table>
 </div>

<%
if request("act")="update" then

	rs("email")=request("email")
	
	rs.update
		mgbox"修改成功",4,"admin_ad_user.asp"	
	rs.close
	set rs=nothing
	end if
	
%>



</body>
</html>
