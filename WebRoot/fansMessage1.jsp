<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.sinosoft.entity.UserDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sinosoft.common.Msgutil"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会话记录</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link href="css/PIE.htc">
<script type="text/javascript"  src="js/jquery.min.js"></script>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%
    	boolean flag = new Msgutil().getMessageList(request);
    %>
    
    <%
	      if(!flag){
	    %>
	       window.location.href="login.jsp";
	    <%
	      }
	    %>
</head>
<style>
<!--
.td{
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-bottom-width:thin;
	border-bottom-color:#ebf2ee;
	margin-top:50px;
	
}

.head,.content{
	behavior:url(css/PIE.htc);
}
.news,.user,.resit{
	behavior:url(css/PIE.htc);
	position:relative;
} -->
</style>
<body  bgcolor="#ffffff">
 <div class="right">
      			<div class="title">
        			<div class="titlename">粉丝管理《会话记录</div>
      			</div>
      			<div class="fansframe">
        			<ul class="groups">
          <li class="allgroups">全部消息<span>(123)</span></li>
          <li>昨天<span>(3)</span></li>
          <li>前天<span>(3)</span></li>
          <li>更早<span>(3)</span></li>        
          <li class="moregroups" id="moregroup" style="margin-left: 250px;"><img src="images/more_03.gif" /></li>
          <li class="addgroups"><img src="images/add_03.gif" /></li>
        </ul>
       
        
        <div style="height: 450px;overflow-y: scroll;"><!-- class="groupslist" 下划线 -->
          <ul id="userinfo">
            <li>
             <!-- ---------------------------------------------------------------------------------------------- -->
   <div id="contentWrap">
  	<div id="widget table-widget" style="display:inline;">
  	<div class="pageColumn" style="display:inline;">
	   <table border = "0px">	  
	        <thead >
	      <!--    <th width="5" align="center"><input class="select-all" name="" type="checkbox" value="" /></th>--> 
	      
	          <th class ="td" width="15%" align ="center" >头像</th>
	          <th class ="td" width="25%" align ="center">微信昵称</th>
	          <th class ="td" width="35%" align ="center" >内容</th>
	          <th class ="td" width="30%" align ="center">日期</th>
	        </thead>
	        <tbody>
	         
	         <c:forEach items="${messageList}" var="message" >
	         
	          <tr align="center" name = "user" height ="60px">
	       <!-- <td class="checkBox"><input name="ids[]" type="checkbox" value="" align="left"/></td> -->    
	      
	            <td class ="td"><img src=${message.iconSrc} width="50" height="50"></td>
	            <td class ="td">${message.nick_name}</td><!-- ${message.id} -->
	            <td class ="td">${message.content}</td>
	            <td class ="td">
	                ${message.date_time}
	            </td>
	          </tr>
	         </c:forEach>
	         
	        
	        </tbody>
	         
	      </table>
	  </div>
	  </div>
	  </div>
	  </li>
	  </ul>
	  </div>
	  </div>
	  </div>
	  

&nbsp;
</body>
</html>
