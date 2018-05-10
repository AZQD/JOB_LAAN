<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<!--#include file="../include/config.asp"-->
<!--#include file="../../inc/conn.asp"-->
<!--#include file="../include/function.asp"-->
<%
	dim user,password,strSql,rsTmp,retValue
	user=request("user")
	password=request("password")
	if user="" then
		out("用户名不能为空！")
		response.end
	end if
	if password="" then
		out("密码不能为空！")
		response.end
	end if
	set rsTmp=Server.CreateObject("ADODB.RecordSet")
	strSql = "select * from [admin] where username='" & convertsql(user) & "'"
	strSql = strSql & " and userpassword='" & convertsql(password) & "'"
	rsTmp.open strSql,conn,1,3
	if rsTmp.eof then
		
		response.Write("<script>alert('该用户不存在,或密码错误！');window.location.href='../index.asp';</script>")
		retValue=1
	else
		retValue=0
		rsTmp("num")=rsTmp("num")+1
		rstmp.update
		'##设置session
response.cookies("user1")("username") = rsTmp("username") 
response.cookies("user1")("uid") = rsTmp("user_id") 
response.cookies("user1")("dq") = rsTmp("dq")   '将筛选出来的名称赋值给cookies
response.cookies("user1")("login")="ok"

	end if
	rsTmp.close
	set rsTmp=nothing
	conn.close
	set conn=nothing
	'##跳转到另一页去
	if retValue=0 then
		response.redirect "../manage.asp"
	end if
%>
