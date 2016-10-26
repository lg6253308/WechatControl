<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.sinosoft.entity.UserDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sinosoft.common.Userutil"%>
<%@ page import="com.sinosoft.action.FansinfoAction"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>粉丝列表页面</title>
    <%
    	boolean flag = new Userutil().getFanList(request,"0");
    %>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/windows.js"></script>
  <script type="text/javascript">
  <%
	      if(!flag){
	    %>
	       window.location.href="login.jsp";
	    <%
	      }
	    %>
	  
	    
$(function(){
		
		$(".select-all").click(function(){
			if($(this).attr("checked")){
				$(".checkBox input[type=checkbox]").each(function(){
					$(this).attr("checked", true);  
					});
				}else{
					$(".checkBox input[type=checkbox]").each(function(){
					$(this).attr("checked", false);  
					});
				}
			});
		
		})
  </script>
   
 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div id="contentWrap">
  <div id="widget table-widget" style="display:inline;">
    <div class="pageTitle">粉丝管理</div>
    <div class="pageColumn" style="display:inline;">
      
      <form action = "groupIdCh"><div >
         <select name="groupId"  id="groupId" onchange="this.form.submit();">
         <c:forEach items="${grouplist}" var="group" >
		 <option value=${group.id}>${group.name}(${group.cnt})</option>
          
         </c:forEach>
         </select>
        
     </div>
      <div class="pageButton"></div>
      <table >
  
        <thead >
         <th width="5" align="center"><input class="select-all" name="" type="checkbox" value="" /></th>
          <th width="20%">微信ID</th>
          <th width="15%">头像</th>
          <th width="25%">微信昵称</th>
          <th width="15%">备注</th>
          <th width="20%">操作</th>
        </thead>
        <tbody>
         
         <c:forEach items="${userList}" var="user" >
         
          <tr align="center" name = "user">
           <td class="checkBox"><input name="ids[]" type="checkbox" value="" align="left"/></td>
            <td >${user.fakeId}</td>
          
            <td ><img src=${user.src} width="50" height="50"></td>
            <td >${user.nickName}</td>
            <td >${user.remarkName}</td>
            <td >
                <a onclick="openDiv('${user.fakeId}');" href="#"><img src="images/icon/edit2.png" width="16" height="16" /></a>　
            </td>
          </tr>
         </c:forEach>
         
          <tr class=" ">
              <td colspan="7" >${page.output}</td>
          </tr>
        </tbody>
         
      </table>
    </div>
  </div>
</div>
<DIV style="DISPLAY: none" id="container" class="xbox">
	<h2>
		单条发送(发送消息如有要验证码,自己想办法解决)
	</h2>
	<a id="box_close" class="xbox-close"><b>&nbsp;</b>关闭</a>
	<div class="tishi">
		<textarea rows="8" cols="10" id="content"></textarea>
		<input type="hidden" id="fackId"/>
		<input type="button" class="input_tj" value="发送" onclick="sub()" />
	</div>
	<ul class="detail">
	</ul>
</div>

  </body>
</html>
