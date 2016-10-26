<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.sinosoft.entity.UserDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>自动回复配置</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link href="css/PIE.htc">
<style>
.head, .content {
	behavior:url(css/PIE.htc);
}
.news, .user, .groups, .groups li.allgroups, .backbtn, .newbtn, .keylist, .askinfo, .myinfo, .keybox {
	behavior:url(css/PIE.htc);
	position:relative;
}
.selectframe{
	display:none;
	}
#preview {
	width:100%;
	height:100px;
	margin:5px auto;
	border:1px solid #f0f0f0;
	overflow:hidden;
}
#imghead {
filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
}
#imginfo img{
	max-width:166px;
	}
</style>


<script type="text/javascript"  src="js/jquery.min.js"></script>
<script type="text/javascript">
<!--
$(function(){
    $(".menu h3").click( function(){
	   $(this).toggleClass("open");
       $(this).siblings("h3").removeClass("open");
	   $(this).next().slideToggle();
	   $(this).next().siblings("ul").slideUp();
	})
})
//-->
</script>
</head>

<body>
    <div class="left">
      <div class="menu">

    <h3>账号管理</h3>
      <ul class="sub-menu">
        <li><a href="updateUserInfo1.jsp" target ="rightFrame">修改信息</a></li>
        <li><a href="interConfig1.jsp" target ="rightFrame">配置接口</a></li>
      </ul>
   <h3>回复设置</h3>
      <ul class="sub-menu">
        <li><a href="getSubscribeMsg"  target ="rightFrame">关注回复</a></li>
        <li><a href="getAutoMsg"  target ="rightFrame">自动回复</a></li>
        <li><a href="getKeywordList" target ="rightFrame">关键字回复</a></li>
      </ul>
    <h3>菜单管理</h3>
      <ul class="sub-menu" target ="rightFrame">
        <li><a href="showManu" target ="rightFrame">自定义菜单</a></li>
      </ul>
      <h3>粉丝管理</h3>
      <ul class="sub-menu">
        <li><a href="showFansinfoAction" target ="rightFrame">粉丝分组</a></li>
        <li><a href="fansMessage1.jsp" target ="rightFrame">会话记录</a></li>
      </ul>
     <h3>小工具</h3>
      <ul class="sub-menu" target ="rightFrame">
        <li><a href="model1.jsp" target ="rightFrame">小工具</a></li>
      </ul>
     <h3>联系我们</h3>
      <ul class="sub-menu">
        <li><a href="About1.jsp" target ="rightFrame">关于我们</a></li>
        <li><a href="contact1.jsp" target ="rightFrame">咨询方式</a></li>
      </ul>
    <li><br /></li>
  </ul>
  </div>
  </div>
  </body>
</html>
