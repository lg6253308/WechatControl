package com.sinosoft.app;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sinosoft.dao.MessageResponseDao;
import com.sinosoft.entity.MessageResponseDto;
import com.sinosoft.entity.MessageResponseKey;
import com.sinosoft.resp.Article;
import com.sinosoft.resp.NewsMessage;
import com.sinosoft.resp.TextMessage;
import com.sinosoft.util.MessageUtil;


public class ManuService {
	String content="";
	
	public String processRequest(HttpServletRequest request,String id,MessageResponseDao messageResponseDao) {
		String respMessage = null;

		try {
			// xml请求解析
			Map<String, String> requestMap = MessageUtil.parseXml(request);										// 发送方帐号（open_id）
			String fromUserName = requestMap.get("FromUserName");
			// 公众帐号
			String toUserName = requestMap.get("ToUserName");
			
			// 消息类型
			String msgType = requestMap.get("MsgType");   //subscribe
			//消息内容
			TextMessage textMessage = new TextMessage();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			textMessage.setFuncFlag(0);
			// 由于href属性值必须用双引号引起，这与字符串本身的双引号冲突，所以要转义			
			StringBuffer contentMsg = new StringBuffer();  
			contentMsg.append("欢迎访问我们~！！").append("\n");  
			textMessage.setContent(contentMsg.toString());
			// 将文本消息对象转换成xml字符串
			respMessage = MessageUtil.textMessageToXml(textMessage);
          	MessageResponseKey map1 = new MessageResponseKey();
          	map1.setUserid(id);
          	map1.setRequesttype("auto");
          	map1.setKeyword("auto");
          	if(null!= messageResponseDao.selectByPrimaryKey(map1)){
          		MessageResponseDto md =  messageResponseDao.selectByPrimaryKey(map1);
          		respMessage= getResponse(md,fromUserName,toUserName);
          	}
          	
          	map1.setRequesttype(msgType);
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {						
				content = requestMap.get("Content");
				map1.setKeyword(content);
	          	MessageResponseDto md =  messageResponseDao.selectByPrimaryKey(map1);
	          	if(null!=md){
	          	System.out.println("-------------c查询返回"+ md.getResponsetype());			
	          	respMessage= getResponse(md,fromUserName,toUserName);
	          	}
				
			}else if(msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)){
				 String eventType = requestMap.get("Event");  
				
	                // 订阅  
	                if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) { 
	                	//读取OpenID 存入数据库
	                	map1.setRequesttype("subscribe");
	                	map1.setKeyword("subscribe");
	    	          	MessageResponseDto md =  messageResponseDao.selectByPrimaryKey(map1);
	    	          	if(null!=md){
	    		          	System.out.println("-------------c查询返回"+ md.getResponsetype());			
	    		          	respMessage= getResponse(md,fromUserName,toUserName);
	    		          	}
	                	return respMessage;
	                }  
	                // 取消订阅  
	                else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {  
	                    // TODO 取消订阅后用户再收不到公众号发送的消息，因此不需要回复消息  
	                }  
	                // 自定义菜单点击事件  
	                else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {  
	                	String result ="";
	                    String eventKey = requestMap.get("EventKey"); 
			          	map1.setKeyword(eventKey);
			          	map1.setRequesttype("click");
	                    MessageResponseDto md =  messageResponseDao.selectByPrimaryKey(map1);
	                    if(null!=md){
	    		          	System.out.println("-------------c查询返回"+ md.getResponsetype());			
	    		          	respMessage= getResponse(md,fromUserName,toUserName);
	    		          	}
	                	return respMessage;
	                    }  	                  
	            	}  														
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respMessage;
	}
//			}	return respMessage;}
	
	public String getResponse(MessageResponseDto mrd,String fromUserName,String toUserName){
		String responseMessage= "";
		if(mrd.getResponsetype().equals("news")){
			
			NewsMessage newsMessage = new NewsMessage();
			newsMessage.setToUserName(fromUserName);
			newsMessage.setFromUserName(toUserName);
			newsMessage.setCreateTime(new Date().getTime());
			newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
			newsMessage.setFuncFlag(0);
			List<Article> articleList = new LinkedList<Article>();
			Article a1 = new Article();
			a1.setTitle(mrd.getTitle());
			System.out.println(mrd.getContent()+"===========content================");
			a1.setDescription(mrd.getContent());
			a1.setPicUrl(mrd.getPicture());
			a1.setUrl(mrd.getLinkurl());
			System.out.println("进入news======================================");
			articleList.add(a1);
			
			newsMessage.setArticles(articleList);
			newsMessage.setArticleCount(articleList.size());
			responseMessage = MessageUtil.newsMessageToXml(newsMessage);
			return responseMessage;
		}else if(mrd.getResponsetype().equals("text")){
			System.out.println("进入text======================================");
			TextMessage textMessage1 = new TextMessage();
			textMessage1.setToUserName(fromUserName);
			textMessage1.setFromUserName(toUserName);
			textMessage1.setCreateTime(new Date().getTime());
			textMessage1.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			textMessage1.setContent(mrd.getContent());
			textMessage1.setFuncFlag(0);
			responseMessage = MessageUtil.textMessageToXml(textMessage1);
			
			return responseMessage;
		}
		return responseMessage;
	}
//	public static void main(String[] args) {
//		MessageResponseDto md= new MessageResponseDto();
//		md.setTitle("title");
//		md.setContent("contnet");
//		md.setKeyword("tuwen");
//		md.setLinkurl("linkurl");
//		md.setPicture("picture");
//		md.setRequesttype("text");
//		md.setResponsetype("news");
//		md.setUserid("lg");
//		ManuService ms = new ManuService();
//		String s=ms.getResponse(md, "fromUserName", "toUserName");
//		System.out.println(s);
//	}
}

