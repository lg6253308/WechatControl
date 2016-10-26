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
.news,.user,.resit{
	behavior:url(css/PIE.htc);
	position:relative;
} 
</style>
<div class="header head">
  <div class="logotop"> 
  <div class="logo"><img src="images/logo_02.gif" /></div>
  <div class="nowuser">
      <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            	<td>您好，${currentuser.userid}！</td>
          <td><input type="button" value="安全退出" class="backbtn" onClick="location.href='login.jsp'"/></td>
        </tr>
      </table>
    </div>
    </div>
</div>
<div class="content">
	<div class="container">
    	<div class="left">
        	<div class="menu">

    <h3>账号管理</h3>
      <ul class="sub-menu">
        <li><a href="updateUserInfo.jsp">修改信息</a></li>
        <li><a href="interConfig.jsp">配置接口</a></li>
      </ul>
    <h3>回复设置</h3>
      <ul class="sub-menu">
        <li><a href="getSubscribeMsg" >关注回复</a></li>
        <li><a href="getAutoMsg" >自动回复</a></li>
        <li><a href="getKeywordList">关键字回复</a></li>
      </ul>
    <h3>菜单管理</h3>
      <ul class="sub-menu">
        <li><a href="showManu" >自定义菜单</a></li>
      </ul>
      <h3>粉丝管理</h3>
      <ul class="sub-menu">
        <li><a href="showFansinfoAction" >粉丝分组</a></li>
        <li><a href="fansMessage.jsp" >会话记录</a></li>
      </ul>
     <h3>小工具</h3>
      <ul class="sub-menu">
        <li><a href="model.jsp" >小工具</a></li>
      </ul>
     <h3>联系我们</h3>
      <ul class="sub-menu">
        <li><a href="About.jsp" >关于我们</a></li>
        <li><a href="contact.jsp">咨询方式</a></li>
      </ul>
    </li>
  </ul>
</div>
        </div>
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
</div>
<script type="text/javascript">
<!--
$(function(){
    $(".menu h3").click( function(){
	   $(this).toggleClass("open")
       $(this).siblings("h3").removeClass("open")
	   $(this).next().slideToggle()
	   $(this).next().siblings("ul").slideUp()
	})
})
//-->
</script>
<body><br />
</body>
</html>
