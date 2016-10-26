<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="com.sinosoft.entity.UserDto;" pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改信息</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link href="css/PIE.htc">
<script type="text/javascript"  src="js/jquery.min.js"></script>
<script type="text/javascript">
function updateformSub(){
 	if(CheckForm()){
 		$("#updateform").submit();
 		}
	}
	function  CheckForm()
	{  
	if(document.updateform.password.value == '')  {  
		alert("请输入密码!");
		document.updateform.password.focus();
		return  false;
		}
		
	if(document.updateform.password.value!='${currentuser.password}'){
		alert("密码错误!");
		document.updateform.password.focus();
		return  false;
	}
	if(document.updateform.password1.value == '')  {  
		alert("请输新入密码!");
		document.updateform.password1.focus();
		return  false;
		}
		
		
	if(document.updateform.password1.value!=document.updateform.password2.value)
	{
		alert(" 两次输入新密码不一致");
		document.updateform.password2.value = "";
		document.updateform.password1.value = "";
		document.updateform.password1.focus();
		return false;
	}
	if(document.updateform.publiccount.value.length  ==  0)  {  
		alert("请输入公众账号!");
		document.updateform.publiccount.focus();
		return  false;
		}
		return true;
	}
	</script>
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

 <div class="right">
        	<div class="title">
            	<div class="titlename">账号管理《修改信息</div>
            </div>
            
            <div align="center" style="width:300px; margin:20px auto;	font-size:12px;	color:#9e9e9e;">
            	注：星号标记为必填项，其他项请您根据功能需要选填；<br>
            		若不修改密码三次都输入原密码即可。
            </div>
            <form action= "updateUserInfo" id="updateform"  name="updateform" method="post">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="registertable revisetable">
            <input type="hidden" class="revisetxt" name ="username" value="${currentuser.userid}"/>
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
            <td><input type="password" name ="password2" class="revisetxt" /><span class="warning">*</span></td>
        </tr>
        <tr>
        	<td height="50" align="right">公共账号名称：</td>
            <td><input type="text" name ="publiccount" class="revisetxt"  /><span class="warning">*</span></td>
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
        	<td align="right" height="60"><input type="button" onClick="updateformSub()" name = "ok"  value="提交"  class="resit" /></td>
            <td align="center"><input type="reset" value="重置" class="resit" /></td>
        </tr>
      </table>
      </form>
        </div>

&nbsp;
</body>
</html>
