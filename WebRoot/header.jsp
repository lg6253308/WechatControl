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
<script type="text/javascript"  src="js/jquery.min.js"></script>
</head>
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
<body bgcolor="#f3f3f3">
<div class="header head">
  <div class="logotop">
    <div class="logo"><img src="images/logo_02.gif" /></div>
    <div class="nowuser">
      <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            	<td>您好，${currentuser.userid}！</td>
          <td><input type="button" value="安全退出" class="backbtn" onClick="parent.location.href='login.jsp'"/></td>
        </tr>
      </table>
    </div>
  </div>
</div>
  </body>
</html>
