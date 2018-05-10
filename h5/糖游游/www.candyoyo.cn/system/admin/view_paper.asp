<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0;" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="stylesheet" href="../images/style.css" type="text/css">
<!--#include file="../../inc/conn.asp"-->
<!--#include file="../include/config.asp"-->
<!--#include file="../include/access.asp"-->

<script type="text/javascript" src="../../form/js/jquery-1.6.2.min.js"></script>
  <script type="text/javascript" src="../../form/date/laydate.js"></script>
<link type="text/css" rel="stylesheet" href="../../form/date/skins/molv/laydate.css" >
<link type="text/css" rel="stylesheet" href="../../form/date/need/laydate.css">
<script>
var start = {
    elem: '#start',
    format: 'YYYY-MM-DD',

    max: '2099-06-16 23:59:59', //最大日期
    istime: true,
    istoday: false,
    choose: function(datas){
         end.min = datas; //开始日选好后，重置结束日的最小日期
         end.start = datas //将结束日的初始值设定为开始日
    }
};
var end = {
    elem: '#end',
    format: 'YYYY-MM-DD',
   
    max: '2099-06-16 23:59:59',
    istime: true,
    istoday: false,
    choose: function(datas){
        start.max = datas; //结束日选好后，重置开始日的最大日期
    }
};
laydate(start);
laydate(end);
</script>

</head>

<body >
<div class="main">
<div  class="srot">会员管理</div>
<%
	
Sql1="select * from [paper] where auto=0"
	
if request("st")<>"" then
sql2=" and intime >=#"&request("st")&"#"
end if
if request("et")<>"" then
sql2=sql2&" and intime <=#"&request("et")&" 23:59:59#"
end if
if request("key")<>"" then

sql2=sql2&" and name like '%"&request("key")&"%' or sfz like '%"&request("key")&"%' or code like '%"&request("key")&"%' or xq like '%"&request("key")&"%' or sid like '%"&request("key")&"%'"
end if


strSql=sql1&sql2&" order by id desc"

	set rs=Server.CreateObject("ADODB.RecordSet")
	rs.open strSql,conn,3,3
	rs.PageSize=16
	PageNo=request("PageNo")
	if PageNo<1 or not isnumeric(PageNo) then
		PageNo=1
	end if
	if cint(PageNo)>rs.PageCount then
		PageNo=rs.PageCount
	end if

		if rs.recordcount>0 then
		   rs.AbsolutePage =PageNo
		   
  %><div class="page">
共<%=rs.recordcount%>条记录 <%=PageNo%>/<%=rs.pagecount%> <a href="?dq=<%=request("dq")%>&did=<%=request("did")%>&pageno=1" class="linkfont">首页</a><a href="?dq=<%=request("dq")%>&did=<%=request("did")%>&pageno=<%=pageno-1%>" class="linkfont">上一页</a> <a href="?dq=<%=request("dq")%>&did=<%=request("did")%>&pageno=<%=pageno+1%>" class="linkfont">下一页</a> <a href="?dq=<%=request("dq")%>&did=<%=request("did")%>&pageno=<%=rs.pagecount%>" class="linkfont">尾页</a> 
		</div>
          <table width="100%" height="49" border="0" align="center" cellpadding="0" cellspacing="1"  class="table">
    <tr>
      <td align="center" bgcolor="#fbfbfb">会员名</td>
      <td align="center" bgcolor="#fbfbfb">密码</td>
      <td align="center" bgcolor="#fbfbfb">身份证</td>
      <td align="center" bgcolor="#fbfbfb">email</td>
      <td align="center" bgcolor="#fbfbfb">真实姓名</td>
      <td align="center" bgcolor="#fbfbfb">申请时间</td>
      <td align="center" bgcolor="#fbfbfb">操作</td>
    </tr>
        
  <% for i=1 to rs.pageSize
  			  if rs.eof then exit for%>
 <tr >
      <td align="center" ><%=rs("username")%></td>
      <td align="center" ><%=rs("psw")%></td>
      <td align="center" ><%=rs("idcard")%></td>
      <td align="center" ><%=rs("email")%></td>
      <td align="center" ><%=rs("name")%></td>
      <td align="center" ><%=rs("intime")%></td>
      <td align="center" >　<a href="?act=del&id=<%=rs("id")%>&amp;type=<%=request("type")%>" onClick="javascript:return confirm('确定要删除此条信息吗？')">删除</a></td>
    </tr>

   <%
				rs.movenext
			next
			
  %>
   
   </table>
		
    <%
		end if 
		
		rs.close
		%>
</div>
        <%
	



if request("act")="del" then
	 Set fso = CreateObject("Scripting.FileSystemObject")
rs.open"select * from [paper] where id="&request("id"),conn,1,1
	
conn.execute"delete from [paper] where id=" & request("id")
mgbox "删除成功!",4,"view_paper.asp?type="&request("type")
	end if




		set rs=nothing
		
  %>
  
</body>
</html>
