<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>menu</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link href="css/PIE.htc">
<script type="text/javascript"  src="js/jquery.js"></script>
</head>
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
</style>
<div class="header head">
  <div class="logotop">
      <div class="logo"><img src="images/logo_02.gif" /></div>  
      <div class="nowuser">
      	<table cellpadding="0" cellspacing="0" border="0" width="100%">
        	<tr>
            	<td>您好，中科软科技！</td>
                <td><input type="button" value="安全退出" class="backbtn" /></td>
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
        <li><a href="reply.jsp">关注回复</a></li>
        <li><a href="reply2.jsp" >自动回复</a></li>
        <li><a href="getKeywordList">关键字回复</a></li>
      </ul>
    <h3>菜单管理</h3>
      <ul class="sub-menu">
        <li><a href="manuConfig.jsp">自定义菜单</a></li>
        <li><a href="interConfig.jsp" >配置响应消息</a></li>
      </ul>
      <h3>粉丝管理</h3>
      <ul class="sub-menu">
        <li><a href="showFansinfoAction">粉丝分组</a></li>
        <li><a href="fansMessage.jsp">会话记录</a></li>
      </ul>
     <h3>小工具</h3>
      <ul class="sub-menu">
        <li><a href="model.jsp">小工具</a></li>
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
        <div class="titlename">菜单管理《菜单编辑</div>
      </div>
      <div class="keyframe">
      	<div class="newbtnframe"><input type="button" value="效果预览" class="newbtn" /></div>
        <div class="showframe">
        	<div class="phone">
            	<ul id="nav">
                	<li class="secondMenu">
                    	<span id="menu1">${manuList0[0].name}</span>
                        <img src="images/del.png" id="delbtn" />
                        <dl class="subMenus" id="smenu1">
                        	<dt class="addMenus" id="amenu1">添加</dt>
                        	<c:forEach items="${manuList0}" var="manuButton" varStatus="status" begin="1">
                            <dd position=${manuButton.position}>${manuButton.name}<img src="images/del.png" /></dd>
                            </c:forEach>
                        </dl>
                    </li>
                    <li class="secondMenu">
                    	<span id="menu2">${manuList1[0].name}</span>
                        <img src="images/del.png" id="delbtn2" />
                    	<dl class="subMenus" id="smenu2">
                        	<dt class="addMenus" id="amenu2">添加</dt>
                        	<c:forEach items="${manuList1}" var="manuButton" varStatus="status" begin="1">
                            <dd position=${manuButton.position}>${manuButton.name}<img src="images/del.png" /></dd>
                            </c:forEach>
            
                        </dl>
                    </li>
                    <li class="secondMenu">
                    	<span id="menu3">${manuList2[0].name}</span>
                        <img src="images/del.png" id="delbtn3" />
                    	<dl class="subMenus" id="smenu3">
                        	<dt class="addMenus" id="amenu3">添加</dt>
                        	<c:forEach items="${manuList2}" var="manuButton" varStatus="status" begin="1">
                            <dd position=${manuButton.position}>${manuButton.name}<img src="images/del.png" /></dd>
                            </c:forEach>
            
                        </dl>
                    </li>
                </ul>
            </div>
             <div class="keylist" style="height:auto; padding-bottom:15px; min-height:235px;">
            	<div id="firstmenu1" style="display:block;">
                	<div class="firsttitle">菜单标题：<input type="text" value="" id="menutxt1"  /></div>
                    <div class="firstinfo">注：主菜单按钮文字不超过14个汉字或8个字母，子菜单标题最多不超过8个汉字或16个字母</div>
                    <div class="saveframe"><input type="button" value="保存" class="savebtn" id="save1" /></div>
				</div>
				<div id="firstmenu2" style="display:none;">
                	<div id="tab1">
                    	<div style="float:left; width:150px; height:36px; text-align:center; line-height:36px; font-size:15px;" class="current">添加二级菜单</div>
                        <div style="float:right; width:150px; height:36px; text-align:center; line-height:36px; font-size:15px;">直接回复</div>
                    </div>
                    <div style="clear:both"></div>
                    <div class="tab1C">
                	<div class="firsttitle" style="background:#fff; height:25px; margin-top:20px">菜单标题：<input type="text" value="" id="menutxt2" /></div>
                    <div class="firstinfo">注：主菜单按钮文字不超过14个汉字或8个字母，子菜单标题最多不超过8个汉字或16个字母</div>
                    <div class="saveframe"><input type="button" value="保存" class="savebtn" id="save2" /></div>
                    </div>
                    <div class="tab1C" style="display:none">
                    	
                        
                            <div class="firsttitle" style="background:#fff">菜单标题:<input type="text"  /></div>	
                            <div class="firstinfo" style="margin:5px auto">注：主菜单按钮文字不超过14个汉字或8个字母，子菜单标题最多不超过8个汉字或16个字母</div>
                            <div class="firsttitle" style="background:#fff">
                                回复类型：<select name=select id="select1">
                                    <option name="option1" id="option1" value="value1">纯文本</option>
                                    <option name="option2" id="option2" value="value2">单图文</option>
                                </select>
                            </div>
                            <div class="selectframe" id="div1" style="display:none">
                        <form action = "addTextMessage" >
                           <input type="hidden" name="requestType" value="auto">
                           <input type="hidden" name="keyword" value="auto">
                            <!--<div class="firsttitle">消息标题：<input type="text" value="" name ="title" id="titletxt" /></div>-->
                            <div style="width:250px;height:auto;margin:5px auto"><textarea id="replytxt" name ="content" style="width:230px;border:1px solid #f0f0f0;min-height:80px"></textarea></div>
                            <!--<div class="saveframe"><input type="submit" id="savebtn1" value="保存" class="savebtn" /></div>-->
                            </form>
                        </div>
                        <div class="selectframe" id="div2" style="display:block">
                            <form action = "addNewsMessage">
                                <input type="hidden" name="requestType" value="auto">
                                <input type="hidden" name="keyword" value="auto">
                                <!--<div class="firsttitle">消息标题：<input type="text" value="" name ="title" id="titletxt" /></div>-->
                            <div style="width:260px;height:auto;margin:0 auto">
                            <div id="preview">
                                <img id="imghead" style="width:100%; height:117px" name ="picUrl" border=0 src='<%=request.getContextPath()%>/images/defaul.jpg'>
                            </div>
                            <input type="file" onchange="previewImage(this)" /> 
                            </div>
                            <!--<div style="width:250px;height:auto;margin:5px auto" value="图文描述"><textarea id="replytxt" name ="content" style="width:230px;border:1px solid #f0f0f0;min-height:80px">图文描述</textarea></div>-->
                            <!--<div class="firsttitle">图文链接1：<input type="text" value="" name ="linkUrl" id="urltxt" /></div>-->
                            <div class="saveframe"><input type="submit" id="savebtn2" value="保存" class="savebtn" /></div>
                            </form>
                        </div>
                        
                        
                    </div>
				</div>
                
                <script>
					function getByClass(oparent,sclass){
						var oResult = [];
						var oEle = oparent.getElementsByTagName('*');
						for(var i=0;i<oEle.length;i++){
							if(oEle[i].className == sclass){
								oResult.push(oEle[i])	
							}
						}
						return oResult;
					}
					var tab1 = document.getElementById('tab1');
					var fist2 = document.getElementById('firstmenu2');
					var oDiv1 = tab1.getElementsByTagName('div');
					var oP1 = getByClass(fist2,'tab1C');
					//alert(oDiv.length);
					//alert(oP.length);
					for(var i=0;i<oDiv1.length;i++){
						oDiv1[i].index = i;
						oDiv1[i].onclick = function(){
							for(var i=0;i<oDiv.length;i++){
								oDiv1[i].className = '';
								oP1[i].style.display = 'none';	
							}
							this.className = 'current';
							oP1[this.index].style.display = 'block';
						}
					}
				</script>
                
                <div id="firstmenu3" style="display:none;">
                	<div id="tab">
                    	<div style="float:left; width:150px; height:36px; text-align:center; line-height:36px; font-size:15px;" class="current">添加二级菜单</div>
                        <div style="float:right; width:150px; height:36px; text-align:center; line-height:36px; font-size:15px;">直接回复</div>
                    </div>
                    <div style="clear:both"></div>
                    <div class="tabC">
                        <div class="firsttitle" style="background:#fff; height:25px; margin-top:20px">菜单标题：<input type="text" value="" id="menutxt3" /></div>
                        <div class="firstinfo">注：主菜单按钮文字不超过14个汉字或8个字母，子菜单标题最多不超过8个汉字或16个字母</div>
                        <div class="saveframe"><input type="button" value="保存" class="savebtn" id="save3" /></div>
                    </div>
                    <div class="tabC" style="display:none">
                   	
                    	<div class="firsttitle" style="background:#fff">菜单标题:<input type="text"  /></div>	
                    	<div class="firstinfo" style="margin:5px auto">注：主菜单按钮文字不超过14个汉字或8个字母，子菜单标题最多不超过8个汉字或16个字母</div>
                        <div class="firsttitle" style="background:#fff">
                            回复类型：<select name=select id="select1">
                                <option name="option1" id="option1" value="value1">纯文本</option>
                                <option name="option2" id="option2" value="value2">单图文</option>
                            </select>
                        </div>
                        <div class="selectframe" id="div1" style="display:none">
                    <form action = "addTextMessage" >
			           <input type="hidden" name="requestType" value="auto">
			           <input type="hidden" name="keyword" value="auto">
                    	<!--<div class="firsttitle">消息标题：<input type="text" value="" name ="title" id="titletxt" /></div>-->
                    	<div style="width:250px;height:auto;margin:5px auto"><textarea id="replytxt" name ="content" style="width:230px;border:1px solid #f0f0f0;min-height:80px"></textarea></div>
                    	<!--<div class="saveframe"><input type="submit" id="savebtn1" value="保存" class="savebtn" /></div>-->
                    	</form>
                    </div>
                    <div class="selectframe" id="div2" style="display:block">
                    	<form action = "addNewsMessage">
						  	<input type="hidden" name="requestType" value="auto">
				           	<input type="hidden" name="keyword" value="auto">
				           	<!--<div class="firsttitle">消息标题：<input type="text" value="" name ="title" id="titletxt" /></div>-->
                    	<div style="width:260px;height:auto;margin:0 auto">
                    	<div id="preview">
    						<img id="imghead" style="width:100%; height:117px" name ="picUrl" border=0 src='<%=request.getContextPath()%>/images/defaul.jpg'>
						</div>
						<input type="file" onchange="previewImage(this)" /> 
                    	</div>
                    	<!--<div style="width:250px;height:auto;margin:5px auto" value="图文描述"><textarea id="replytxt" name ="content" style="width:230px;border:1px solid #f0f0f0;min-height:80px">图文描述</textarea></div>-->
                    	<!--<div class="firsttitle">图文链接1：<input type="text" value="" name ="linkUrl" id="urltxt" /></div>-->
                    	<div class="saveframe"><input type="submit" id="savebtn2" value="保存" class="savebtn" /></div>
                    	</form>
                    </div>
                    
                    </div>
				</div>
                <script>
					function getByClass(oparent,sclass){
						var oResult = [];
						var oEle = oparent.getElementsByTagName('*');
						for(var i=0;i<oEle.length;i++){
							if(oEle[i].className == sclass){
								oResult.push(oEle[i])	
							}
						}
						return oResult;
					}
					var tab = document.getElementById('tab');
					var fist = document.getElementById('firstmenu3');
					var oDiv = tab.getElementsByTagName('div');
					var oP = getByClass(fist,'tabC');
					//alert(oDiv.length);
					//alert(oP.length);
					for(var i=0;i<oDiv.length;i++){
						oDiv[i].index = i;
						oDiv[i].onclick = function(){
							for(var i=0;i<oDiv.length;i++){
								oDiv[i].className = '';
								oP[i].style.display = 'none';	
							}
							this.className = 'current';
							oP[this.index].style.display = 'block';
						}
					}
				</script>
				<div id="secendmenu1" style="display:none;">
					<div class="firsttitle">菜单标题：<input type="text" value="" id="smenutxt1"  /></div>
					<div class="saveframe"><input type="button" value="保存" class="savebtn" id="second1" /></div>
				</div>
                <div id="secendmenu2" style="display:none;">
					<div class="firsttitle">菜单标题：<input type="text" value="" id="smenutxt2"  /></div>
					<div class="saveframe"><input type="button" value="保存" class="savebtn" id="second2" /></div>
				</div>
                 <div id="secendmenu3" style="display:none;">
					<div class="firsttitle">菜单标题：<input type="text" value="" id="smenutxt3"  /></div>
					<div class="saveframe"><input type="button" value="保存" class="savebtn" id="second3" /></div>
				</div>
                <div id="secondmenu2" style="display:none">
                    <div class="firsttitle">菜单标题:<input type="text" id="text" /></div>
                    <div class="saveframe"><input type="button" class="savebtn" id="btn" value="保存" /></div>
                </div>
                <div id="secondmenu3" style="display:none">
                    <div class="firsttitle">菜单标题:<input type="text" id="text2" /></div>
                    <div class="saveframe"><input type="button" class="savebtn" id="btn2" value="保存" /></div>
                </div>
                <div id="secondmenu4" style="display:none">
                    <div class="firsttitle">菜单标题:<input type="text" id="text4" /></div>
                    
                    <div id="firstmenu">
                	
                    <div class="firstinfo" style="margin:5px auto">注：主菜单按钮文字不超过14个汉字或8个字母，子菜单标题最多不超过8个汉字或16个字母</div>
                    <div class="firsttitle">
	                    回复类型：<select name=select id="select1">
	                    	<option name="option1" id="option1" value="value1">纯文本</option>
	                    	<option name="option2" id="option2" value="value2">单图文</option>
	                    </select>
                    </div>
                    <div class="selectframe" id="div1" style="display:none">
                    <form action = "addTextMessage" >
			           <input type="hidden" name="requestType" value="auto">
			           <input type="hidden" name="keyword" value="auto">
                    	<!--<div class="firsttitle">消息标题：<input type="text" value="" name ="title" id="titletxt" /></div>-->
                    	<div style="width:250px;height:auto;margin:5px auto"><textarea id="replytxt" name ="content" style="width:230px;border:1px solid #f0f0f0;min-height:80px"></textarea></div>
                    	<!--<div class="saveframe"><input type="submit" id="savebtn1" value="保存" class="savebtn" /></div>-->
                    	</form>
                    </div>
                    <div class="selectframe" id="div2" style="display:block">
                    	<form action = "addNewsMessage">
						  	<input type="hidden" name="requestType" value="auto">
				           	<input type="hidden" name="keyword" value="auto">
				           	<!--<div class="firsttitle">消息标题：<input type="text" value="" name ="title" id="titletxt" /></div>-->
                    	<div style="width:260px;height:auto;margin:0 auto">
                    	<div id="preview">
    						<img id="imghead" style="width:100%; height:117px" name ="picUrl" border=0 src='<%=request.getContextPath()%>/images/defaul.jpg'>
						</div>
						<input type="file" onchange="previewImage(this)" /> 
                    	</div>
                    	<!--<div style="width:250px;height:auto;margin:5px auto" value="图文描述"><textarea id="replytxt" name ="content" style="width:230px;border:1px solid #f0f0f0;min-height:80px">图文描述</textarea></div>-->
                    	<!--<div class="firsttitle">图文链接1：<input type="text" value="" name ="linkUrl" id="urltxt" /></div>-->
                    	<!--<div class="saveframe"><input type="submit" id="savebtn2" value="保存" class="savebtn" /></div>-->
                    	</form>
                    </div>
			</div>
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

            if( width>maxWidth || height>maxHeight )

            {

                rateWidth = width / maxWidth;

                rateHeight = height / maxHeight;

                 

                if( rateWidth > rateHeight )

                {

                    param.width =  maxWidth+170;

                    param.height = Math.round(height / rateWidth);

                }else

                {

                    param.width = Math.round(width / rateHeight)+170;

                    param.height = maxHeight;

                }

            }

             

            param.left = Math.round((maxWidth - param.width) / 2);

            param.top = Math.round((maxHeight - param.height) / 2);

            return param;

        }

</script>
                    
                    
                    <div class="saveframe"><input type="button" class="savebtn" id="btn4" value="保存" /></div>
                </div>
                <div id="addBoll1" style="display:none; width:120px; margin:20px auto;">
                 	<input type="button" class="newbtn" style="font-size:13px;" value="添加二级菜单" id="addBtn1" />
            	</div>
                <div id="addBoll2" style="display:none; width:120px; margin:20px auto;">
                 	<input type="button" class="newbtn" style="font-size:13px;" value="添加二级菜单" id="addBtn2" />
            	</div>
            </div>
            <!--<div id="addBoll" style="display:none">
                 <input type="button" value="添加二级菜单" id="addBtn" />
            </div>-->
             <script>
			 	var ismenu = document.getElementById('menu3').innerHTML;
			if(ismenu == '添加'){
				$("#menu3").click(function(){
					$("#addBoll2").show();
					$("#addBoll1").hide();
					$("#firstmenu1").hide();
					$("#firstmenu2").hide();
					$("#firstmenu3").hide();
					$("#secendmenu1").hide();
					$("#secendmenu2").hide();
					$("#secendmenu3").hide();
					$("#secondmenu2").hide();
					$("#secondmenu3").hide();
					$("#secondmenu4").hide();
				})
				$("#addBtn2").click(function(){
					$("#addBtn2").hide();
					$("#firstmenu3").show();
					$("#firstmenu1").hide();
					$("#firstmenu2").hide();
				})
				$("#save3").click(function(){
					//alert($("#menutxt2").val());
					//alert($("#ss").text());
					//$("#ss").html()=$("#menutxt2").val()
					document.getElementById('menu3').innerHTML = document.getElementById('menutxt3').value;
					$("#menu3").click(function(){
						$("#smenu3").show();
						$("#firstmenu3").show();
						$("#firstmenu1").hide();
						$("#firstmenu2").hide();
						document.getElementById('menutxt3').value = document.getElementById('menu3').innerHTML;
					})
				})
			}
			else
			{
				$("#menu3").click(function(){
					$("#smenu3").show();
					$("#secendmenu3").hide();
				})
			}
			 </script>   
            <script>
			var iss = document.getElementById('menu2').innerHTML;
			if(iss == '添加'){
				$("#menu2").click(function(){
					$("#addBoll1").show();
					$("#addBoll2").hide();
					$("#firstmenu1").hide();
					$("#firstmenu2").hide();
					$("#firstmenu3").hide();
					$("#secendmenu1").hide();
					$("#secendmenu2").hide();
					$("#secendmenu3").hide();
					$("#secondmenu2").hide();
					$("#secondmenu3").hide();
					$("#secondmenu4").hide();
				})
				$("#addBtn1").click(function(){
					$("#addBtn1").hide();
					$("#firstmenu2").show();
					$("#firstmenu1").hide();
					$("#firstmenu3").hide();
				})
				$("#save2").click(function(){
					//alert($("#menutxt2").val());
					//alert($("#ss").text());
					//$("#ss").html()=$("#menutxt2").val()
					document.getElementById('menu2').innerHTML = document.getElementById('menutxt2').value;
					$("#menu2").click(function(){
						$("#smenu2").show();
						$("#firstmenu2").show();
						$("#firstmenu1").hide();
						$("#firstmenu3").hide();
						document.getElementById('menutxt2').value = document.getElementById('menu2').innerHTML;
					})
				})
			}
			else
			{
				$("#menu2").click(function(){
					$("#smenu2").show();
				})
			}
			$("#menu1").click(function(){
				$("#smenu1").show();
				$("#addBoll1").hide();
				$("#secendmenu1").hide();
				$("#secendmenu2").hide();
				$("#secendmenu3").hide();
				$("#secondmenu2").hide();
				$("#secondmenu3").hide();
				$("#secondmenu4").hide();
				$("#firstmenu1").show();
				$("#firstmenu2").hide();
				$("#firstmenu3").hide();
				document.getElementById('menutxt1').value = document.getElementById('menu1').innerHTML;
			})
			$("#save1").click(function(){
				document.getElementById('menu1').innerHTML = document.getElementById('menutxt1').value;
			})
			$("#amenu1").click(function(){
				$("#addBoll1").hide();
				$("#addBoll2").hide();
				$("#firstmenu1").hide();
				$("#firstmenu2").hide();
				$("#firstmenu3").hide();
				$("#secondmenu2").hide();
				$("#secondmenu3").hide();
				$("#secondmenu4").hide();
				$("#secendmenu3").hide();
				$("#secendmenu2").hide();
				$("#secendmenu1").show();
			})
			var secondMenu = document.getElementById('smenu1');
			var sLi = secondMenu.getElementsByTagName('dd');

			var secondBtn = document.getElementById('second1');
			var secondTxt = document.getElementById('smenutxt1');
			/*secondBtn.onclick = function(){
				var oSecond = document.createElement('dd');
				secondMenu.appendChild(oSecond);
				oSecond.innerHTML = secondTxt.value;	
			
			}*/
			$(function(){
				
				i=1;
				$("#amenu1").click(function(){
					$('<dd id="aa_'+i+'"></dd>').appendTo("#smenu1");
					i=i+1;
					var fun=(function(){
							var value='';
							var con='';
							return {
								con:'',
								setValue:function(name){
									this.value=name	
								},
								save:function(){
									$("#"+this.value).text(this.con);	
								}
							}
						})();
						$("#smenu1 dd").click(function(){
								$("#addBoll1").hide();
								$("#addBoll2").hide();
								$("#firstmenu1").hide();
								$("#firstmenu2").hide();
								$("#firstmenu3").hide();
								$("#secendmenu1").hide();
								$("#secondmenu2").show();
								$("#secendmenu2").hide();
								$("#secondmenu3").hide();
								$("#secendmenu3").hide();
								$("#secondmenu4").hide();
								$("#text").html('');
								fun.setValue($(this).attr("id"));
								$("#text").val($(this).html());
							});
						$("#btn").click(function(){
								fun.con=$("#text").val();
								fun.save();
							})
					$("#second1").click(function(){
							sLi[sLi.length-1].innerHTML = secondTxt.value;
						})
				})
				
			})	
			var oDel = document.getElementById('delbtn');
			var oMenu1 = document.getElementById('menu1');
			var oSmenu1 = document.getElementById('smenu1');
			var oDel2 = document.getElementById('delbtn2');
			var oMenu2 = document.getElementById('menu12');
			var oSmenu2 = document.getElementById('smenu12');
			var oDel3 = document.getElementById('delbtn3');
			var oMenu3 = document.getElementById('menu13');
			var oSmenu3 = document.getElementById('smenu13');
			oDel.onclick = function(){
				oMenu1.innerHTML = '添加';
				oDel.style.display = 'none';
				oSmenu1.style.display = 'none';	
			}
			oDel2.onclick = function(){
				oMenu2.innerHTML = '添加';
				oDel2.style.display = 'none';
				oSmenu2.style.display = 'none';	
			}
			oDel3.onclick = function(){
				oMenu3.innerHTML = '添加';
				oDel3.style.display = 'none';
				oSmenu3.style.display = 'none';	
			}
			</script>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
$("#amenu2").click(function(){
				$("#addBoll1").hide();
				$("#addBoll2").hide();
				$("#firstmenu1").hide();
				$("#firstmenu2").hide();
				$("#firstmenu3").hide();
				$("#secondmenu2").hide();
				$("#secendmenu1").hide();
				$("#secondmenu4").hide();
				$("#secendmenu3").hide();
				$("#secendmenu4").hide();
				$("#secendmenu2").show();
			})
			var secondMenu1 = document.getElementById('smenu2');
			var sLi1 = secondMenu1.getElementsByTagName('dd');

			var secondBtn1 = document.getElementById('second2');
			var secondTxt1 = document.getElementById('smenutxt2');
			/*secondBtn.onclick = function(){
				var oSecond = document.createElement('dd');
				secondMenu.appendChild(oSecond);
				oSecond.innerHTML = secondTxt.value;	
			
			}*/
			$(function(){
				
				i=1;
				$("#second2").click(function(){
					$('<dd id="aa_'+i+'"></dd>').appendTo("#smenu2");
					sLi1[sLi1.length-1].innerHTML = secondTxt1.value;
					i=i+1;
					var fun=(function(){
							var value='';
							var con='';
							return {
								con:'',
								setValue:function(name){
									this.value=name	
								},
								save:function(){
									$("#"+this.value).text(this.con);	
								}
							}
						})();
						$("#smenu2 dd").click(function(){
								$("#addBoll1").hide();
								$("#addBoll2").hide();
								$("#firstmenu1").hide();
								$("#firstmenu2").hide();
								$("#firstmenu3").hide();
								$("#secendmenu1").hide();
								$("#secendmenu2").hide();
								$("#secendmenu3").hide();
								$("#secondmenu4").hide();
								$("#secondmenu3").show();
								$("#secondmenu2").hide();
								$("#text2").html('');
								fun.setValue($(this).attr("id"));
								$("#text2").val($(this).html());
							});
						$("#btn2").click(function(){
								fun.con=$("#text2").val();
								fun.save();
							})
					
				})
				
			})	
</script>
<script>
$("#amenu3").click(function(){
				$("#addBoll1").hide();
				$("#addBoll2").hide();
				$("#firstmenu1").hide();
				$("#firstmenu2").hide();
				$("#firstmenu3").hide();
				$("#secendmenu1").hide();
				$("#secendmenu2").hide();
				$("#secendmenu3").show();
				$("#secondmenu2").hide();
				$("#secondmenu3").hide();
				$("#secondmenu4 ").hide();
			})
			var secondMenu3 = document.getElementById('smenu3');
			var sLi3 = secondMenu3.getElementsByTagName('dd');
			var secondBtn3 = document.getElementById('second3');
			var secondTxt3 = document.getElementById('smenutxt3');
			/*secondBtn.onclick = function(){
				var oSecond = document.createElement('dd');
				secondMenu.appendChild(oSecond);
				oSecond.innerHTML = secondTxt.value;	
			
			}*/
			$(function(){
				
				i=1;
				$("#second3").click(function(){
					$('<dd id="aa_'+i+'"></dd>').appendTo("#smenu3");
					sLi3[sLi3.length-1].innerHTML = secondTxt3.value;
					i=i+1;
					var fun=(function(){
							var value='';
							var con='';
							return {
								con:'',
								setValue:function(name){
									this.value=name	
								},
								save:function(){
									$("#"+this.value).text(this.con);	
								}
							}
						})();
						$("#smenu3 dd").click(function(){
								$("#addBoll1").hide();
								$("#addBoll2").hide();
								$("#firstmenu3").hide();
								$("#firstmenu2").hide();
								$("#firstmenu1").hide();
								$("#secendmenu1").hide();
								$("#secendmenu2").hide();
								$("#secondmenu2").hide();
								$("#secondmenu3").hide();
								$("#secendmenu3").hide();
								$("#secondmenu4").show();
								$("#text4").html('');
								fun.setValue($(this).attr("id"));
								$("#text4").val($(this).html());
							});
						$("#btn4").click(function(){
								fun.con=$("#text4").val();
								fun.save();
							})
				})
				
			})	
</script>
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
<body>
</body>
</html>
