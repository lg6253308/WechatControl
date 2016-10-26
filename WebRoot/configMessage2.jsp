<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>key</title>
<link rel="stylesheet" type="text/css" href="css/css.css" />
<link href="css/PIE.htc">
<script type="text/javascript"  src="js/jquery.min.js"></script>
</head>
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
<div class="header head">
  <div class="logotop">
    <div class="logo"><img src="images/logo_02.gif" /></div>
    <div class="nowuser">
      <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
          <td>您好，中科软科技！</td>
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
        <li><a href="reply.jsp" >关注回复</a></li>
        <li><a href="reply2.jsp" >自动回复</a></li>
        <li><a href="getKeywordList" >关键字回复</a></li>
      </ul>
    <h3>菜单管理</h3>
      <ul class="sub-menu">
        <li><a href="manuConfig.jsp" >自定义菜单</a></li>
        <li><a href="interConfig.jsp" >配置响应消息</a></li>
      </ul>
      <h3>用户管理</h3>
      <ul class="sub-menu">
        <li><a href="showFansinfoAction" >用户分组</a></li>
        <li><a href="fansMessage.jsp" >会话记录</a></li>
      </ul>
     <h3>小工具</h3>
      <ul class="sub-menu">
        <li><a href="model.jsp" >小工具</a></li>
      </ul>
     <h3>联系我们</h3>
      <ul class="sub-menu">
        <li><a href="About.jsp" >关于我们</a></li>
        <li><a href="#">咨询方式</a></li>
      </ul>
    </li>
  </ul>
</div>
    </div>
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

    //图片上传预览    IE是用了滤镜。

        function previewImage(file)

        {

          var MAXWIDTH  = 260;

          var MAXHEIGHT = 180;

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

                    param.width =  maxWidth;

                    param.height = Math.round(height / rateWidth);

                }else

                {

                    param.width = Math.round(width / rateHeight);

                    param.height = maxHeight;

                }

            }

             

            param.left = Math.round((maxWidth - param.width) / 2);

            param.top = Math.round((maxHeight - param.height) / 2);

            return param;

        }

</script>
          </div>
          <div class="keylist">
            <ul id="key">
            	 <c:forEach items="${messageList}" var="message" varStatus="status"> 
        
                <li style="position:relative">
                <div class="key_left">${message.keyword}</div>
                <div class="key_right"><a id="editor${status.index}" onmouseover="editor(${status.index})" class="edit"></a><a href="#" class="save"></a><a href="#" class="del"></a></div>
                <div id="edit${status.index}" style="display:none; background-position:-18px 0;">
                  <div class="firsttitle">
	                    回复类型：<select name=select id="select1">
	                    	<option name="option1" id="option1" value="text">纯文本</option>
	                    	<option name="option2" id="option2" value="news">单图文</option>
	                    </select>
                    </div>
                    <div class="selectframe" id="div1" style="display:block">
                    	<div class="firsttitle" style="background:#fff">消息标题：<input type="text" name ="title" value="" id="titletxt" /></div>
                    	<div style="width:250px;height:auto;margin:5px auto"><textarea id="replytxt" name="content" style="width:230px;border:1px solid #f0f0f0;min-height:80px"></textarea></div>
                    	<div class="saveframe"><input type="submit" id="savebtn1" value="保存" class="savebtn" /></div>
                    </div>
                    <div class="selectframe" id="div2">
                    	<div style="width:260px;height:auto;margin:0 auto">
                    	<div id="preview">
    						<img id="imghead" border=0 src='<%=request.getContextPath()%>/images/defaul.jpg'>
						</div>
						<input type="file" onchange="previewImage(this)" /> 
                    	</div>
                    	<div class="saveframe"><input type="submit" id="savebtn2" value="保存" class="savebtn" /></div>
                    </div>
                    
                </div>
                   </c:forEach>
              </li>
            </ul>
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
					var oFirst = document.getElementById("edit");
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
					var oPhone = document.getElementById('showphone');
					var imgPhone = document.getElementById('imgPhone');
					var oAsktitle = document.getElementById('asktitle');
					var oMyinfo = document.getElementById('myinfo');
					var imginfo = document.getElementById('imginfo');
					var oTitle = document.getElementById('titletxt');
					var oBtn1 = document.getElementById('savebtn1');
					var oBtn2 = document.getElementById('savebtn2');
					var oReply = document.getElementById('replytxt');
					var oPre = document.getElementById('preview');
					oBtn1.onclick = function(){
						oPhone.style.display = 'block';
						imgPhone.style.display = 'none';
						oAsktitle.innerHTML = oTitle.value;
						oMyinfo.innerHTML = oReply.value;
					}
					oBtn2.onclick = function(){
						imgPhone.style.display = 'block';
						oPhone.style.display = 'none';
						//oAsktitle.innerHTML = oTitle.value;
						imginfo.innerHTML = oPre.innerHTML;
					}
					
				</script>
            <script>
					function editor(index){
						var oEdit = document.getElementById('edit'+index);
						var oEditor = document.getElementById('editor'+index);
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
						/*for(var i=0;i<oDel.length;i++){
							oDel[i].onclick = function(){
								oLi[i].removeChild(this.parentNode)	
							}
						}*/
					}
					$(".newbtn").click(function(){
						$('<li class="Homeml Less Homeml_over"><div class="key_left"  style="cursor: pointer;">'
						+'<span class="_number"><input class="kwd kewnew" menuid="0" type="text" value="" /></span>'
						+'</div><div class="key_right"><a class="edit" menuid="0" title="编辑"></a>'
						+'<a class="save" menuid="0" title="保存"></a>'
						+'<a class="del"  title="删除" menuid="0"></a> '	
						+'</div></li>').prependTo("#key");
						
						$("#key li").hover(function(){
							$(this).addClass('active');
							$(this).find('key_right').show();
						},function(){
						$(this).removeClass('active')});
						
					})
					
				</script>
          </div>
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
<body>
</body>
</html>
