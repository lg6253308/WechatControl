<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import ="com.sinosoft.entity.UserDto"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>接口配置</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link href="css/PIE.htc">
<script type="text/javascript"  src="js/jquery.min.js"></script>
</head>
<%
  	 		UserDto ud= null;
            if(null==session.getAttribute("currentuser")||session.isNew()){
            	//没有登录
            	System.out.print("没有登录");
            	request.getRequestDispatcher("login.jsp").forward(request,response);
            	return ;
                    // response.sendRedirect("login.jsp");    //如果session中没有这个对象则跳到登录页
                    // System.out.println("ppp------ep");
             }else{
             	//设定
             	System.out.print("没有登录,为空取值");
             	ud = (UserDto)session.getAttribute("currentuser");

             }
%>
<style>
.head,.content{
	behavior:url(css/PIE.htc);
}
.news,.user,.resit{
	behavior:url(css/PIE.htc);
	position:relative;
}
.highlighttext{
	background-color:yellow;
	font-weight:bold;
}
</style>
<body>
<div class="header head">
  <div class="logotop"> 
  <div class="logo"><img src="images/logo_02.gif" /></div>
  <div class="nowuser">
      <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            	<td>您好，<%=ud.getUserid() %>！</td>
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
        <li><a href="About.jsp">关于我们</a></li>
        <li><a href="contact.jsp">咨询方式</a></li>
      </ul>
    </li>
  </ul>
</div>
        </div>
      <div id = "mainframe" name = "mainframe" class="right">
        	<div class="title">
            	<div class="titlename">账号管理《配置接口</div>
            </div>
      <form name="config">     
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="registertable revisetable">
		
		</tr>
        <td height="50" colspan = "2" align="center"><font size = "3">请按照下面数据在微信公众平台后台完成配置：</font></td>
        <tr>
        
		<tr>
			<br><br><br><br><br><br><br><br><br>
        </tr>
        <tr>
        <td height="50" align="right" width="116"><font size=5>URL: </font></td>
            <td><input type="text"  readonly="readonly" class="revisetxt" name ="weiurl" value ="http://www.weixin724.com/WeServlet/t.jhtml?id=<%=ud.getUserid() %>" />
        	 </td>  
        	 <td><input type="button" name="urlCopy" value="全选" onclick="javascript:HighlightAll('config.weiurl')"/></td>    
        </tr>
        <tr>
        <td height="50" align="right" width="116"><font size=5>TOKEN:</font></td>
            <td><input type="text" readonly="readonly" class="revisetxt" name ="weitoken" value ="sinosoft"  />
        	 </td> 
        	  <td><input type="button" name="tokenCopy" value="全选" onclick="javascript:HighlightAll('config.weitoken')"/></td>    
        </tr>
        <tr>
         </tr>
        <tr>  </tr>
        <tr>
        	  </tr>
        <tr>
            </tr>
        <tr>
           </tr>
           
      </table>
</form>
        </div>
    </div>
</div>
<script type="text/javascript">
<!--         
	var copytoclip=1
	function HighlightAll(theField) {         
		var tempval=eval("document."+theField)         
		tempval.focus()         
		tempval.select()         
		if (document.all && copytoclip==1){         
			therange=tempval.createTextRange()         
			therange.execCommand("Copy")         
			window.status="Contents highlighted and copied to clipboard!"         
			setTimeout("window.status=''",1780)         
		}         
	}         
//-->  
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
<br/>
</body>
</html>
