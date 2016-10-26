package com.sinosoft.manu.common;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sinosoft.manu.POJO.Button;
import com.sinosoft.manu.POJO.CommonButton;
import com.sinosoft.manu.POJO.ComplexButton;
import com.sinosoft.manu.POJO.Menu;
import com.sinosoft.manu.POJO.ViewButton;
import com.sinosoft.manu.common.https.HttpClientConnectionManager;


public class WxMenuUtils {
	// http
	public static DefaultHttpClient httpclient;
	
	static {
		httpclient = new DefaultHttpClient();
		httpclient = (DefaultHttpClient) HttpClientConnectionManager.getSSLInstance(httpclient); 
	}
	public String upLoadManu(String appId,String appSecret,String manuString){
		String res="";
		try {
			String accessToken = getAccessToken(appId,appSecret);
			System.out.println(accessToken+"============accesstoken===========");
			res = createMenu(manuString, accessToken);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
		
	}
	public static void main(String[] args) {
		try {
			String accessToken = "9ofS3QMg7o_23zLTHqseeiHHC26uMslIN69GblMdAzhKiGzIyuyEs_UpNfSOeF5gZBQ_-UIl9Kbq1C3H1_0PhdwkKQUH6Gkv1lMQygfzmONVvUQZxU7W45g007npZMJpgYLhU5t2nBVewjnTovLbkw";
//			// accessToken 
//			String accessToken = getAccessToken("wxd6f816ec05b7b49c", "0866147f7f5beb7048918b3874dbdf2b");
			System.out.println(accessToken);
			
			String res ;
			
		
//			res = deleteMenu(accessToken);
			
			
			String s = getMenu();
			System.out.println(s);
			res = createMenu(s, accessToken);
			
	System.out.println(res);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		Menu menu = new Menu();    
//		ViewButton cb = new ViewButton();
//		cb.setName("aa");
//		cb.setUrl("www.baidu.com");
//		cb.setType("view");
//	     menu.setButton(new Button[]{null,cb});                               
//	     String jsonMenu = net.sf.json.JSONObject.fromObject(menu).toString();  
//		System.out.println(jsonMenu);
	}
	
	
	
	public static String createMenu(String params, String accessToken) throws Exception {
		HttpPost httpost = HttpClientConnectionManager.getPostMethod("https://api.weixin.qq.com/cgi-bin/menu/create?access_token=" + accessToken);
		httpost.setEntity(new StringEntity(params, "UTF-8"));
		HttpResponse response = httpclient.execute(httpost);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		System.out.println(jsonStr);
		JSONObject object = JSON.parseObject(jsonStr);
		return object.getString("errmsg");
	}

	/**
	 * ��ȡaccessToken
	 */
	public static String getAccessToken(String appid, String secret) throws Exception {
		HttpGet get = HttpClientConnectionManager.getGetMethod("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + appid + "&secret=" + secret);
		HttpResponse response = httpclient.execute(get);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		JSONObject object = JSON.parseObject(jsonStr);
		return object.getString("access_token");
	}
	
	/**
	 * ��ѯ�˵�
	 */
	public static String getMenuInfo(String accessToken) throws Exception {
		HttpGet get = HttpClientConnectionManager.getGetMethod("https://api.weixin.qq.com/cgi-bin/menu/get?access_token=" + accessToken);
		HttpResponse response = httpclient.execute(get);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		return jsonStr;
	}
	
	/**
	 * ɾ���Զ���˵�
	 */
	public static String deleteMenu(String accessToken) throws Exception {
		HttpGet get = HttpClientConnectionManager.getGetMethod("https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=" + accessToken);
		HttpResponse response = httpclient.execute(get);
		String jsonStr = EntityUtils.toString(response.getEntity(), "utf-8");
		JSONObject object = JSON.parseObject(jsonStr);
		return object.getString("errmsg");
	}
	
	/**                                                                                               
	 * ��װ�˵����                                                                                   
	 *                                                                                                
	 * @return                                                                                        
	 */                                                                                               
	public static String getMenu() {                                                                   
	    CommonButton btn11 = new CommonButton();                                                      
	    btn11.setName("��˾����");                                                                    
	    btn11.setType("click");                                                                       
	    btn11.setKey("sinosoft_notice");                                                                           
	                                                                                                  
	    CommonButton btn21 = new CommonButton();                                                      
	    btn21.setName("�ʼ�����");                                                                    
	    btn21.setType("click");                                                                       
	    btn21.setKey("sinosoft_mail");                                                                           
	                                                                                                  
	    CommonButton btn22 = new CommonButton();                                                      
	    btn22.setName("����Ԥ��");                                                                    
	    btn22.setType("click");                                                                       
	    btn22.setKey("sinosoft_weather");                                                                           
	                                                                                                  
	    CommonButton btn23 = new CommonButton();                                                      
	    btn23.setName("��ݷ���");                                                                    
	    btn23.setType("click");                                                                       
	    btn23.setKey("sinosoft_service");                                                                           
	                                                                                                  
	    CommonButton btn24 = new CommonButton();                                                      
	    btn24.setName("�����");                                                                    
	    btn24.setType("click");                                                                       
	    btn24.setKey("sinosoft_suggestionbox");                                                                           
	    
	    ComplexButton mainBtn2 = new ComplexButton();                                                
	    mainBtn2.setName("���ͨ��");                                                                
	    mainBtn2.setSub_button(new CommonButton[] { btn21, btn22, btn23, btn24});  
	     
	     
	    CommonButton btn31 = new CommonButton();                                                      
	    btn31.setName("��������");                                                                       
	    btn31.setType("click");                                                                       
	    btn31.setKey("sinosoft_about");                                                                           
	                                                                                                  
	     Menu menu = new Menu();     
	     menu.setButton(new Button[] { btn11, mainBtn2, btn31 });                               
	     String jsonMenu = net.sf.json.JSONObject.fromObject(menu).toString();  
	     
	     return jsonMenu;                                                                                 
	 }                                                                                                

	
	
	
}