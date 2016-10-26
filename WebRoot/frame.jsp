<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
  <head>

    
    <title>渠道管家</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <style> 
  	*{
		padding:0;
		margin:0;
	}
  </style>
<body bgcolor="#f3f3f3" >
<div id="header">
  <iframe src="header.jsp"  name="topFrame"  id="topFrame"  height="113" width="100%" scrolling="no" title="topFrame" marginwidth="0"  marginheight="0" hspace="0" vspace="0" frameborder="0" ></iframe>
</div>
<div id="mainFrame" style="width:872px;margin:0 auto;border:1px solid #D7D8D9;height:600px" align="center">
  <iframe src="left.jsp" height="600"  style="display:inline;float:left;position:relative;" width="165px" name="leftFrame" id="leftFrame"  scrolling="no" marginwidth="0"  marginheight="0" hspace="0" vspace="0" frameborder="0" align="left"></iframe>
  <iframe src="MyJsp.jsp" name="rightFrame"  width="706" height="600" id="rightFrame"  style="float:left;position:relative;display:inline;" hspace="0" vspace="0" frameborder="0" scrolling="no" ></iframe>
</div>
</body>
  
</html>
