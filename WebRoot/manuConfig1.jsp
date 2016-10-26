<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.sinosoft.entity.UserDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>菜单管理</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link href="css/PIE.htc">
<script type="text/javascript"  src="js/jquery.js"></script>
<script type="text/javascript">
	function firstMenu(num){
		$("#listNum1").val(num);
		$("#listNum2").val(num);
		$("#listNum3").val(num);
		menuclick(1);
		$("#editContainer #tab1").hide();
		
		$("#btnNameA").val('');
		$("#btnNameB").val('');
		$("#replytxt").val('');
		$("#btnContent").val('');
	}
	
	function addNewItem(){
		$("#firstmenu3").show();
		$("#firstmenu1").hide();
		$("#addBoll1").hide();
	}
	
	function editItem(position,type,keyurl,evt){
		menuclick(1);
		$("#editContainer #tab1").hide();
		
		$.ajax({
			url : "getButtondataAction",
			type : "post",
			data : "position="+position+"&type="+type+"&keyurl="+keyurl,
			dataType : "json",
			success : function(btnJson){							
				$("#btnNameA").val(btnJson.name);
				$("#btnNameB").val(btnJson.name);
				$("#replytxt").val(btnJson.content);
				$("#btnContent").val(btnJson.content);
				$("#btnPosition0").val(btnJson.position);
				$("#btnPosition1").val(btnJson.position);
				$("#btnPosition2").val(btnJson.position);
				document.all.select1.value = btnJson.responsetype;
				if(btnJson.responsetype=='news'){
					var showDiv = document.getElementById('div2');
					var unShowDiv = document.getElementById('div1');
					unShowDiv.style.display = 'none';
					showDiv.style.display = 'block';
					var imghead = document.getElementById('imghead');
					imghead.src=btnJson.picture;
					$("#newsTitle").val(btnJson.title);
					$("#newsUrl").val(btnJson.linkurl);
				}else{
					var showDiv = document.getElementById('div2');
					var unShowDiv = document.getElementById('div1');
					unShowDiv.style.display = 'block';
					showDiv.style.display = 'none';
				}
			},
			error : function(){
				alert("网络请求错误，请刷新页面重试。");
			}
		});
		var e=(evt)?evt:window.event; //判断浏览器的类型，在基于ie内核的浏览器中的使用cancelBubble
		if (window.event) { 
			e.cancelBubble=true; 
		} else { 
			//e.preventDefault(); //在基于firefox内核的浏览器中支持做法stopPropagation
			e.stopPropagation(); 
		} 
	}
	
	function submitEditItem(){
		var manuName = $("#btnNameB").val();
		$("#saveForm1").append("<input type='hidden' name='name' value='"+manuName+"'/>");
		$("#addForm1").submit();
	}
	
	function submitEditItem1(){
		var manuName = $("#btnNameB").val();
		
		$("#btnName1").val(manuName)
		$("#addForm2").submit();
	}
	
	function submitEditItem2(){
		var manuName = $("#btnNameB").val();
		alert(manuName);
		$("#saveForm3").append("<input type='hidden' name='name' value='"+manuName+"'/>");
		$("#addForm3").submit();
	}
	
	function deleteItem(type,position,keyurl,evt){
		
		if(confirm("确定删除么？")){
		$("#manuBody").append('<form action="deleManu" id ="deleManu"><input id="deleKeyurl" name="keyurl" type="hidden" value="'+keyurl+'" />'
				+'<input id="deleRequesttype" name="type" type="hidden" value="'+type+'" />'
				+'<input id="delePosition" name="position" type="hidden" value="'+position+'" />'
				+'</form>');
		$("#deleManu").submit();
			var e=(evt)?evt:window.event; 
			//判断浏览器的类型，在基于ie内核的浏览器中的使用cancelBubble
			if (window.event) { 
			e.cancelBubble=true; 
				} else { 
				//e.preventDefault(); 
				//在基于firefox内核的浏览器中支持做法stopPropagation
				e.stopPropagation(); 
			} }
	}
	
	function menuclick(index){
		$('#editContainer .tab1C').hide();
		$($('#editContainer .tab1C')[index]).show();
		$("#editContainer #tab1 div").attr("class","");
		$($("#editContainer #tab1 div")[index]).attr("class","current");
	}
	
	itemAddIndex=1;
	
	function secondMenu(position,obj){
		menuclick(0);
		$("#editContainer #tab1").show();
		$("#cobtnForm").append("<input type='hidden' name='position' value='"+position+"'/>");
		
		$("#btnNameA").val(obj.innerText);
		$("#btnNameB").val(obj.innerText);
		
	}
</script>

<style>
.head, .content {
	behavior:url(css/PIE.htc);
}
.backbtn,.newbtn,.keylist,.keybox,.firsttitle,.savebtn {
	behavior:url(css/PIE.htc);
	position:relative;
}
#preview {
	width:100%;
	height:100px;
	margin:5px auto;
	border:1px solid #f0f0f0;
	overflow:hidden;
	background:url(images/img_03.gif) no-repeat;
}
#imghead {
	filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
}
#imginfo img{
	max-width:166px;
	}
#tab div{
	background:#f0f0f0;
}
#tab div.current{
	 background:#fff
}
#tab1 div{
	background:#f0f0f0;
}
#tab1 div.current{
	 background:#fff
}
</style>
</head>
<body id="manuBody">

    <div class="right" >
      <div class="title">
        <div class="titlename">菜单管理《菜单编辑</div>
      </div>
      <div class="keyframe">
      <div class="newbtnframe"><input type="button" value="提交菜单" class="newbtn" onClick="location.href='manuAction'"/></div>
        <div class="showframe">
        	<div class="phone">
            	<ul id="nav">
                	<li class="secondMenu">
                    	<span id="menu1" onclick="secondMenu('00',this);">${manuList0[0].name}</span>
                        <img src="images/del.png" id="delbtn" onclick="deleteItem('${manuButton.type}','${manuButton.position}','${manuButton.keyurl}',event);" />
                        <dl class="subMenus" id="smenu1">
                        	<dt class="addMenus" id="amenu1" onclick="firstMenu('0');">添加</dt>
                            <c:forEach items="${manuList0}" var="manuButton1" varStatus="status" begin="1">
                            <c:set var="manuButton" value="${manuList0[fn:length(manuList0)-status.index]}" />
                            <dd onclick="editItem('${manuButton.position}','${manuButton.type}','${manuButton.keyurl}',event);">
                            ${manuButton.name}
                            <img src="images/del.png" onclick="deleteItem('${manuButton.type}','${manuButton.position}','${manuButton.keyurl}',event);" /></dd>
                            </c:forEach>
                        </dl>
                    </li>
                    <li class="secondMenu">
                    	<span id="menu2" onclick="secondMenu('10',this);">${manuList1[0].name}</span>
                        <img src="images/del.png" id="delbtn2" onclick="deleteItem('${manuButton.type}','${manuButton.position}','${manuButton.keyurl}',event);" />
                    	<dl class="subMenus" id="smenu2">
                        	<dt class="addMenus" id="amenu2" onclick="firstMenu('1');">添加</dt>
                           <c:forEach items="${manuList1}" var="manuButton1" varStatus="status" begin="1">
                           <c:set var="manuButton" value="${manuList1[fn:length(manuList1)-status.index]}" />
                            <dd position="${manuButton.position}" onclick="editItem('${manuButton.position}','${manuButton.type}','${manuButton.keyurl}',event);">
                            ${manuButton.name}
                            <img src="images/del.png" onclick="deleteItem('${manuButton.type}','${manuButton.position}','${manuButton.keyurl}',event);"/></dd>
                            </c:forEach>
                        </dl>
                    </li>
                    <li class="secondMenu">
                    	<span id="menu3" onclick="secondMenu('20',this);">${manuList2[0].name}</span>
                        <img src="images/del.png" id="delbtn3" onclick="deleteItem('${manuButton.type}','${manuButton.position}','${manuButton.keyurl}',event);" />
                    	<dl class="subMenus" id="smenu3">
                    	<dt class="addMenus" id="amenu3" onclick="firstMenu('2');">添加</dt>
                           <c:forEach items="${manuList2}" var="manuButton1" varStatus="status" begin="1">
                           <c:set var="manuButton" value="${manuList2[fn:length(manuList2)-status.index]}" />
                            <dd position="${manuButton.position}" onclick="editItem('${manuButton.position}','${manuButton.type}','${manuButton.keyurl}',event);">
                            ${manuButton.name}
                            <img src="images/del.png" onclick="deleteItem('${manuButton.type}','${manuButton.position}','${manuButton.keyurl}',event);"/></dd>
                            </c:forEach>                    	
                        </dl>
                    </li>
                </ul>
            </div>
            
            <div class="keylist" style="height:auto; padding-bottom:15px; min-height:235px;">
            <div id="firstmenu">
				<div id="editContainer" style="">
                	<div id="tab1">
                    	<div onclick="menuclick(0);" style="float:left; width:150px; height:36px; text-align:center; line-height:36px; font-size:15px;" class="current">添加二级菜单</div>
                        <div onclick="menuclick(1);" style="float:right; width:150px; height:36px; text-align:center; line-height:36px; font-size:15px;">直接回复</div>
                    </div>
                    <div style="clear:both"></div>
                    <div class="tab1C" style="display:;">
                    <form action="addComanu" id="cobtnForm" method="post">
	                	<div class="firsttitle" style="background:#fff; height:25px; margin-top:20px">
	                	菜单标题：<input type="text" name="name" id="btnNameA" /></div>
	                    <div class="firstinfo">注：菜单标题最多不超过8个汉字或16个字母，建议4个汉字以内。</div>
	                    <input type="hidden" name="type" value="comanu">
	                    <div class="saveframe"><input type="submit" value="保4存" class="savebtn" id="save2" /></div>
	                    </form>
                    </div>
                    <div class="tab1C" style="display: none;">
                            <div class="firsttitle" style="background:#fff">菜单标题:<input type="text"  id="btnNameB" name="name" /></div>	
                            <div class="firstinfo" style="margin:5px auto">注：菜单标题最多不超过8个汉字或16个字母，建议4个汉字以内。</div>
                            <div class="firsttitle" style="background:#fff">
                                回复类型：<select name="messageType" id="select1">
                                    <option  id="option1" value="text" >纯文本</option>
                                    <option  id="option2" value="news">单图文</option>
                                    <option  id="option3" value="url">页&nbsp;&nbsp;面</option>
                                </select>
                            </div>
                       <div class="selectframe" id="div1" style="display:block;">
                        <form action="addManu" id="addForm1" method="post" >
                       	   <input type="hidden" name="type" id ="btnType0" value="click">
                           <input type="hidden" name="requestType" value="click">
                           <input type="hidden" name="responseType" value="text">
                           <input type="hidden" name="keyword" value="">
                           <input type="hidden" name="position" id="btnPosition0" value="">
                           <input type="hidden" id="listNum1" name="listNum" value="">
                            <div style="width:250px;height:auto;margin:5px auto" id="saveForm1">
                            <textarea id="replytxt" name ="content" style="width:230px;border:1px solid #f0f0f0;min-height:80px">33333</textarea></div>
                            <div class="saveframe"><input type="button" value="保1存" onClick="submitEditItem();" class="savebtn" id="save0"/></div>
                            </form>
                        </div>
                        <div class="selectframe" id="div2" style="display:none;">
                            <form action = "addManu" method="post" enctype="multipart/form-data" id="addForm2">
                                <div style="margin-left:20px;">图文标题:<input id="newsTitle" type="text" name="title"/></div>
                     	        <input type="hidden" name="name" id ="btnName1">	
                            	<input type="hidden" id="listNum2" name="listNum" value="">
                                <input type="hidden" name="requestType" value="click">
                         	    <input type="hidden" name="responseType" value="news">
                                <input type="hidden" name="keyword" value="">
                                 <input type="hidden" name="type" id ="btnType1" value="click">
                                <input type="hidden" name="position" id="btnPosition1" value="">
                            <div style="width:260px;height:auto;margin:0 auto">
                            <div id="preview">
                                <img id="imghead" style="width:100%; height:117px" name ="picUrl" border=0 src=''>
                            </div>
                            <input type="file" name="uploadImage" onchange="previewImage(this)"/> 
                            </div>
                            <textarea id="btnContent" name ="content" style="width:80%; height:117px; border:1px solid #f0f0f0;min-height:80px; margin-left:30px;"></textarea>
                            <div style="margin-left:20px;" id="saveForm2">图文链接:<input id="newsUrl" type="text" name="linkurl"/></div>
                            <div class="saveframe"><input type="button" value="保2存" onClick="submitEditItem1();" class="savebtn" id ="save1"/></div>
                            </form>
                        </div>
                        <div class="selectframe" id="div3" style="display:none;">
                        	<form action="addManu" id="addForm3">
                        	 <input type="hidden" name="type" id ="btnType2" value="view">
                        	<input type="hidden" id="listNum3" name="listNum" value="">
                        	 <input type="hidden" name="position" id="btnPosition2" value="">
                        	<div class="firsttitle" style="background:#fff">跳转网址:<input type="text"  id="btnUrl" name="keyurl" /></div>	
                        	<div class="saveframe" id="saveForm3"><input type="button" value="保3存" onClick="submitEditItem2();" class="savebtn" id ="save3" /></div>
                            </form>
                        </div>
                    </div>
				</div>
                
                <div id="addBoll1" style="display:none; width:120px; margin:20px auto;">
                 	<input type="button" class="newbtn" style="font-size:13px;" value="添加二级菜单" id="addBtn1" />
            	</div>
                <div id="addBoll2" style="display:none; width:120px; margin:20px auto;">
                 	<input type="button" class="newbtn" style="font-size:13px;" value="添加二级菜单" id="addBtn2" />
            	</div>
            </div>
     </div></div></div></div>

<!-- JS start -->
<script>
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
					var select = document.getElementById("select1");
					var oFirst = document.getElementById("firstmenu");
				    select.onchange = function(){
						var options = select.getElementsByTagName("option");
						for(var i = 0; i < options.length; i++){
							if(options[i].selected){
								var divid = options[i].id.replace("option","div");
								var divs = getByclass(oFirst,'selectframe');
								for(var j = 0; j < divs.length;j++){
									if(divid == divs[j].id){
										divs[j].style.display = "block";
									}else{
										divs[j].style.display = "none";
									}
								}
							}
				        }
				    }
				   
					</script>
                    <script type="text/javascript">
    //图片上传预览    IE是用了滤镜。
        function previewImage(file)
        {
          var MAXWIDTH  = 500;
          var MAXHEIGHT = 100;
          var div = document.getElementById('preview');
          if (file.files && file.files[0])
          {
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
            if( width>maxWidth || height>maxHeight ){
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                if( rateWidth > rateHeight ) {
                    param.width =  maxWidth+170;
                    param.height = Math.round(height / rateWidth);
                }else {
                    param.width = Math.round(width / rateHeight)+170;
                    param.height = maxHeight;
                }
            }
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
        }
</script>
<!-- JS end -->     

</body>
</html>
