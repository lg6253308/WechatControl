<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="com.sinosoft.entity.UserDto;" pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎页面</title>
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
<body>
<div class="header head">
  <div class="logotop">
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
        	<div class="system">
            	<div class="news">
                	<ul>
                    	<li><dl>
                        	<dt class="tips">10</dt>
                            <dd>新消息</dd>
                        </dl></li>
                        <li class="line"></li>
                        <li style="margin:0"><dl>
                        	<dt class="person">5</dt>
                            <dd>新增人数</dd>
                        </dl></li>
                    </ul>
                </div>
                <div class="news user">
                	<ul>
                    	<li><dl>
                        	<dt class="persons">40</dt>
                            <dd>总用户数</dd>
                        </dl></li>
                    </ul>
                </div>
            </div>
            <div class="newslist">
            	<div class="newstitle">系统公告</div>
                <ul>
                	<li><a href="#">渠道管家菜单设置功能火热上线</a><span class="time">2014-01-10</span></li>
                    <li><a href="#">良好的用户体验，可视化操作</a><span class="time">2013-12-31</span></li>
                    <li><a href="#">粉丝管理功能新鲜出炉</a><span class="time">2013-12-25</span></li>
                    <li><a href="#">渠道管家上线啦</a><span class="time">2013-12-05</span></li>
                </ul>
            </div>
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
&nbsp;
</body>
</html>
