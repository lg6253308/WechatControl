package com.sinosoft.action;

	import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.protocol.Protocol;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.sinosoft.common.FansTask;
import com.sinosoft.common.MySSLProtocolSocketFactory;
import com.sinosoft.common.Page;
import com.sinosoft.common.Userutil;
import com.sinosoft.dao.FansinfoDao;
import com.sinosoft.dao.WechatUserDao;
import com.sinosoft.entity.FansinfoDto;
import com.sinosoft.entity.FansinfoKey;
import com.sinosoft.entity.UserDto;
import com.sinosoft.model.Groups;
import com.sinosoft.model.WxUser;
import com.sinosoft.util.Configuration;

	public class FansinfoAction extends ActionSupport implements ServletRequestAware {
		private WechatUserDao wechatUserDao;
		private FansinfoDao fansinfoDao;		
		private HttpServletRequest request;
		public  String token;
		public  String slave_user;
		public  String slave_sid;
		public  String sig;
		private UserDto userDto = null;
		private FansinfoDto fansinfoDto = null;

		public void setServletRequest(HttpServletRequest request) {
			// TODO Auto-generated method stub
			this.request = request;			
		}
		
		public List<FansinfoDto> showFans(){
			List<FansinfoDto> fansList = null ; 
			return fansList;
		}
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
		
		
		public void getFanList() {
			System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`");
			List<UserDto> allUser = wechatUserDao.getAllUser();
			System.out.println(allUser.size());
			for (int i = 0; i < allUser.size(); i++) {
				
				userDto=allUser.get(i);			
				String username = userDto.getPublicCount();
				String pwd = userDto.getPublicPassword();
				String urltoken="";
				if((null==userDto.getPublicCount())||(null==userDto.getPassword())){
					System.out.println(" 用户信息缺失公共账号密码或用户名");
					continue;
				}
				for(int groupnum=0;groupnum<3;groupnum++){
				try {
					urltoken = "https://mp.weixin.qq.com/cgi-bin/login?lang=zh_CN&f=json&pwd="
						 + md5(pwd) + "&username=" + username;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					System.out.println("加密错误===================");
					e.printStackTrace();
				}
				HttpClient client = new HttpClient();
				Protocol myhttps = new Protocol("https",new MySSLProtocolSocketFactory(), 443);
				Protocol.registerProtocol("https", myhttps);
				PostMethod postMethod = new PostMethod(urltoken);
				postMethod.setRequestHeader("Referer","https://mp.weixin.qq.com/");
				postMethod.setRequestHeader("Host","mp.weixin.qq.com");
				try {
					client.executeMethod(postMethod);
				} catch (HttpException e) {
					System.out.println("用户名密码不匹配===================");
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				int PageIdx = 1;  
				Cookie[] cookies = client.getState().getCookies();
				String returnStr1="";
				try {
					returnStr1 = postMethod.getResponseBodyAsString();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				token = returnStr1.split("token=")[1].split("\"")[0];
				String url = "https://mp.weixin.qq.com/cgi-bin/contactmanage?t=user/index&pagesize=100&pageidx="+(PageIdx-1)
				+"&type=0&groupid="+groupnum+"&token="
				+ token+ "&lang=zh_CN";
				GetMethod getMethod = new GetMethod(url);
				for (int m = 0; m < cookies.length; m++) {
					if (cookies[m].getName().equals("slave_user")) {
						slave_user = cookies[m].getValue();
						
					} else if (cookies[m].getName().equals("slave_sid")) {
						slave_sid = cookies[m].getValue();			
					   }else if(cookies[m].getName().equals("sig")) {
							sig = cookies[m].getValue();
					}
				}
				
				getMethod.setRequestHeader("Cookie", "slave_user=" + slave_user
							+ ";slave_sid=" + slave_sid);
				HttpClient client1 = new HttpClient();
				try {
					client1.executeMethod(getMethod);
				} catch (HttpException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
				String returnStr="";
				try {
					returnStr = getMethod.getResponseBodyAsString();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(url);
			
				// 获取分页等信息
				String account = "{\"message\":["
					+ returnStr.split("wx.cgiData=")[1].split("\\.contacts")[0].replaceAll("\\.contacts", "").replaceAll("[()]", "").replaceAll("\\.groups", "")+ "}]}";
	//			String accountCon = returnStr.split("friendsList \\:")[1].split("\\.groups")[0].replaceAll("[()]", "").replaceAll("\\.groups,", "");
	//			String accountGro = returnStr.split("groupsList \\:")[1].split("\\.contacts")[0].replaceAll("[()]", "").replaceAll("\\.contacts,", "");
				account = account.split("friendsList")[1];
				
				account = account.substring(2, account.length()-3);
				JSONObject jsonob = JSONObject.fromObject(account);
				JSONArray jsons;
				JSONObject tempJson;
				jsons = jsonob.getJSONArray("contacts");
				for (int n = 0; n < jsons.size(); n++) {
					fansinfoDto = new FansinfoDto();
					tempJson = JSONObject.fromObject(jsons.get(n));
				
					System.out.println(tempJson.get("id").toString());
				
//-------------------------------------------Action 存库-------------------------------------------------
					System.out.println("userid = =========================================="+userDto.getUserid());
					fansinfoDto.setUserid(userDto.getUserid());
					System.out.println("嚯嚯嚯嚯=====================================");
					fansinfoDto.setFakeid(tempJson.get("id").toString());
					fansinfoDto.setNickName(tempJson.get("nick_name").toString());
					fansinfoDto.setRemarkName(tempJson.get("remark_name").toString());	
					fansinfoDto.setGroupid(tempJson.get("group_id").toString());
					fansinfoDto.setPicsrc("/fansIcon/"+fansinfoDto.getFakeid()+".jpeg");						
//-------------------------------------------Action 存库-------------------------------------------------						
//					if(!fansinfoDto.getFakeid().equals("196719560")){
//						continue;     //调试表情错误
//					}
					String imgurl = "https://mp.weixin.qq.com/cgi-bin/getheadimg?fakeid="+fansinfoDto.getFakeid()+"&token="+token+"&lang=zh_CN";
				
						getMethod = new GetMethod(imgurl);
				
						getMethod.setRequestHeader("Cookie", "slave_user=" + slave_user
								+ ";slave_sid=" + slave_sid);	
					
						try {
							client.executeMethod(getMethod);
						} catch (HttpException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

						
						try {
						byte[] imagebyte = getMethod.getResponseBody();
						
						String path = FansinfoAction.class.getResource("/").toString();
						path = path.replace("file:/", "").replace("classes/", "configs/sqlServer.properties");
						Configuration configer= new Configuration(path);
						String filepath = configer.getValue("fansImagePath");
						
						File file=new File(filepath+fansinfoDto.getFakeid()+".jpeg");
						//E:\\chatmangCode\\WechatControl\\WebRoot\\fansIcon\\
						//E:\\workspace\\WechatControl\\WebRoot\\fansIcon\\
						
						FileOutputStream fos = new FileOutputStream(file);
						
						fos.write(imagebyte);
						fos.flush();
						fos.close();
						
						} catch (Exception e) {
							System.out.println("=====================image =error1=======================");
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						fansinfoDto.setPicsrc("/fansIcon/"+fansinfoDto.getFakeid()+".jpeg");
						//获取用户详细信息
						String infoUrl = "http://mp.weixin.qq.com/cgi-bin/getcontactinfo?t=ajax-getcontactinfo&fakeid="+fansinfoDto.getFakeid()+"&token="+token;   //"&f=json"&random=0.22582685761153698
						PostMethod postMethod1 = new PostMethod(infoUrl);
						postMethod1.setRequestHeader("Cookie", "slave_user=" + slave_user
								+ ";slave_sid=" + slave_sid);
						postMethod1.setRequestHeader("Referer","https://mp.weixin.qq.com/cgi-bin/contactmanage?t=user/index&pagesize=10&pageidx=0&type=0&token="+token+"&lang=zh_CN");
						try {
							client.executeMethod(postMethod1);
						} catch (HttpException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}												
						String userInfo="";
						try {
							userInfo = postMethod1.getResponseBodyAsString();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}			
						
						JSONObject userInfoJson = JSONObject.fromObject(userInfo);
						fansinfoDto.setGroups(userInfoJson.getString("groups").toString());
						userInfoJson = JSONObject.fromObject(userInfoJson.get("contact_info"));			
						fansinfoDto.setAddress(userInfoJson.get("country").toString()+" "+userInfoJson.get("province").toString()+" "+userInfoJson.get("city").toString());
						fansinfoDto.setGender(userInfoJson.get("gender").toString());
						fansinfoDto.setSignature(userInfoJson.get("signature").toString());
						fansinfoDto.setRemarkName(userInfoJson.get("remark_name").toString());	
						if(fansinfoDto.getPicsrc()==null){
					//		continue;
						}else{
							
						fansinfoDao.deleteByPrimaryKey(new FansinfoKey(fansinfoDto.getUserid(),fansinfoDto.getFakeid()));	
 						String sn=fansinfoDto.getSignature();
	
						byte[] b=fansinfoDto.getSignature().getBytes();

						sn = new String(b);
						fansinfoDto.setSignature(sn);
						int iii =fansinfoDao.insert(fansinfoDto);
						}
					}	
			}
				}
	
			System.out.println("===============加载结束======================");
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
		
		public String showFanList(){
			HttpSession session = request.getSession();
			ArrayList<FansinfoDto> userList = new ArrayList<FansinfoDto>();
			ArrayList<Groups> grouplist= new ArrayList<Groups>();
			String groupJson ="{\"groups\":[{\"id\":0,\"name\":\"未分组\",\"cnt\":0},{\"id\":1,\"name\":\"黑名单\",\"cnt\":0},{\"id\":2,\"name\":\"星标组\",\"cnt\":0}]}";
			//	System.out.println("-------------"+groupId);
				if(null==request.getSession().getAttribute("currentuser")||request.getSession().isNew()){
					System.out.println("必须先登录啊 亲~~~！！！！~~~~~！！！！~~~~！！！");
					return "login";
		          }else{
				userDto=(UserDto)session.getAttribute("currentuser");
				}		
				userList = (ArrayList<FansinfoDto>) fansinfoDao.selectAll(userDto.getUserid());
				if(null!=userList && userList.size()>0){
					groupJson = userList.get(0).getGroups();
				}
				Groups groups =null;
				JSONObject tempJson;
				JSONObject jsonob = JSONObject.fromObject(groupJson);
				 jsonob.getJSONArray("groups");
				 JSONArray jsons = jsonob.getJSONArray("groups");
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
					
				request.setAttribute("grouplist",grouplist);
				request.setAttribute("userList",userList);
				return "success";
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
		
		
		
		public FansinfoDao getFansinfoDao() {
			return fansinfoDao;
		}
		public void setFansinfoDao(FansinfoDao fansinfoDao) {
			this.fansinfoDao = fansinfoDao;
		}

		public WechatUserDao getWechatUserDao() {
			return wechatUserDao;
		}

		public void setWechatUserDao(WechatUserDao wechatUserDao) {
			this.wechatUserDao = wechatUserDao;
		}
	
		
	}