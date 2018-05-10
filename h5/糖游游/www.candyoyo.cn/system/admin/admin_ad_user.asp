<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../../inc/conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../images/style.css" type="text/css">
<title>无标题文档</title>
<!--#include file="../include/config.asp"-->

<!--#include file="../include/access.asp"-->

</head>

<body>
<%
if request.QueryString("act")="add" then
if trim(request.Form("name"))<>"" and trim(request.Form("password"))<>""and trim(request.Form("password2"))<>"" then

if request.Form("password")<>request.Form("password2") then
response.Write("<script>alert('两次密码输入不正确，请重新输入')</script>")
else
rst.open"select count(*) as num from [admin] where username='"&request.Form("name")&"'",conn,1,2

if rst("num")>0 then
response.Write("<script>alert('用户名重复')</script>")

else
rst.close
rst.open "admin",conn,1,3
rst.addnew
rst("username")=request.Form("name")
rst("userpassword")=request.form("password")

rst("email")=request.form("email")
rst.update

if err.number=0 then

mgbox"添加成功",4,"admin_ad_user.asp"	
else

response.Write("<script>alert('用户添加失败')</script>")
end if


end if	
rst.close
end if
end if
end if

%><div class="main">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td valign="top">
      
        <div  class="srot">用户管理</div>
        <div id="formwrapper">
          <form action="?act=add" method="post" name="cf" id="cf" class="registerform" >
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>用户名</td>
    <td><input type="text" name="name" id="name" size="18" maxlength="30" datatype="*2-10" nullmsg="请输入用户名" /></td>
  </tr>
  <tr>
    <td>密码</td>
    <td><input type="password" name="password" id="label" size="18" maxlength="15" datatype="*2-18" nullmsg="请输入用户名" /></td>
  </tr>
  <tr>
    <td>重复密码</td>
    <td><input type="password" name="password2" id="password2" size="18" maxlength="15" recheck="password"  datatype="*2-18" nullmsg="请确认密码！" errormsg="两次输入的密码不一致！" /></td>
  </tr>
  <tr>
    <td>邮箱：</td>
    <td><input type="text" name="email" id="password" size="18" datatype="e" nullmsg="请输入管理员联系邮箱"/></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><input name="login791" type="submit"  value="添加管理员" id="button" /></td>
    </tr>
</table> </form>
      </div></td>
    </tr>
    <tr>
      <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1"  class="table">
        <tr>
          <td height="20" colspan="4" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" align="center" bgcolor="#fbfbfb">用户信息管理</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="25" align="center" bgcolor="#FFFFFF">用户名</td>
          <td height="20" align="center" bgcolor="#FFFFFF">登录次数</td>
          <td align="center" bgcolor="#FFFFFF">邮箱</td>
          <td align="center" bgcolor="#FFFFFF">操作</td>
        </tr>
        <%	
	
		rst.open "admin",conn,1,3
		
		  do while not rst.eof%>
        <tr>
          <td height="25" align="center" bgcolor="#FFFFFF"><%=rst("username")%></td>
          <td height="20" align="center" bgcolor="#FFFFFF"><%=rst("num")%></td>
          <td align="center" bgcolor="#FFFFFF"><%=rst("email")%></td>
          <td align="center" bgcolor="#FFFFFF"><a href="?act=del&amp;id=<%=rst("user_id")%>" onclick="javascript:return confirm('确定要删除吗？删除将不可恢复')">删除</a>　<a href="changepass.asp?id=<%=rst("user_id")%>" target="main">修改密码</a>　<a href="change_user.asp?id=<%=rst("user_id")%>" target="main">修改资料</a></td>
        </tr>
        <%rst.movenext
		loop
		rst.close%>
      </table></td>
    </tr>
  </table>
</div>
<%if request.QueryString("act")="del" and request.QueryString("id")<>"" then
conn.execute"delete * from admin where user_id="&request.QueryString("id")
response.Redirect("admin_ad_user.asp")
end if%>
<script type="text/javascript" src="../../form/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="../../form/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">

$(function(){
	//$(".registerform").Validform();  //就这一行代码！;
	
	$.Tipmsg.r=null;
		
	var showmsg=function(msg){//假定你的信息提示方法为showmsg， 在方法里可以接收参数msg，当然也可以接收到o及cssctl;
		alert(msg);
	}
	
	$(".registerform").Validform({
		tiptype:function(msg){
			showmsg(msg);
		},
		tipSweep:true,
		ajaxPost:false
	});
})

</script>
</body>
</html>

