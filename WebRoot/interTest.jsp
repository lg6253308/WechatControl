<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
<style>
 
  .div-inline{display:inline ;}
  </style>
  </head>
  
  <body>
  	<div class = "div-inline">测试数据</div>
            <div class = "div-inline">图文回复</div>
    <br>
    <form action="WeServlet/t.jhtml" method = "post">
    <input type = "text" name = "keyname" > 名称:
	 <input type = "submit" name ="submit" value="提交"><table><tr><td>
	 <input type ="checkbox" name = "check" value="复选框">复选框</td></tr></table>
	
</form>
  </body>
</html>
