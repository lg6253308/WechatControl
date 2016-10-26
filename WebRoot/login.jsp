<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>渠道管家登录</title>
		<link rel="stylesheet" type="text/css" href="css/css.css" />
		<link href="css/PIE.htc">
		<script type="text/javascript"  src="js/jquery.js"></script>
		<% session.invalidate(); %>
	<script type="text/javascript">
	function submitLogin(){
		if(CheckForm()){
		$("#loginfrom").submit();
		}
	}
	
	function CheckForm()
	{
		if(document.loginform.username.value ==''||document.loginform.username.value == '请输入用户名')   {
		alert("请输入您姓名!");
		document.form.username.focus();
		return   false;
			}
		return   true;
	}
	if('${result}'=='faild'){
		alert('密码错误！');
	}else if('${result}'=='undifine'){
		alert('用户不存在！请先注册');
	}

	</script>
	</head>
	<style>
.loginbox {
	behavior: url(css/PIE.htc);
}

.logintitle {
	behavior: url(css/PIE.htc);
	position: relative;
}

.btn {
	position: relative;
	behavior: url(css/PIE.htc);
}
</style>
	<div class="header">
		<div class="logotop">
			<img src="images/logo_02.gif" />
		</div>
	</div>
	<div class="login">
		<div class="loginframe">
			<div class="loginbox">
				<div class="logintitle">
					登录&nbsp;
					<a href="register.jsp">|&nbsp;注册</a>
				</div>
				<form id="loginfrom" name="loginform" action="login" method="post">
					<table cellpadding="0" cellspacing="0" border="0" width="100%"
						class="logintable">
						<tr>
							<td align="center" height="70" colspan="2">
								<input type="text" id="username" name="username" value="请输入用户名"
									onfocus="if(this.value == '请输入用户名') this.value = ''"
									onblur="if(this.value =='') this.value = '请输入用户名'"
									class="inputtext" />
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2">
								<input type="password" name="password" value=""
									onfocus="if(this.value == '请输入用户名') this.value = ''"
									onblur="if(this.value =='') this.value = '请输入用户名'"
									class="inputtext" />
							</td>
						</tr>
						<tr>
							<td height="40" width="160">
								<input type="checkbox" />
								记住用户名
								<input type="checkbox" />
								自动登录
							</td>
							<td align="right">
								<a href="#">忘记密码？</a>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2" height="60">
								<input type="button" value="登录" onClick="submitLogin()" class="btn" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div class="link">
		<div class="linklist">
			<ul>
				<li>
					<dl>
						<dt>
							微服务
						</dt>
						<dd>
							<a href="#">人工微信客服</a>
						</dd>
						<dd>
							<a href="#">微信营销咨询</a>
						</dd>
						<dd>
							<a href="#">商户后台</a>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>
							更多服务
						</dt>
						<dd>
							<a href="#">淘宝客服</a>
						</dd>
						<dd>
							<a href="#">电话营销</a>
						</dd>
						<dd>
							<a href="#">呼入客服</a>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>
							客服产业园
						</dt>
						<dd>
							<a href="#">北京基地</a>
						</dd>
						<dd>
							<a href="#">上海基地</a>
						</dd>
						<dd>
							<a href="#">广州基地</a>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>
							渠道管家平台
						</dt>
						<dd>
							<a href="#">快速客服官网</a>
						</dd>
						<dd>
							<a href="#">淘宝客服</a>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>
							推荐阅读
						</dt>
						<dd>
							<a href="#">发现感恩！</a>
						</dd>
						<dd>
							<a href="#">微信全景功能体验！</a>
						</dd>
					</dl>
				</li>
				<li style="margin: 0">
					<img src="images/blog_08.gif" />
				</li>
			</ul>
		</div>
	</div>
	<div class="footer">
		版权所有 中科软科技股份有限公司
	</div>
	<body>
	</body>
</html>
