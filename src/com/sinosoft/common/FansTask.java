package com.sinosoft.common;

import java.io.IOException;
import java.util.TimerTask;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.protocol.Protocol;

import com.sinosoft.util.Configuration;

public class FansTask extends TimerTask{
	
	@Override
	public void run() {
		String path = FansTask.class.getResource("/").toString();
		path = path.replace("file:/", "").replace("classes/", "configs/sqlServer.properties");
		Configuration configer= new Configuration(path);
		String url = configer.getValue("fansinfoTaskUrl");
		
		HttpClient client = new HttpClient();
		Protocol myhttps = new Protocol("https",new MySSLProtocolSocketFactory(), 443);
		Protocol.registerProtocol("https", myhttps);
		GetMethod get = new GetMethod(url);
		try {
			client.executeMethod(get);
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("============taskstop====================");
	}
}
