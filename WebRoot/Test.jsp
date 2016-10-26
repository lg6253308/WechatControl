<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 <script>
var clipboardswfdata;
          
var setcopy_gettext = function(){
    clipboardswfdata = document.getElementById('data').value;
    window.document.clipboardswf.SetVariable('str', clipboardswfdata);
}
          
var floatwin = function(){
    alert('copy success, ' + clipboardswfdata);
}
</script>
  
<style type="text/css">
	body {font-size:12px;}
	.clipinner {position:relative;}
	.clipboardswf {position:absolute; left:0; top:0;}
</style>
        


  </head>
  
  <body>
    <input type="text" name="data" value="xxxxx11111" id ="data" />
	<div id="clipboard_content">
	<span class="clipinner" id="clipinner">点此复制到剪贴板
	<embed name="clipboardswf" class="clipboardswf" id="clipboardswf" onmouseover="setcopy_gettext()" devicefont="false" src="./clipboard.swf" menu="false" allowscriptaccess="sameDomain" swliveconnect="true" wmode="transparent" type="application/x-shockwave-flash" height="20" width="100">
	</span>
</div> 
<br>
  </body>
</html>
