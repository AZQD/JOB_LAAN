
<!--#include file="../../inc/conn.asp"-->

<%




	'##转换 ' 为 "
	function convertsql(str)
		convertsql=replace(str,"'","''")
	end function
	
	'##检测数据库操作否正确
	function checkDb()
		if conn.Errors.count > 0 Then
			checkDb=1
		else
			checkDb=0
		end if
	end function

	'##检测环境否正确
	function checkVb()
		if  Err.number>0 Then
			Err.clear()
			checkVb=1
		else
			Err.clear()
			checkVb=0
		end if
	end function

	'##显示信息函数
	sub out(str)
		response.write str
		
end sub
'操作结果
sub mgbox(str,str1)
response.Write("<meta http-equiv='Refresh' content='2;URL="&str1&"' /><link rel=stylesheet href=../images/style.css type=text/css><table width='60%' border='0' align='center' cellpadding='0' cellspacing='0' style='font-size: 12px;color: #135294;background-color: #88BCF0;'><tr><td height='25' align='center' bgcolor='#BBDDFF'>提示信息</td></tr><tr> <td height='100'><ul><li>"&str&"</li><li><a href='javascript:history.go(-1);'>返回上层</a></li></ul></td></tr><tr> <td height='50' align='center' bgcolor='#BBDDFF'></td></tr></table>")
end sub
	'##对html进行加密
	function htmlencode(str)
		if not isnull(str) then
			htmlencode=Server.UrlEnCode(str)
		else
			htmlencode=""
		end if
	end function

'定义分页函数
function  page(str)
	
if rs.recordcount>rs.pagesize then
%>
<div class="page">共 <%=rs.recordcount%> 条 <%=pagecount%>/<%=pagecounts%>
      <%if page_b>page_num then %>
      <a href="<%=str%>=1">&lt;&lt;</a>
      <%else%>
<b>&lt;&lt;</b>
<%end if%>
<%if page_b-page_num>1 then %>
<a href="<%=str%>=<%=page_b-page_num%>&amp;page_b=<%=page_b-page_num%>">&lt;</a>
<%else%>
<b>&lt;</b>
<%end if%>
<%for i=page_b to page_e%>
<a href="<%=str%>=<%=i%>&amp;page_b=<%=page_b%>">
<%if i=pagecount then%>
<%=i%>
<%else%>
<%=i%>
<%end if%>
</a>
<%
    if i=pagecounts then exit for
    next%>
<%if pagecounts-page_e>1 then %>
<a href="<%=str%>=<%=page_b+page_num%>&amp;page_b=<%=page_b+page_num%>">&gt;</a>
<%else%>
<b>&gt;</b>
<%end if%>
<%if pagecounts-page_e>=1 then%>
<a href="<%=str%>=<%=pagecounts%>&amp;page_b=<%=yu%>">&gt;&gt;</a>
<%else%>
<b>&gt;&gt;</b>
<%end if%>
跳转到
<select name="sel_page" onchange="javascript:location=this.options[this.selectedIndex].value;">
  <%
for i = 1 to pagecounts
if i = pagecount then%>
  <option value="<%=str%>=<%=i%>&amp;page_b=<%=(i-(i mod page_num))+1%>" selected="selected"><%=i%></option>
  <%else%>
  <option value="<%=str%>=<%=i%>&amp;page_b=<%=(i-(i mod page_num))+1%>"><%=i%></option>
  <%
end if
next
%>
</select>
页</span></div>
<%end if
end function

'分页代码2
function page2(pageurl)


                        If Page>1 Then
                            Response.Write "<a href="&PageURL&"?page="&page-1&" target=""_self"">上一页</a>"&vbCrlf                
                        End If
                        If rs.PageCount>1 Then
                            If rs.PageCount>9 Then
                                If page-4<1 Then
                                    For i=1 To 9
                                        If i=page Then
                                            Response.Write ""&i&""&vbCrlf
                                        Else
                                            Response.Write "<a href="&PageURL&"?page="&i&" target=""_self"">"&i&"</a>"&vbCrlf
                                        End If
                                    Next
                                Else
                                    If page+4> rs.pagecount Then
                                        For i=rs.pagecount-9 To rs.pagecount
                                            If i=page Then
                                                Response.Write ""&i&""&vbCrlf
                                            Else
                                                Response.Write "<a href="&PageURL&"?page="&i&" target=""_self"">"&i&"</a>"&vbCrlf
                                            End If
                                        Next
                                    Else
                                        For i=page-4 To page+4
                                            If i=page Then
                                                Response.Write i&vbCrlf
                                            Else
                                                Response.Write "<a href="&PageURL&"?page="&i&" target=""_self"">"&i&"</a>"&vbCrlf
                                            End If
                                        Next
                                    End If
                                End If
                                If page+4<rs.pagecount Then
                                       
                                        Response.Write "<a href="&PageURL&"?page="&rs.pagecount&" target=""_self"">"&rs.pagecount&"</a>"&vbCrlf                        
                                End If
                            Else
                                For i=1 To rs.pagecount
                                    If i=page Then
                                        Response.Write i&vbCrlf
                                    Else
                                        Response.Write "<a href="&PageURL&"?page="&i&" target=""_self"">"&i&"</a>"&vbCrlf
                                    End If
                                Next
                            End If
                        End If
                        If Page<rs.PageCount Then
                            Response.Write "<a href="&PageURL&"?page="&page+1&" target=""_self"">下一页</a>"&vbCrlf
                        End If
                        Response.Write "共"&rs.RecordCount&"条"&vbCrlf
                        Response.Write "每页显示"&Pagecount&"条"&vbCrlf
               
              
end function

%>