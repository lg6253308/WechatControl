<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
        <li><a href="showManu" >自定义菜单</a></li>
      </ul>
      <h3>用户管理</h3>
      <ul class="sub-menu">
        <li><a href="showFansinfoAction" >粉丝分组</a></li>
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
        <div class="titlename">回复设置->关注回复</div>
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
          </div>
          <div class="keylist" style="height:auto; padding-bottom:15px; min-height:235px">
            <div id="firstmenu">
            		<form action = "addTextMessage" >
            		<input type="hidden" name="requestType" value="subscribe">
         		    <input type="hidden" name="keyword" value="subscribe">
                	<div class="firsttitle">消息标题：<input type="text" value="" name ="title" id="titletxt" /></div>
                    <div class="firstinfo">注：主菜单按钮文字不超过14个汉字或8个字母，子菜单标题最多不超过8个汉字或16个字母</div>
                    <div style="width:250px;height:auto;margin:0 auto"><textarea id="replytxt" name ="content" style="width:230px;border:1px solid #f0f0f0;min-height:80px"></textarea></div>
                    <div class="saveframe"><input type="submit" id="savebtn" value="保存" class="savebtn" /></div></form>
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
					var oPhone = document.getElementById('showphone');
					var oAsktitle = document.getElementById('asktitle');
					var oMyinfo = document.getElementById('myinfo');
					var oTitle = document.getElementById('titletxt');
					var oBtn = document.getElementById('savebtn');
					var oReply = document.getElementById('replytxt');
					oBtn.onclick = function(){
						oPhone.style.display = 'block';
						oAsktitle.innerHTML = oTitle.value;
						oMyinfo.innerHTML = oReply.value;
					}
					
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
