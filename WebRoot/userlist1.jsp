<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.sinosoft.entity.UserDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.sinosoft.common.Userutil"%>
<%@ page import="com.sinosoft.entity.FansinfoDto"%>
<%@ page import="com.sinosoft.action.FansinfoAction"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


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
.head,.content {
	behavior:url(css/PIE.htc);
}
.news, .user, .groups, .groups li,.allgroups {
	behavior:url(css/PIE.htc);
	position:relative;
}

</style>
  <body>
    <div class="right">
      <div class="title">
        <div class="titlename">粉丝管理《粉丝分组</div>
      </div>
      <div class="fansframe">
        <ul class="groups">
          <li class="allgroups" onClick = "showAllFans()">全部用户<span>(${fn:length(userList)})</span></li>
          <c:forEach items="${grouplist}" var="group" > 
          	<li onClick="divide(${group.id})">${group.name}<span>(${group.cnt})</span></li>
          </c:forEach>
          <li class="moregroups" id="moregroup"><img src="images/more_03.gif" width="15" height="15"/></li>
          <li class="addgroups"><img src="images/add_03.gif" width="15" height="15"/></li>
        </ul>
        
        <div id="slowgroups">
          <ul>
             <li class="allgroups">全部用户<span>(123)</span></li>
         	<c:forEach items="${grouplist}" var="group" > 
          	<li>${group.name}<span>(${group.cnt})</span></li>
          	</c:forEach>
          </ul>
        </div>
        <script>
					var oMore = document.getElementById('moregroup');
					var oGroup = document.getElementById('slowgroups');
					var timer = null;
					//alert(oGroup.innerHTML)
					oMore.onmouseover = function(){
						clearInterval(timer);
						oGroup.style.display='block'	
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
              <div class="position" name="${user.fakeid}" group="${user.groupid}">
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
			 function showAllFans(){
				$("div[group]").show();
			}
			 
			 function divide(groupid){
				$("div[group]").hide();
				$("div[group='"+groupid+"']").show();
			}
			 </script>
          </ul>
        </div>
      </div>
   </div>
   
  </body>
</html>
