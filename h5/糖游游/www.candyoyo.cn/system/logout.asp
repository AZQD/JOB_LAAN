<%
response.cookies("user1")=""
	response.write "<script language=""javascript"">" & VbCrLf
	response.write " window.top.location.href=""/system/"";" & VbCrLf
	response.write "</script>" & VbCrLf
	'response.redirect "../index.asp"
%>