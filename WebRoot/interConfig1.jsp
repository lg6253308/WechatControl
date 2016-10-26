<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="com.sinosoft.entity.UserDto;" pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>配置接口</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link href="css/PIE.htc">
<script type="text/javascript"  src="js/jquery.min.js"></script>
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
</body>
</html>
