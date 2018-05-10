<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0;" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="stylesheet" href="../images/style.css" type="text/css">
<title>无标题文档</title>
<!--#include file="../../inc/conn.asp"-->
<!--#include file="../include/config.asp"-->
<!--#include file="../include/access.asp"-->
<script>

function chkform() {

	if (cf.name.value == "")
	{alert("请输入类别名称");
	cf.name.focus();
	return false; }
	
	return true;
}

</script>
</head>
<body>
<%


sql="select * from [csort] where c_id="&request("id")
	set rs=server.createobject("adodb.recordset")
        rs.open sql,conn,3,3
       
%>
<div class="main">
<form id="cf" name="cf" method="post" action="?act=update&id=<%=request.QueryString("id")%>" onSubmit="javascript:return chkform()">
  <table border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" class="table">
    <tr>
      <td height="30" colspan="2"  class="srot">添加分类</td>
    </tr>
    <tr>
      <td width="20%" height="14" align="center" bgcolor="#FFFFFF">地区名称</td>
      <td width="80%" bgcolor="#FFFFFF"><label>
        <input name="name" type="text" id="name" value="<%=rs("c_name")%>" />
      </label></td>
    </tr>
    <tr>
      <td height="15" align="center" bgcolor="#FFFFFF">分类</td>
      <td bgcolor="#FFFFFF"><label for="type"></label>
        <select name="type" id="type">
        <%if rs("c_upid")=0 then%>
          <option value="0" selected>一级分类</option>
          <%else
		  sql="select * from csort where c_id="&rs("c_upid")
		
			rst.open sql,conn,1,1
		  
		  %>
           <option value="<%=rst("c_id")%>" selected><%=rst("c_name")%></option>
       
          <%
		  rst.close
		
		  
		  
			sql="select * from csort where c_upid=0"
		
			rst.open sql,conn,1,1
			do while not rst.eof%>
          <option value="<%=rst("c_id")%>"><%=rst("c_name")%></option>
          <%rst.movenext
			loop
			rst.close
			  end if
			%>
        </select>
          
      </select></td>
    </tr>
    <tr>
      <td height="50" colspan="2" bgcolor="#FFFFFF">
        <input type="submit" name="Submit" value="提交"   id="button"/>
     </td>
    </tr>
  </table>

</form>
 </div>

<%if request.QueryString("act")="update" and isnumeric(request.QueryString("id")) then

	
			
		rs("c_name")=request.Form("name")
	rs("c_upid")=request.Form("type")
		rs.update
		
		if err.number=0 then

	mgbox "更新成功!",4,"add_sort.asp?id="&request.QueryString("id")
		
		end if
		
		end if
  
 rs.close
  
%>
</body>
</html>
