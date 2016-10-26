<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.sinosoft.entity.UserDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>关键字管理</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link href="css/PIE.htc">
<script type="text/javascript"  src="js/jquery.min.js"></script>
</head>
<body id="messageBody">
<style>
.head, .content {
	behavior:url(css/PIE.htc);
}
.news, .user, .groups, .groups li.allgroups, .backbtn, .newbtn, .keylist, .askinfo, .myinfo, .keybox {
	behavior:url(css/PIE.htc);
	position:relative;
}
.selectframe{
	display:none;
	}
#preview {
	width:100%;
	height:100px;
	margin:5px auto;
	border:1px solid #f0f0f0;
	overflow:hidden;
}
.kwd{
	margin-top:9px;
	border:0;
	width:100px;
	}
#imghead {
filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
}
#imginfo img{
	max-width:166px;
	}
</style>

    <div class="right">
      <div class="title">
        <div class="titlename">回复设置《关键字回复</div>
      </div>
      <div class="keyframe">
        <div class="newbtnframe">
          <input type="button" value="新建关键字" class="newbtn" />
        </div>
        <div class="showframe">
          <div class="phone">
           	<div id="showphone" style="display:none">
              <div class="askframe">
                <div class="askuser"><img src="images/company_07.png" /></div>
                <div class="askposition">
                  <div class="lefticon"><img src="images/lefticon_11.gif" /></div>
                  <div class="askinfo" id="asktitle"></div>
                </div>
              </div>
              <div class="myqustion">
                <div class="myuser"><img src="images/company_07.png" /></div>
                <div class="myposition">
                  <div class="righticon"><img src="images/righticon_11.gif" /></div>
                  <div class="myinfo" id="myinfo"></div>
                </div>
              </div>
            </div>
            <div id="imgPhone" style="display:none">
              	<div class="askinfo" style="width:166px;" id="imginfo"></div>
            </div>
   <script type="text/javascript">
   		
					function editor(){
						var oEdit = document.getElementById('edit');
						var oEditor = document.getElementById('editor');
						oEditor.onclick = function(){
							oEdit.style.display = 'block';
						}
					}
					
					function getByclass(oparant,sclass){
						var oResult = [];
						var oEle = oparant.getElementsByTagName('*');
						for(var i=0;i<oEle.length;i++){
							if(oEle[i].className == sclass){
								oResult.push(oEle[i])	
							}
						}
						return oResult;
					}
   		
    	//图片上传预览    IE是用了滤镜。
        function previewImage(file) {
          var MAXWIDTH  = 260;
          var MAXHEIGHT = 180;
          var div = document.getElementById('preview');
          if (file.files && file.files[0]) {
              div.innerHTML ='<img id=imghead>';
              var img = document.getElementById('imghead');
              img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top+'px';
              }
              var reader = new FileReader();
              reader.onload = function(evt){img.src = evt.target.result;}
              reader.readAsDataURL(file.files[0]);
          }
          else //兼容IE 
          {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
          }
        }
        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
            var param = {top:0, left:0, width:width, height:height};
            if( width>maxWidth || height>maxHeight ) {
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                if( rateWidth > rateHeight ){
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);

                }else{
                    param.width = Math.round(width / rateHeight);
                    param.height = maxHeight;
                }
            }
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
        }
        
		function editMessage(domid){
			$(domid).toggle();
			
		}
		
		
		
		function deleteMessage(keyword,requesttype){
			if(confirm("确定删除么？")){
			$("#messageBody").append('<form action="deleMessage" id ="deleMessage"><input id="_deleKeyword" name="keyword" type="hidden" value="'+keyword+'" />'
				+'<input id="_delerequesttype" name="requestType" type="hidden" value="'+requesttype+'" />'
				+'</form>');
			$("#deleMessage").submit();
			}
		}
		function addNewKewword(dom){
			var keyword = $(dom).parent().parent().find("#newKeyword").val();
			alert(keyword);
			window.location.reload();
		}
		
		function deleteAddCon(dom){
			$("#newForm").parent().remove();
			$("#add_msg").parent().remove();
			//$("#newForm").style.display = "none";
			$(".newbtn").bind("click",function(){
				addNewkeywordAction();
			});
		}
		
		function addNewkeywordAction(){
			$('<li class="Homeml Less Homeml_over"><div id="add_msg" class="key_left"  style="cursor: pointer;">'
				+'<span class="_number"><input id="_newKeyword" name="keyword" class="kwd kewnew" menuid="0" type="text" value="" /></span>'
				+'</div><div class="key_right" style="display:block;">'// <a class="edit" menuid="0" title="编辑"></a>
				+'<a class="save" menuid="0" title="保存" onk="addNewKewword(this);"></a>'
				+'<a class="del" title="删除" onclick="deleteAddCon(this)" menuid="0"></a> '	
				+'</div></li>').prependTo("#key");
			$(".newbtn").unbind("click");
			var newKeword = document.getElementById("newForm");
			newKeword.style.display = 'block';
			$("#key .formtitle").hide();
		}
		
		function submitAddMessage(){
			var keyword = $("#_newKeyword").val();
			$("#newForm").append("<input type='hidden' name='keyword' value='"+keyword+"'/>");
			$("#add_message_form").submit();
		}
		
		function bindChangeAction(_index){
				    	$("#edit"+_index+" [name='responseType'] option").each(function(_i,opobj){
				    		if($(opobj).attr("selected")=="selected"){
								// alert($(opobj).attr("id")+':======id  aaaa');
								var divid = $(opobj).attr("id").replace("option","div");
								$("#edit"+_index+" .selectframe").each(function(i,selobj){
									if(divid == $(selobj).attr("id")){
										$(selobj).show();
									}else{
										$(selobj).hide();
									}
								});
							}
				    	});
		}
	</script>
          </div>
          <div class="keylist" style="z-index:9998;">
              <form id="add_message_form" name="add_message_form" action="addMessage" enctype="multipart/form-data" method="post" >
            	<div id ="newForm" class="formtitle" style="display:none; position:absolute; top:35px; left:0; z-index:9999;">
            		
            		<div class="firsttitle">
			                    请求类型：<select name="requestType" id="select">
			                    	<option value="text">纯文本</option>
			                    	<option value="news">单图文</option>
			                    </select>
		                    </div>
            		<div class="firsttitle">
	                    回复类型：<select name=responseType id="selectA">
	                    	<option id="option1" value="text">纯文本</option>
	                    	<option id="option2" value="news">单图文</option>
	                    </select>
                    </div>
                    <div class="selectframe" id="div1" style="display:block; left:0; z-index:9999;">
                    	<div class="firsttitle" style="background:#fff">消息标题：<input type="text" name ="title" value=""  /></div>
                    	<div style="width:250px;height:auto;margin:5px auto"><textarea id="replytxt1" name="content" style="width:230px;border:1px solid #f0f0f0;min-height:80px"></textarea></div>
                    	<div class="saveframe"><input type="button" onClick="submitAddMessage();" id="savebtn1" value="保存" class="savebtn" /></div>
                    </div>
                    <div class="selectframe" id="div2" style="left:0; z-index:9999;">
                        <div class="firsttitle" style="background:#fff">消息标题：<input type="text" name ="title" value=""  /></div>
                    	<div style="width:260px;height:auto;margin:0 auto">
                    	<div id="preview">
    						<img id="imghead" border=0 src='<%=request.getContextPath()%>/images/defaul.jpg'>
						</div>
						<input type="file" name="uploadImage" onchange="previewImage(this)" /> 
                    	</div>
                    	<div style="width:250px;height:auto;margin:5px auto" value="图文描述">
                    	<textarea id="replytxt1" name ="content" style="width:230px;border:1px solid #f0f0f0;min-height:80px">图文描述</textarea></div>
                    	<div class="firsttitle">图文链接：<input type="text" value="" name ="linkUrl" id="urltxt" /></div>
                    	<div class="saveframe"><input type="button" onClick="submitAddMessage();"  value="保存" class="savebtn" /></div>
                    </div>
            	</div>
              </form>
            <ul id="key">
            	<c:forEach items="${messageList}" var="message" varStatus="status"> 
                <li style="position:relative">
	        		<form action="updateMessage" method="post" enctype="multipart/form-data">
		                <div class="key_left">${message.keyword}</div>                
		                <div class="key_right">
			                <a href="javascript:;" title="编辑" class="edit" onclick="editMessage('#edit${status.index}');"></a>
			                <a href="javascript:;" title="显示" class="save" onclick="saveMessage('${message.keyword}','${message.content}');"></a>
			                <a href="javascript:;" title="删除" class="del" onclick="deleteMessage('${message.keyword}','${message.requesttype}');"></a>
		                </div>
		                <div id="edit${status.index}" class="formtitle" style="display:none; position:absolute;	top:35px; left:0; z-index:9999;" >
		                  <input type="hidden" name="keyword" value=${message.keyword}>
		                  <div class="firsttitle">
			                    请求类型：<select name="requestType" id="select${status.index}">
			                    	<option value="text"<c:if test="${message.requesttype!='news'}"> selected="selected"</c:if>>纯文本</option>
			                    	<option value="news"<c:if test="${message.requesttype=='news'}"> selected="selected"</c:if>>单图文</option>
			                    </select>
		                    </div>
		                  <div class="firsttitle">
			                    回复类型：<select name="responseType" id="select2${status.index}" >
			                    	<option id="option1${status.index}"  value="text"<c:if test="${message.responsetype!='news'}"> selected="selected"</c:if>>纯文本</option>
			                    	<option id="option2${status.index}"  value="news"<c:if test="${message.responsetype=='news'}"> selected="selected"</c:if>>单图文</option>
			                    </select>
		                    </div>
		                    <div class="selectframe" id="div1${status.index}" style="display:block">
		                    	<div class="firsttitle" style="background:#fff">消息标题：<input name ="title" type="text" value=${message.title} id="titletxt" /></div>
		                    	<div style="width:250px;height:auto;margin:5px auto"><textarea name ="content" id="replytxt" style="width:230px;border:1px solid #f0f0f0;min-height:80px">${message.content}</textarea></div>
		                    	<div class="saveframe"><input type="submit"  id="savebtnA" value="保存" class="savebtn" /></div>
		                    </div>
		                    <div class="selectframe" id="div2${status.index}">
		                    	<div style="width:260px;height:auto;margin:0 auto">
		                    	<div id="preview">
		    						<img id="imghead" border=0 src='<%=request.getContextPath()%>/images/defaul.jpg' />
								</div>
								<input type="file" name="uploadImage" onchange="previewImage(this)" /> 
		                    	</div>
		                    	<div style="width:250px;height:auto;margin:5px auto" value="图文描述">
                    			<textarea id="replytxt1" name ="content" style="width:230px;border:1px solid #f0f0f0;min-height:80px">图文描述</textarea></div>
                    			<div class="firsttitle">图文链接：<input type="text" value="" name ="linkUrl" id="urltxt" /></div>
		                    	<div class="saveframe"><input type="submit"  id="savebtnB" value="保存" class="savebtn" /></div>
		                    </div>
		                    
		                </div>
	                </form>
                </li>
               	</c:forEach>
            </ul>
            <script type="text/javascript">
					var oUl = document.getElementById('key');
					var oLi = oUl.getElementsByTagName('li');
					var oDiv = getByclass(oUl,'key_right');
					var oDel = getByclass(oUl,'del');
					//alert(oDel.length);
					for(var i=0;i<oLi.length;i++){
						oLi[i].index = i;
						oLi[i].onmouseover = function(){
							for(var i=0;i<oLi.length;i++){
								oLi[i].className = '';
								oDiv[i].style.display = 'none';	
							}
							this.className = 'active';
							oDiv[this.index].style.display = 'block';
						}
						oLi[i].onmouseout = function(){
							this.className = '';
							oDiv[this.index].style.display = 'none';	
						}
					}
					$(".newbtn").bind("click",function(){
						addNewkeywordAction();
					});
					
					
					var select = document.getElementById("selectA");
					var oFirst = document.getElementById("newForm");
					 select.onchange = function(){
						var options = select.getElementsByTagName("option");
						for(var i = 0; i < options.length; i++){
							if(options[i].selected){
								var divid = options[i].id.replace("option","div");
								var divs = getByclass(oFirst,'selectframe');
								//alert(divs.length);
								for(var j = 0; j < divs.length;
								 j++){
									if(divid == divs[j].id){
										divs[j].style.display = "block";
									}else{
										divs[j].style.display = "none";
									}
								}
							}
				        }
				    }
				    
				    $("[name='responseType']").each(function(i,obj){
				    	if(i==0){
				    		return;
				    	}else{
					    	$(obj).bind("change",function(){
					    		bindChangeAction.call(this,(i-1));
					    	});
				    	}
				    });
				    
				</script>
          </div>
        </div>
      </div>
</div>
<script type="text/javascript">
<!--

function toggle(targetid){
   var target=document.getElementById(targetid);
   if (target.style.display=="block"){
   		target.style.display="none";    
   } else {
   		target.style.display="block";
   }
}
//-->
		var oPhone = document.getElementById('showphone');
		var imgPhone = document.getElementById('imgPhone');
		var oAsktitle = document.getElementById('asktitle');
		var oMyinfo = document.getElementById('myinfo');
		var imginfo = document.getElementById('imginfo');
		var oTitle = document.getElementById('currentKey');
		var oBtn1 = document.getElementById('savebtn1');
		var oBtn2 = document.getElementById('savebtn2');
		var oReply = document.getElementById('replytxt');
		var oPre = document.getElementById('preview');
		
		function saveMessage(keyword,content){
			oPhone.style.display = 'block';
			imgPhone.style.display = 'none';
			oAsktitle.innerHTML = keyword;
			oMyinfo.innerHTML = content;
		}
		/*
			oBtn2.onclick = function(){
			imgPhone.style.display = 'block';
			oPhone.style.display = 'none';
						//oAsktitle.innerHTML = oTitle.value;
			imginfo.innerHTML = oPre.innerHTML;
					}		
					*/			
</script>

</body>
</html>