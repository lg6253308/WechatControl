<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="com.sinosoft.entity.UserDto;" pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信息修改</title>
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
            	<div class="titlename">账号管理《修改信息</div>
            </div>
            
            <div align="center" style="width:300px; margin:20px auto;	font-size:12px;	color:#9e9e9e;">
            	注：星号标记为必填项，其他项请您根据功能需要选填；
            </div>
            <form action= "updateUserInfo" method="post">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="registertable revisetable">
		<tr>
        	<td height="50" align="right" width="116">登录名称：</td>
            <td><input type="text" class="revisetxt" name ="username" /><span class="warning">*</span></td>
        </tr>
        <tr>
        	<td height="50" align="right">输入密码：</td>
            <td><input type="password" name ="password" class="revisetxt" /><span class="warning">*</span></td>
        </tr>
        <tr>
        	<td height="50" align="right">新密码：</td>
            <td><input type="password" name ="password1" class="revisetxt" /><span class="warning">*</span></td>
        </tr>
        <tr>
        	<td height="50" align="right">再次输入新密码：</td>
            <td><input type="password" name ="password1" class="revisetxt" /><span class="warning">*</span></td>
        </tr>
        <tr>
        	<td height="50" align="right">公共账号名称：</td>
            <td><input type="text" name ="publiccount" class="revisetxt" /><span class="warning">*</span></td>
        </tr>
        <tr>
        	<td colspan="2" class="firstinfo" align="center">注：需要粉丝功能必须准确填写公众账号名称及密码；</td>
        </tr>  
        <tr>
        	<td height="50" align="right">公共账号密码：</td>
            <td><input type="text" name ="publicpassword" class="revisetxt" /></td>
        </tr>
           
          <tr>
        	<td colspan="2" class="firstinfo" align="center">注：需要菜单功能必须准确填写APPID和APPSECRET；</td>
        </tr>   
        <tr>
        	<td height="50" align="right">账号APP ID：</td>
            <td><input type="text" name ="appid" class="revisetxt" /></td>
        </tr>
        <tr>
        	<td height="50" align="right">账号APPSECRET：</td>
            <td><input type="text" name ="appsecret" class="revisetxt" /></td>
        </tr>
        <tr>
        	<td align="right" height="60"><input type="submit" name = "ok"  value="提交" class="resit" /></td>
            <td align="center"><input type="reset" value="重置" class="resit" /></td>
        </tr>
      </table>
      </form>
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
