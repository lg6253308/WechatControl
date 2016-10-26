<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="com.sinosoft.entity.UserDto;" pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>小工具</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link href="css/PIE.htc">
<script type="text/javascript"  src="js/jquery.min.js"></script>
</head>
<style>
.head,.content{
	behavior:url(css/PIE.htc);
}
.news,.user,.backbtn{
	behavior:url(css/PIE.htc);
	position:relative;
}
</style>
<body  bgcolor="#ffffff">
 <div class="right">
        	<div class="title">
            	<div class="titlename">小工具《小工具</div>
            </div>
            
         
              <div class="fansframe">
        <ul class="groups">
          <li class="allgroups">拓展小工具</li>
        </ul>
       
        <div><!-- class="groupslist" 下划线 -->
          <ul id="userinfo">
            <li>
             <!-- ---------------------------------------------------------------------------------------------- -->
   <div id="contentWrap">
  	<div id="widget table-widget" style="display:inline;">
  	<div class="pageColumn" style="display:inline;">
	   <table border = "0">	  
	   <thead >
	   <th width="5" align="center"><input class="select-all" name="" type="checkbox" value="" /></th>
	          <th width="5%">ID</th>
	          <th width="15%">图标</th>
	          <th width="15%">应用名称</th>
	          <th width="60%">工具简介</th>
	        </thead>
	        <tbody>
	          <tr align="center" name = "user">
	           <td class="checkBox"><input name="ids[]" type="checkbox" value="" align="left"/></td>
	           <td >【1】</td>
	            <td ><img src="<%=request.getContextPath()%>/images/weather.jpg" width="50" height="50"></td>
	            <td >天气预报</td>
	            <td >
	                粉丝输入“天气”+城市名，就可以获取当日天气情况。
	            </td>
	          </tr>
	          <tr align="center" name = "user">
	           <td class="checkBox"><input name="ids[]" type="checkbox" value="" align="left"/></td>
	      		 <td >【2】</td>
	            <td ><img src="<%=request.getContextPath()%>/images/translate.jpg" width="50" height="50"></td>
	            <td >在线翻译</td>
	            <td >
	                粉丝输入“翻译”+语句，就可以获取语句的译文。
	            </td>
	          </tr>
	          </tbody>
	      </table>
        </div>
</div>

&nbsp;
</body>
</html>
