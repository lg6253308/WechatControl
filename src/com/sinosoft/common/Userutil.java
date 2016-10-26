package com.sinosoft.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.protocol.Protocol;

import com.sinosoft.entity.UserDto;
import com.sinosoft.model.Groups;
import com.sinosoft.model.WxUser;


public class Userutil {

	public  String token;
	public  String slave_user;
	public  String slave_sid;
	public  String sig;
	private UserDto userDto = null;
	private WxUser wxUser = null;
	public String md5(String pwd) throws Exception {
		ScriptEngineManager m = new ScriptEngineManager();
		ScriptEngine engine = m.getEngineByName("javascript");
		InputStreamReader in = new InputStreamReader(new Userutil().getClass()
				.getResourceAsStream("/com/sinosoft/common/txmd5.js"));
		BufferedReader read = new BufferedReader(in);
		engine.eval(read);
		Invocable invocableEngine = (Invocable) engine;
		return invocableEngine.invokeFunction("md5", pwd).toString();
	}	
	public boolean getFanList(HttpServletRequest request,String groupId) {
		System.out.println(new Date()+"======================method================");
		ArrayList<WxUser> userList = new ArrayList<WxUser>();
		ArrayList<Groups> grouplist= new ArrayList<Groups>();
//		String groupId = request.getParameter("")
		try {
			HttpSession session = request.getSession();
			System.out.println("-------------"+groupId);
			if(null==request.getSession().getAttribute("currentuser")||request.getSession().isNew()){
				System.out.println("必须先登录啊 亲~~~！！！！~~~~~！！！！~~~~！！！");
				return false;
	          }else{
			userDto=(UserDto)session.getAttribute("currentuser");
			}
			String username = userDto.getPublicCount();
			String pwd = userDto.getPublicPassword();
//			String username = "lg6253308@163.com";
//			String pwd = "lg19860411";
			String urltoken = "https://mp.weixin.qq.com/cgi-bin/login?lang=zh_CN&f=json&pwd="
					 + md5(pwd) + "&username=" + username;
			
	//		String urlSig = "https://mp.weixin.qq.com/cgi-bin/verifycode?username="
	//			+ username + "&r=" + System.currentTimeMillis();
			int PageIdx = 1;    //当前页码
			String pgn = request.getParameter("pgn");
			
			System.out.println("pgn======="+pgn);
			String pvar = request.getParameter("pvar");
			
			System.out.println("pvar======="+pvar);
			Page page = new Page();
			HttpClient client = new HttpClient();
			Protocol myhttps = new Protocol("https",
					new MySSLProtocolSocketFactory(), 443);
			Protocol.registerProtocol("https", myhttps);
			PostMethod postMethod = new PostMethod(urltoken);
//			PostMethod getMethod2 = new PostMethod(urlSig);
			postMethod.setRequestHeader("Referer","https://mp.weixin.qq.com/");
			postMethod.setRequestHeader("Host","mp.weixin.qq.com");
			client.executeMethod(postMethod);
//			client.executeMethod(getMethod2);
			Cookie[] cookies = client.getState().getCookies();
			String returnStr1 = postMethod.getResponseBodyAsString();
			token = returnStr1.split("token=")[1].split("\"")[0];
			session.setAttribute("token", token);
			System.out.println("11222222"+token);
			String url = "https://mp.weixin.qq.com/cgi-bin/contactmanage?t=user/index&pagesize=10&pageidx="+(PageIdx-1)
			+"&type=0&groupid="+groupId+"&token="
			+ token+ "&lang=zh_CN";
			GetMethod getMethod = new GetMethod(url);
			System.out.println("1111"+getMethod);
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("slave_user")) {
					slave_user = cookies[i].getValue();
					session.setAttribute("slave_user", slave_user);
				} else if (cookies[i].getName().equals("slave_sid")) {
					slave_sid = cookies[i].getValue();
					session.setAttribute("slave_sid", slave_sid);
				   }else if(cookies[i].getName().equals("sig")) {
						sig = cookies[i].getValue();
						session.setAttribute("sig", sig);
					}
			}
			
				getMethod.setRequestHeader("Cookie", "slave_user=" + slave_user
						+ ";slave_sid=" + slave_sid);
			HttpClient client1 = new HttpClient();
			client1.executeMethod(getMethod);
			
			String returnStr = getMethod.getResponseBodyAsString();
			System.out.println(url);
		
			// 获取分页等信息
			String account = "{\"message\":["
					+ returnStr.split("wx.cgiData=")[1].split("\\.contacts")[0].replaceAll("\\.contacts", "").replaceAll("[()]", "").replaceAll("\\.groups", "")+ "}]}";
			String accountCon = returnStr.split("friendsList \\:")[1].split("\\.groups")[0].replaceAll("[()]", "").replaceAll("\\.groups,", "");
			String accountGro = returnStr.split("groupsList \\:")[1].split("\\.contacts")[0].replaceAll("[()]", "").replaceAll("\\.contacts,", "");
			JSONObject jsonob = JSONObject.fromObject(account);

			JSONArray jsons = jsonob.getJSONArray("message");
			JSONObject tempJson;
			int PageCount = 0;  //总页数
			int PageSize = 0;   //每页数量
			for (int i = 0; i < jsons.size(); i++) {
				tempJson = JSONObject.fromObject(jsons.get(i));
				PageCount = Integer.parseInt(tempJson.get("pageCount")
						.toString());
				PageSize = Integer
						.parseInt(tempJson.get("pageSize").toString());
			}
			page.setPvar("pgn");
			page.setFilePath("userlist.jsp");
			page.setCharSet("utf-8");
			page.set(PageCount,PageIdx,PageSize);
			
				
				jsonob= JSONObject.fromObject(accountCon);
				jsons = jsonob.getJSONArray("contacts");
				for (int i = 0; i < jsons.size(); i++) {
					wxUser = new WxUser();
					tempJson = JSONObject.fromObject(jsons.get(i));
					wxUser.setFakeId(tempJson.get("id").toString());
					//得到ID
					System.out.println(tempJson.get("id").toString());
					//对应昵称
					wxUser.setNickName(tempJson.get("nick_name").toString());
					wxUser.setRemarkName(tempJson.get("remark_name").toString());
					wxUser.setGroupId(tempJson.get("group_id").toString());
					System.out.println(tempJson.get("nick_name").toString());
					wxUser.setToken(token);
					
					
					System.out.println(new Date()+"======================begin================");
					//-----------------------------------------------------------------------------------------------------
					//wxUser.setSrc("https://mp.weixin.qq.com/cgi-bin/getheadimg?fakeid="+wxUser.getFakeId()+"&token="+wxUser.getToken()+"&lang=zh_CN");
					//上传cookies   得到图片
					String imgurl = "https://mp.weixin.qq.com/cgi-bin/getheadimg?fakeid="+wxUser.getFakeId()+"&token="+wxUser.getToken()+"&lang=zh_CN";

//						Protocol.registerProtocol("https", myhttps);
						getMethod = new GetMethod(imgurl);

						getMethod.setRequestHeader("Cookie", "slave_user=" + slave_user
								+ ";slave_sid=" + slave_sid);												
						client.executeMethod(getMethod);
				//		getMethod.get
						byte[] imagebyte = getMethod.getResponseBody();
//						System.out.println("===================<此处为图片byte==============");
//						for (int j = 0; j < imagebyte.length; j++) {
//							System.out.print(imagebyte[j]+",");
//						}

//						System.out.println("===================此处为图片byte>==============");
						File file=new File("E:\\chatmangCode\\WechatControl\\WebRoot\\fansIcon\\"+wxUser.getFakeId()+".jpeg");
						  FileOutputStream fos=new FileOutputStream(file);
						  fos.write(imagebyte);
						  fos.flush();
						  fos.close();
						wxUser.setSrc("/fansIcon/"+wxUser.getFakeId()+".jpeg");
						//获取用户详细信息
						System.out.println(new Date()+"=======================image==================");
						String infoUrl = "http://mp.weixin.qq.com/cgi-bin/getcontactinfo?t=ajax-getcontactinfo&fakeid="+wxUser.getFakeId()+"&token="+token;   //"&f=json"&random=0.22582685761153698
						PostMethod postMethod1 = new PostMethod(infoUrl);
						postMethod1.setRequestHeader("Cookie", "slave_user=" + slave_user
								+ ";slave_sid=" + slave_sid);
						postMethod1.setRequestHeader("Referer","https://mp.weixin.qq.com/cgi-bin/contactmanage?t=user/index&pagesize=10&pageidx=0&type=0&token="+token+"&lang=zh_CN");
						client.executeMethod(postMethod1);												
						String userInfo = postMethod1.getResponseBodyAsString();						
						System.out.println("==============userInfo==================="+"\n"+userInfo);
						JSONObject userInfoJson = JSONObject.fromObject(userInfo);
						wxUser.setGroupList(userInfoJson.getString("groups").toString());
						userInfoJson = JSONObject.fromObject(userInfoJson.get("contact_info"));
						wxUser.setAddress(userInfoJson.get("country").toString()+" "+userInfoJson.get("province").toString()+" "+userInfoJson.get("city").toString());
						wxUser.setGender(userInfoJson.get("gender").toString());
						wxUser.setSignature(userInfoJson.get("signature").toString());
						wxUser.setRemark_name(userInfoJson.get("remark_name").toString());
						
						System.out.println("+++++++++++++++gender++++++++++++"+wxUser.getGender());
						System.out.println(new Date()+"===================info====================");
					userList.add(wxUser);
				}
				Groups groups =null;
				jsonob= JSONObject.fromObject(accountGro);
				jsons = jsonob.getJSONArray("groups");
				for (int i = 0; i < jsons.size(); i++) {
					groups = new Groups();
					tempJson = JSONObject.fromObject(jsons.get(i));
					groups.setId(tempJson.get("id").toString());
					//得到ID
					System.out.println(tempJson.get("id").toString());
					//分组名称
					groups.setName(tempJson.get("name").toString());
					System.out.println(tempJson.get("name").toString());
					//分组人数
					groups.setCnt(tempJson.get("cnt").toString());
					System.out.println(tempJson.get("cnt").toString());
					grouplist.add(groups);
				}
			request.setAttribute("userList",userList);
			request.setAttribute("grouplist",grouplist);
			request.setAttribute("page",page);
			System.out.println(new Date()+"======================methodend================");
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean sendMessageById(String str, String wxId,HttpServletRequest request) {
		try {
			HttpSession session = request.getSession();
			token = session.getAttribute("token").toString();
			slave_user = session.getAttribute("slave_user").toString();
			slave_sid = session.getAttribute("slave_sid").toString();
			String url = "http://mp.weixin.qq.com/cgi-bin/singlesend?t=ajax-response&lang=zh_CN&ajax=1&content="
					+ URLEncoder.encode(str, "UTF-8")
					+ "&error=false&tofakeid="
					+ wxId
					+ "&type=1&token="
					+ token;
			HttpClient client = new HttpClient();
			PostMethod getMethod = new PostMethod(url);
			getMethod.setRequestHeader("Cookie", "slave_user=" + slave_user
					+ ";slave_sid=" + slave_sid);
			getMethod.setRequestHeader(
							"Referer",
							"http://mp.weixin.qq.com/cgi-bin/singlemsgpage?fromfakeid="
									+ wxId
									+ "&msgid=&source=&count=20&t=wxm-singlechat&lang=zh_CN");
			client.executeMethod(getMethod);
			String returnStr = getMethod.getResponseBodyAsString();
			System.out.println(returnStr);
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean doGroup(String groupNum,String fakeId,HttpServletRequest request){
		try {
			
			HttpSession session = request.getSession();
			token = session.getAttribute("token").toString();
			slave_user = session.getAttribute("slave_user").toString();
			slave_sid = session.getAttribute("slave_sid").toString();
			String url = "https://mp.weixin.qq.com/cgi-bin/modifycontacts?t=ajax-putinto-group&lang=zh_CN&ajax=1&token="
					+ token
					+ "&tofakeidlist="
					+ fakeId
					+ "&contacttype="+groupNum+"&token="
					+ token+"&action=modifycontacts";
			HttpClient client = new HttpClient();
			PostMethod getMethod = new PostMethod(url);
			getMethod.setRequestHeader("Cookie", "slave_user=" + slave_user
					+ ";slave_sid=" + slave_sid);
			getMethod.setRequestHeader(
							"Referer",
							"https://mp.weixin.qq.com/cgi-bin/contactmanage?t=user/index" +
							"&pagesize=10&pageidx=0&type=0&token="+token+"&lang=zh_CN");
			client.executeMethod(getMethod);
			String returnStr = getMethod.getResponseBodyAsString();
			System.out.println(returnStr);
			
			return true;
		} catch (IOException e) {
			e.printStackTrace();		
		return false;
		}
	}
	public boolean addGroup(String groupname,HttpServletRequest request){
		
		try {

			groupname =URLEncoder.encode(groupname, "utf-8");
			HttpSession session = request.getSession();
			token = session.getAttribute("token").toString();
			slave_user = session.getAttribute("slave_user").toString();
			slave_sid = session.getAttribute("slave_sid").toString();
			String url = "https://mp.weixin.qq.com/cgi-bin/modifygroup?t=ajax-friend-group&lang=zh_CN&ajax=1&token="
					+ token
					+ "&name="
					+ groupname
					+ "&func=add";
			HttpClient client = new HttpClient();
			PostMethod postMethod = new PostMethod(url);
			postMethod.setRequestHeader("Cookie", "slave_user=" + slave_user
					+ ";slave_sid=" + slave_sid);
	
			postMethod.setRequestHeader(
							"Referer",
							"https://mp.weixin.qq.com/cgi-bin/contactmanage?t=user/index&pagesize=10&pageidx=0&type=0&token="+token+"&lang=zh_CN");
			client.executeMethod(postMethod);
			String returnStr = postMethod.getResponseBodyAsString();
			System.out.println(returnStr);
			
			return true;
		} catch (IOException e) {
			e.printStackTrace();		
		return false;
		}
	}

}
