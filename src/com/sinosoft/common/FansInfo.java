package com.sinosoft.common;

import java.io.IOException;

import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.protocol.Protocol;

public class FansInfo {
	
	
	public static void main(String[] args) throws HttpException, IOException {
		String sig="";
		String slave_user="";
		String slave_sid="";
		String fakeid="496097695";
		String url ="http://mp.weixin.qq.com/cgi-bin/getcontactinfo?t=ajax-getcontactinfo&fakeid="+fakeid;
		HttpClient client = new HttpClient();
		Protocol myhttps = new Protocol("https",new MySSLProtocolSocketFactory(), 443);
		Protocol.registerProtocol("https", myhttps);
		PostMethod postMethod = new PostMethod(url);
		client.executeMethod(postMethod);
		Cookie[] cookies = client.getState().getCookies();
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("slave_user")) {
				slave_user = cookies[i].getValue();
			} else if (cookies[i].getName().equals("slave_sid")) {
				slave_sid = cookies[i].getValue();
			   }else if(cookies[i].getName().equals("sig")) {
					sig = cookies[i].getValue();
				}
		}
		postMethod.setRequestHeader("Cookie", "slave_user=" + slave_user
				+ ";slave_sid=" + slave_sid);
		postMethod.setRequestHeader("Referer","https://mp.weixin.qq.com/");
		postMethod.setRequestHeader("Host","mp.weixin.qq.com");
		postMethod.setRequestHeader("type","form");
		String result = postMethod.getResponseBodyAsString();
		System.out.println(result);
	}
}
