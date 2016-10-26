<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.sinosoft.entity.UserDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sinosoft.common.Userutil"%>
<%@ page import="com.sinosoft.action.FansinfoAction"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>粉丝列表页面</title>
  
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/windows.js"></script>
  <script type="text/javascript">
 
	  
	    
$(function(){
		
		$(".select-all").click(function(){
			if($(this).attr("checked")){
				$(".checkBox input[type=checkbox]").each(function(){
					$(this).attr("checked", true);  
					});
				}else{
					$(".checkBox input[type=checkbox]").each(function(){
					$(this).attr("checked", false);  
					});
				}
			});
		
		})
  </script>
   
 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/css.css" />
  </head>
  <style>
.head, .content {
	behavior:url(css/PIE.htc);
}
.news, .user, .groups, .groups li.allgroups {
	behavior:url(css/PIE.htc);
	position:relative;
}

</style>
  <body>
   <div class="header head">
  <div class="logotop"><img src="images/logo_02.gif" /></div>
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
        <li><a href="subscribeMessage.jsp" target ="mainFrame">关注回复</a></li>
        <li><a href="autoMessage.jsp" target ="mainFrame">自动回复</a></li>
        <li><a href="configMessage.jsp" target ="mainFrame">关键字回复</a></li>
      </ul>
    <h3>菜单管理</h3>
      <ul class="sub-menu">
        <li><a href="manuConfig.jsp" target ="mainFrame">自定义菜单</a></li>
        <li><a href="interConfig.jsp" target ="mainFrame">配置响应消息</a></li>
      </ul>
      <h3>用户管理</h3>
      <ul class="sub-menu">
        <li><a href="userlist.jsp" target ="mainFrame">用户分组</a></li>
        <li><a href="userlist2.jsp" target ="mainFrame">会话记录</a></li>
      </ul>
     <h3>小工具</h3>
      <ul class="sub-menu">
        <li><a href="model.jsp" target ="mainFrame">小工具</a></li>
      </ul>
     <h3>联系我们</h3>
      <ul class="sub-menu">
        <li><a href="About.jsp" target ="mainFrame">关于我们</a></li>
        <li><a href="#">咨询方式</a></li>
      </ul>
    </li>
  </ul>
</div>
    </div>
    <div class="right">
      <div class="title">
        <div class="titlename">粉丝管理</div>
      </div>
      <div class="fansframe">
        <ul class="groups">
          <li class="allgroups">全部用户<span>(123)</span></li>
          <li>未分组<span>(3)</span></li>
          <li>星标组<span>(3)</span></li>
          <li>朋友<span>(3)</span></li>
          <li>家人<span>(3)</span></li>
          <li>同事<span>(3)</span></li>
          <li class="moregroups" id="moregroup"><img src="images/more_03.gif" /></li>
          <li class="addgroups"><img src="images/add_03.gif" /></li>
        </ul>
        <div class="check">
          <table cellpadding="0" cellspacing="0" border="0" width="100%" height="35">
            <tr>
              <td width="30" align="center"><input type="checkbox" /></td>
              <td width="50">全选</td>
              <td><form action = "groupIdCh"><div >
         <select name="groupId"  id="groupId" onchange="this.form.submit();">
         <c:forEach items="${grouplist}" var="group" >
		 <option value=${group.id}>${group.name}(${group.cnt})</option>
          
         </c:forEach>
         </select></td>
              <td></td>
            </tr>
          </table>
        </div>
        <div id="slowgroups">
          <ul>
            <li>未分组<span>(3)</span></li>
            <li>星标组<span>(3)</span></li>
            <li>朋友<span>(3)</span></li>
            <li>家人<span>(3)</span></li>
            <li>同事<span>(3)</span></li>
          </ul>
        </div>
        <script>
					var oMore = document.getElementById('moregroup');
					var oGroup = document.getElementById('slowgroups');
					var timer = null;
					//alert(oGroup.innerHTML)
					oMore.onmouseover = function(){
						clearInterval(timer);
						oGroup.style.display = 'block'	
					}
					oMore.onmouseout = function(){
						timer = setTimeout(function(){
							oGroup.style.display = 'none';	
							},500)	
					}
					oGroup.onmouseover = function(){
						clearInterval(timer);
						oGroup.style.display = 'block'	
					}
					oGroup.onmouseout = function(){
						oGroup.style.display = 'none';		
					}
				</script>
        <div class="groupslist">
          <ul id="userinfo">
            <li>
             <c:forEach items="${userList}" var="user" >
              <div class="position">
                <dl>
                  <dt><img src=${user.picsrc} width=50 height=50></dt>
                  <dd>${user.nickName}</dd>
                  <div class="userinfo">
         			<table cellpadding="0" cellspacing="0" border="0" width="100%" class="usertable">
                    	<tr>
                        	<td height="35" width="50" class="tdleft">昵称：</td>
                            <td>${user.nickName}<img src="images/doll_${user.gender}.gif" align="absmiddle" /></td>
                        </tr>
                        <tr>
                        	<td height="35" class="tdleft">备注：</td>
                            <td><a onclick="openDiv('${user.fakeid}');" href="#"><img src="images/edit_18.gif" /></a></td>
                        </tr>
                        <tr>
                        	<td height="35" class="tdleft">签名：</td>
                            <td>${user.signature}</td>
                        </tr>
                        <tr>
                        	<td height="35" class="tdleft" style="border:0">分组：</td>
                            <td style="border:0"><select><option>星标组</option></select></td>
                        </tr>
                    </table>
         		  </div>
                </dl>
              </div>
              </c:forEach>
            </li>
            <script>
			 function getByClass(oparent,sclass){
			 	var oResult = [];
			 	var oEle = oparent.getElementsByTagName('*');
			 	for(var i=0;i<oEle.length;i++){
			 		if(oEle[i].className == sclass ){
			 			oResult.push(oEle[i])
			 		}
			 	}
			 	return oResult;
			 }
			 var oUl = document.getElementById('userinfo');
			 var oDiv = getByClass(oUl,'userinfo');
			 var oDl = oUl.getElementsByTagName('dl');
			 var oDt = oUl.getElementsByTagName('dt');
			 var oDd = oUl.getElementsByTagName('dd');
			 var timer = null;
			 for(var i=0;i<oDt.length;i++){
			 	oDl[i].index = i;
			 	oDl[i].onmouseover = function(){
			 		for(var i=0;i<oDt.length;i++){
			 			oDiv[i].style.display = 'none'
			 		}
			 		oDiv[this.index].style.display = 'block';
			 	}
			 	oDl[i].onmouseout = function(){
			 		oDiv[this.index].style.display = 'none';
			 	}
			 	oDiv[i].onmouseout = function(){
			 		this.style.display = 'none';
			 	}
			 }
			 </script>
          </ul>
        </div>
      </div>
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
  </body>
</html>
