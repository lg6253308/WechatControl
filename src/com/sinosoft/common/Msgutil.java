package com.sinosoft.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.protocol.Protocol;

import com.sinosoft.entity.UserDto;
import com.sinosoft.model.WxMessage;
import com.sinosoft.util.Configuration;

public class Msgutil {
	public  String token;
	public  String slave_user;
	public  String slave_sid;
	public  String sig;

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
public boolean getMessageList(HttpServletRequest request) {
		 ArrayList<WxMessage> messageList = new ArrayList<WxMessage>();
		 JSONObject  tempJson ;
		 WxMessage message ;
		
	try {
		 UserDto userDto=(UserDto)request.getSession().getAttribute("currentuser");
//			String	username  = "lg6253308@163.com";		
//			String password = "lg19860411";
		String username = userDto.getPublicCount();
		String password = userDto.getPublicPassword();
		String urltoken;
		urltoken = "https://mp.weixin.qq.com/cgi-bin/login?lang=zh_CN&f=json&pwd="
			 + md5(password) + "&username=" + username;

		HttpClient client = new HttpClient();
		Protocol myhttps = new Protocol("https",
				new MySSLProtocolSocketFactory(), 443);
		Protocol.registerProtocol("https", myhttps);
		PostMethod getMethod1 = new PostMethod(urltoken);
		//		PostMethod getMethod2 = new PostMethod(urlSig);
		getMethod1.setRequestHeader("Referer","https://mp.weixin.qq.com/");
		getMethod1.setRequestHeader("Host","mp.weixin.qq.com");
		client.executeMethod(getMethod1);
		//client.executeMethod(getMethod2);
		Cookie[] cookies = client.getState().getCookies();
		String returnStr1 = getMethod1.getResponseBodyAsString();
		token = returnStr1.split("token=")[1].split("\"")[0];
		String url = "https://mp.weixin.qq.com/cgi-bin/message?t=message/list&count=20&day=7&token="+token+"&lang=zh_CN";
		GetMethod getMethod = new GetMethod(url);
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("slave_user")) {
				slave_user = cookies[i].getValue();
			} else if (cookies[i].getName().equals("slave_sid")) {
				slave_sid = cookies[i].getValue();
			   }else if(cookies[i].getName().equals("sig")) {
					sig = cookies[i].getValue();
				}
		}
		System.out.println(slave_user+"===slave_user");
		System.out.println(slave_sid+"===slave_sid");
		System.out.println(sig+"===sig");
		
			getMethod.setRequestHeader("Cookie", "slave_user=" + slave_user
					+ ";slave_sid=" + slave_sid);
		System.out.println("1112221"+getMethod);
		HttpClient client1 = new HttpClient();
		client1.executeMethod(getMethod);
		
		String returnStr = getMethod.getResponseBodyAsString();
//		System.out.println(returnStr);
		String msgList = returnStr.split("msg_item")[1];
		
		//Pattern pattern = Pattern.compile("\\[(.*)\\]");
		//Matcher match = pattern.matcher(msgList);
		//msgList = match.group(0);
		msgList = msgList.substring((msgList.indexOf("[")+1),(msgList.indexOf("]")));
		msgList  = "{\"msg_item\":["+msgList+"]}";
		JSONObject jsonob = JSONObject.fromObject(msgList);
		JSONArray jsons = jsonob.getJSONArray("msg_item");
		System.out.println(jsons.toString());
		for (int i = 0; i < jsons.size(); i++) {
			message = new WxMessage(); 
			tempJson = JSONObject.fromObject(jsons.get(i));
			message.setId(tempJson.getString("id").toString());
			message.setFakeId(tempJson.getString("fakeid").toString()) ;
			if(tempJson.containsKey("content")){
				message.setContent(tempJson.getString("content").toString());
			}else{
			message.setContent("非文本消息~！");
			}
			message.setIs_reply(tempJson.getString("has_reply").toString());
			message.setNick_name(tempJson.getString("nick_name").toString());
			String time = tempJson.getString("date_time").toString()+"000";
			long longtime = Long.parseLong(time);
			message.setDate_time(getDate(longtime));
			message.setMsg_status(tempJson.getString("msg_status").toString());
			message.setSource(tempJson.getString("source").toString());
			message.setType(tempJson.getString("type").toString());
			message.setRefuse_reason(tempJson.getString("refuse_reason").toString());
			
			//----------------------------------------------------------------------------
			
			String imgurl = "https://mp.weixin.qq.com/cgi-bin/getheadimg?fakeid="+message.getFakeId()+"&token="+token+"&lang=zh_CN";
			//				String infoUrl = "http://mp.weixin.qq.com/cgi-bin/getcontactinfo?t=ajax-getcontactinfo&fakeid="+wxUser.getFakeId();
			Protocol.registerProtocol("https", myhttps);
			getMethod = new GetMethod(imgurl);
			System.out.println(getMethod+"++++++++++++++++++++++++");
							
			Cookie[] cookies1 = client.getState().getCookies();
			for (int j = 0; j < cookies1.length; j++) {
				if (cookies1[j].getName().equals("slave_user")) {
					slave_user = cookies1[j].getValue();
				} else if (cookies1[j].getName().equals("slave_sid")) {
					slave_sid = cookies1[j].getValue();
				}else if(cookies1[j].getName().equals("sig")) {
					sig = cookies1[j].getValue();
				}
			}
			getMethod.setRequestHeader("Cookie", "slave_user=" + slave_user
									+ ";slave_sid=" + slave_sid);
			client.executeMethod(getMethod);														
			byte[] imagebyte = getMethod.getResponseBody();	
			
			String path = Msgutil.class.getResource("/").toString();
			path = path.replace("file:/", "").replace("classes/", "configs/sqlServer.properties");
			Configuration configer= new Configuration(path);
			String filepath = configer.getValue("fansImagePath");
			
			File file=new File(filepath+message.getFakeId()+".jpeg");
			FileOutputStream fos=new FileOutputStream(file);
			fos.write(imagebyte);
			fos.flush();
			fos.close();							
			message.setIconSrc("/fansIcon/"+message.getFakeId()+".jpeg");
			//----------------------------------------------------------------------------
			messageList.add(message);			 
		}
			
		request.setAttribute("messageList",messageList);
//		for (WxMessage messages : messageList) {
//			System.out.println(messages.getNick_name()+"===============nick name =================="+messages.getDate_time());
//		}
		return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}
	 public static String getDate(long haomiao){
		 	Date dat=new Date(haomiao);  
		    GregorianCalendar gc = new GregorianCalendar();   
		    gc.setTime(dat);  
		    java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  
		    String time=format.format(gc.getTime()); 
		 return time;
	 }
//	 public static void main(String[] args) {
//		Msgutil mu = new Msgutil();
//		mu.getMessageList();
//	}
}
