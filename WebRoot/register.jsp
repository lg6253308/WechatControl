<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>register</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link href="css/PIE.htc">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript"  src="js/jquery.js"></script>
<script type="text/javascript">
	
	function checkname(){
		if(document.regisform.username.value.length == 0)  {  
		alert("请输入您姓名!");
		document.regisform.username.focus();
		return  false;
		}
		if(document.regisform.username.value.length>20||document.regisform.username.value.length<6)
		{
		alert("用户名必须在6~20个字符之间！");
		document.regisform.username.focus();
		return false;
		}	
		$.ajax({
			url : "userCheckAction",
			type : "post",
			data : "username="+$('#username').val(),
			dataType : "text",
			success : function(result){							
				if('noexist'==result){
					alert('用户已存在，请重新输入~！');
					document.regisform.username.focus();
					return false;
				}else if('exist'==result){
					alert('用户名可以使用！');
				}
			},
			error : function(){
				alert("网络请求错误，请刷新页面重试。");
			}
		});
			}
	function regisformSub(){
 		if(CheckForm()){
 		$("#regisform").submit();
 		}
	}
	function  CheckForm()
	{  
	if(document.regisform.username.value.length  ==  0)  {  
		alert("请输入您姓名!");
		document.regisform.username.focus();
		return  false;
		}
	if(document.regisform.username.value.length>20||document.regisform.username.value.length<6)
	{
		alert("用户名必须在6~20个字符之间！");
		document.regisform.username.focus();
		return false;
	}	
	if(document.regisform.password.value.length  ==  0)  {  
		alert("请输入密码!");
		document.regisform.password.focus();
		return  false;
		}	
	if(document.regisform.password.value!=document.regisform.password1.value)
	{
		alert(" 两次输入密码不一致");
		document.regisform.password.value = "";
		document.regisform.password1.value = "";
		document.regisform.password.focus();
		return false;
	}
	if(document.regisform.publiccount.value.length  ==  0)  {  
		alert("请输入公众账号!");
		document.regisform.publiccount.focus();
		return  false;
		}
		return true;
	}
</script>
<style>
.loginbox {
	behavior:url(css/PIE.htc);
}
.logintitle {
	behavior:url(css/PIE.htc);
	position:relative;
}
.resit {
	behavior:url(css/PIE.htc);
	position:relative;
}
</style>
</head>

<body>
<div class="header">
  <div class="logotop"><img src="images/logo_02.gif" /></div>
</div>
<div class="login">
  <div class="loginframe">
    <div class="loginbox register">
      <div class="logintitle"><a href="login.jsp">登录&nbsp;|</a>&nbsp;注册<span class="asterisk "><font style="color:#F00">*</font>为必填项</span></div>
       <form name="regisform" id="regisform" action= "register" method="post">
      <table cellpadding="0" cellspacing="0" border="0" width="100%" class="registertable">
		<tr>
        	<td height="50" align="right" width="116">登录名称：</td>
            <td><input type="text" id="username" name="username" class="txt" onblur ="checkname();"/><span class="warning">*</span></td>
        </tr>
        <tr>
        	<td height="50" align="right">输入密码：</td>
            <td><input type="password" name ="password" class="txt" /><span class="warning">*</span></td>
        </tr>
        <tr>
        	<td height="50" align="right" >再次输入密码：</td>
            <td><input type="password" name ="password1" class="txt" /><span class="warning">*</span></td>
        </tr>
        <tr>
        	<td height="50" align="right">公共账号名称：</td>
            <td><input type="text" name ="publiccount" class="txt" /><span class="warning">*</span></td>
        </tr>
        <tr>
        	<td colspan="2" class="firstinfo" align="center">注：需要粉丝功能必须准确填写公众账号名称及密码；</td>
        </tr> 
        <tr>
        	<td height="50" align="right">公共账号密码：</td>
            <td><input type="text" name ="publicpassword" class="txt" /></td>
        </tr>
        <tr>
        	<td colspan="2" class="firstinfo" align="center">注：需要菜单功能必须准确填写APPID和APPSECRET；</td>
        </tr> 
        <tr>
        	<td height="50" align="right">账号APP ID：</td>
            <td><input type="text" name ="appid" class="txt" /></td>
        </tr>
        <tr>
        	<td height="50" align="right">账号APPSECRET：</td>
            <td><input type="text" name ="appsecret" class="txt" /></td>
        </tr>
      <!-- 
        <tr>
        	<td height="50" align="right">公司名称：</td>
            <td><input type="text" class="txt" /></td>
        </tr>
        --> 
        <tr>
        	<td colspan="2" align="center"><a href="#">查看渠道管家用户协议</a></td>
        </tr>
        <tr>
        	<td align="right" height="60"><input type="button" value="注册" onClick="regisformSub()" class="resit" /></td>
            <td align="center"><input type="reset" value="重置" class="resit" /></td>
        </tr>
      </table>
      </form>
    </div>
  </div>
</div>
<div class="link">
	<div class="linklist">
    	<ul>
        	<li><dl>
            	<dt>微服务</dt>
                <dd><a href="#">人工微信客服</a></dd>
                <dd><a href="#">微信营销咨询</a></dd>
                <dd><a href="#">商户后台</a></dd>
            </dl></li>
            <li><dl>
            	<dt>更多服务</dt>
                <dd><a href="#">淘宝客服</a></dd>
                <dd><a href="#">电话营销</a></dd>
                <dd><a href="#">呼入客服</a></dd>
            </dl></li>
            <li><dl>
            	<dt>客服产业园</dt>
                <dd><a href="#">北京基地</a></dd>
                <dd><a href="#">上海基地</a></dd>
                <dd><a href="#">广州基地</a></dd>
            </dl></li>
            <li><dl>
            	<dt>渠道管家平台</dt>
                <dd><a href="#">快速客服官网</a></dd>
                <dd><a href="#">淘宝客服</a></dd>
            </dl></li>
            <li><dl>
            	<dt>推荐阅读</dt>
                <dd><a href="#">发现感恩！</a></dd>
                <dd><a href="#">微信全景功能体验！</a></dd>
            </dl></li>
            <li style="margin:0"><img src="images/blog_08.gif" /></li>
        </ul>
    </div>
</div>
<div class="footer">版权所有 中科软科技股份有限公司</div>
</body>
</html>
