<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.sinosoft.entity.UserDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>渠道管家</title>

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body bgcolor="#f3f3f3" >
<div id="header">
  <iframe src="header.jsp"  name="topFrame"  id="topFrame"  height="113" width="100%" scrolling="no" title="topFrame" marginwidth="0"  marginheight="0" hspace="0" vspace="0" frameborder="0" ></iframe>
</div>
<div id="mainFrame" style="width:900px;margin:0 auto;" align="center" bgcolor="#f3f3f3" >
  <iframe src="left.jsp" height="600"  style="display:inline; float:left; position:relative;" width="165px" name="leftFrame" id="leftFrame"  scrolling="no" marginwidth="0"  marginheight="0" hspace="0" vspace="0" frameborder="0" align="left"></iframe>
  <iframe src="MyJsp.jsp" name="rightFrame" bgcolor="#ffffff" width="703" height="600" id="rightFrame"  style="float:left; position:relative; display:inline;" hspace="0" vspace="0" frameborder="0" scrolling="no" ></iframe>
</div>
</body>
  
</html>
