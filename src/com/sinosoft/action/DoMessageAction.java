package com.sinosoft.action;

import java.io.File;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sinosoft.common.FansTask;
import com.sinosoft.dao.MessageResponseDao;
import com.sinosoft.entity.MessageResponseDto;
import com.sinosoft.entity.MessageResponseKey;
import com.sinosoft.entity.UserDto;
import com.sinosoft.util.Configuration;
import com.sinosoft.util.ImageUp;

public class DoMessageAction extends ActionSupport implements
		ServletRequestAware {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private MessageResponseDao messageResponseDao;
	private String keyword;
	private String requestType;
	private String title;
	private String content;
	private String picUrl;
	private String linkUrl;
	private String responseType;
	private File upfile;
	private File uploadImage;

	public String addMessage() {
		System.out.println("你进入了该方法");
		if (responseType.equals("text")) {
			System.out.println("text======================================");
			return addTextMessage();
		} else if (responseType.equals("news")) {
			System.out.println("你进入了该方法news===========================");
			return addNewsMessage();
		} else {
			return "error";
		}

	}

	public String addTextMessage() {
		if (null == request.getSession().getAttribute("currentuser")
				|| request.getSession().isNew()) {
			// 没有登录
			return "login";
		} else {
			UserDto ud = (UserDto) request.getSession().getAttribute(
					"currentuser");
			System.out.println(content + "=====================");
			System.out.println(requestType + "----------req----------");
			MessageResponseDto md = new MessageResponseDto(ud.getUserid(),
					keyword, "text", requestType, title, content, "", "");
			// Map key = new HashMap();
			// key.put("userid", md.getUserid());
			// key.put("keyword", md.getKeyword());
			// key.put("requestType", md.getRequesttype());
			System.out.println(md.getTitle() + "----------title----------");
			MessageResponseKey key = new MessageResponseKey();
			key.setUserid(md.getUserid());
			key.setKeyword(md.getKeyword());
			key.setRequesttype(requestType);
			System.out.println("=====  =======" + key.getRequesttype()
					+ "=  =======" + md.getContent());
			if (null == messageResponseDao.selectByPrimaryKey(key)) {
				int i = messageResponseDao.insert(md);
				System.out.println("-------------插入返回" + i);
			} else {
				int i = messageResponseDao.updateByPrimaryKey(md);
				System.out.println("-------------更新返回" + i);
			}
			System.out.println(md.getRequesttype() + md.getKeyword()
					+ md.getUserid() + "============================");
			if ("subscribe".equals(md.getRequesttype())) {
				return "subscribe";
			} else if ("auto".equals(md.getRequesttype())) {
				return "auto";
			} else {
				return "success";
			}
		}
	}

	public String addNewsMessage() {
		System.out.print("进入action");
		if (null == request.getSession().getAttribute("currentuser")
				|| request.getSession().isNew()) {
			// 没有登录
			System.out.print("没有登录");
			return "login";
		} else {

			// 设定
			System.out.print("没有登录,为空取值");
			UserDto ud = (UserDto) request.getSession().getAttribute(
					"currentuser");
			// keyword = request.getParameter("keyword");
			System.out.println("FilePath : LINKURL=================" + linkUrl);
			MessageResponseDto md = new MessageResponseDto(ud.getUserid(),
					keyword, "news", requestType, title, content, picUrl,
					linkUrl);
			System.out.println(md.getRequesttype() + md.getKeyword()
					+ md.getUserid());

			String targetDirectory = ServletActionContext.getServletContext()
					.getRealPath("/");
			targetDirectory = targetDirectory + "/image";
			String upfileFileName = ud.getUserid() + keyword + ".jpg";
			File savefile = new File(targetDirectory, upfileFileName);
			System.out.println("FilePath : " + savefile.getAbsolutePath());
			try {
				FileUtils.copyFile(uploadImage, savefile);
				ActionContext.getContext().put("message", "文件上传成功");
			} catch (Exception e) {
				e.printStackTrace();
				ActionContext.getContext().put("message",
						"文件上传失败：" + e.getMessage());
			}

			String path = FansTask.class.getResource("/").toString();
			path = path.replace("file:/", "").replace("classes/",
					"configs/sqlServer.properties");
			Configuration configer = new Configuration(path);
			picUrl = configer.getValue("fansPicUrl");
			md.setPicture(picUrl + upfileFileName);
			System.out.println("=============picurl==============="
					+ md.getPicture());
			MessageResponseKey key = new MessageResponseKey();
			key.setUserid(md.getUserid());
			key.setKeyword(md.getKeyword());
			key.setRequesttype(md.getRequesttype());

			if (null == messageResponseDao.selectByPrimaryKey(key)) {
				int i = messageResponseDao.insert(md);
				System.out.println("-------------插入返回" + i);
			} else {
				int i = messageResponseDao.updateByPrimaryKey(md);
				System.out.println("-------------更新返回" + i);
			}
			if ("subscribe".equals(md.getRequesttype())) {
				return "subscribe";
			} else if ("auto".equals(md.getRequesttype())) {
				return "auto";
			} else {
				return "success";
			}
		}
	}

	// public String addSubscribeMessage(){
	//		
	//		
	// return "";
	// }

	public String updateMessage() {
		System.out.print("进入up action");
		if (null == request.getSession().getAttribute("currentuser")
				|| request.getSession().isNew()) {
			// 没有登录
			System.out.print("没有登录");
			return "login";
		} else {

			// 设定
			System.out.print("没有登录,为空取值");
			UserDto ud = (UserDto) request.getSession().getAttribute(
					"currentuser");
			// keyword = request.getParameter("keyword");
			MessageResponseDto md = new MessageResponseDto(ud.getUserid(),
					keyword, responseType, requestType, title, content, picUrl,
					linkUrl);
			System.out.println(md.getRequesttype() + md.getKeyword()
					+ md.getUserid());
			if (null != uploadImage) {
				String targetDirectory = ServletActionContext
						.getServletContext().getRealPath("/");
				targetDirectory = targetDirectory + "/image";
				String upfileFileName = ud.getUserid() + keyword + ".jpg";
				File savefile = new File(targetDirectory, upfileFileName);
				try {
					FileUtils.copyFile(uploadImage, savefile);
					ActionContext.getContext().put("message", "文件上传成功");
				} catch (Exception e) {
					e.printStackTrace();
					ActionContext.getContext().put("message",
							"文件上传失败：" + e.getMessage());
				}
				String path = DoMessageAction.class.getResource("/").toString();
				path = path.replace("file:/", "").replace("classes/",
						"configs/sqlServer.properties");
				Configuration configer = new Configuration(path);
				String proPicUrl = configer.getValue("fansPicUrl");
				picUrl = proPicUrl;
				System.out.println(proPicUrl
						+ "===============proPicUrl=============");
				md.setPicture(picUrl + upfileFileName);
			}
			MessageResponseKey key = new MessageResponseKey();
			key.setUserid(md.getUserid());
			key.setKeyword(md.getKeyword());
			key.setRequesttype(md.getRequesttype());

			System.out.println("=====  =======" + key.getRequesttype()
					+ "=  =======" + md.getContent());
			if (null == messageResponseDao.selectByPrimaryKey(key)) {
				int i = messageResponseDao.insert(md);
				System.out.println("-------------插入返回" + i);
			} else {
				int i = messageResponseDao.updateByPrimaryKey(md);
				System.out.println("-------------更新返回" + i);
			}
			System.out.println("=============request type=================="
					+ md.getRequesttype());
			if ("subscribe".equals(md.getRequesttype())) {
				return "subscribe";
			} else if ("auto".equals(md.getRequesttype())) {
				return "auto";
			} else {
				return "success";
			}
		}
	}

	public String deleMessage() {
		// 删除回复
		if (null == request.getSession().getAttribute("currentuser")
				|| request.getSession().isNew()) {
			// 没有登录
			System.out.print("没有登录");
			return "login";
		} else {

			// 设定
			System.out.print("没有登录,为空取值");
			UserDto ud = (UserDto) request.getSession().getAttribute(
					"currentuser");
			MessageResponseKey key = new MessageResponseKey(ud.getUserid(),
					keyword, requestType);
			messageResponseDao.deleteByPrimaryKey(key);
			return "success";
		}
	}

	public String showMessage() {
		System.out.print("进入action");
		if (null == request.getSession().getAttribute("currentuser")
				|| request.getSession().isNew()) {
			// 没有登录
			System.out.print("没有登录");

			return "login";
		} else {

			// 设定
			System.out.print("没有登录,为空取值");
			UserDto ud = (UserDto) request.getSession().getAttribute(
					"currentuser");
			System.out.println("===============userid=============="
					+ ud.getUserid());
			// keyword = request.getParameter("keyword");
			List<MessageResponseDto> messageList = messageResponseDao
					.selectAll(ud.getUserid());
			System.out.println(messageList);
			for (int i = 0; i < messageList.size(); i++) {
				System.out.println(messageList.get(i).getKeyword());
			}

			System.out.println("==============cool========");
			request.setAttribute("messageList", messageList);
			return "success";
		}
	}

	public String getAutoMsg() {
		if (null == request.getSession().getAttribute("currentuser")) {
			// 没有登录
			System.out.print("没有登录");
			System.out.println(request.getSession().getAttribute("currentuser"));
			return "login";
		} else {
			UserDto ud = (UserDto) request.getSession().getAttribute(
					"currentuser");
			MessageResponseKey mrk = new MessageResponseKey(ud.getUserid(),
					"auto", "auto");
			MessageResponseDto autoMsg = messageResponseDao
					.selectByPrimaryKey(mrk);
			if (null == autoMsg) {
				autoMsg = new MessageResponseDto();
				autoMsg.setUserid(ud.getUserid());
				autoMsg.setKeyword("auto");
				autoMsg.setRequesttype("auto");
				autoMsg.setContent("");
				autoMsg.setResponsetype("");
				autoMsg.setTitle("");
				autoMsg.setPicture("");
				autoMsg.setLinkurl("");
			} else {
				System.out.println(autoMsg.getTitle()
						+ "===============title======================");
			}
			request.setAttribute("autoMsg", autoMsg);
			return "success";
		}
	}

	public String getSubscribeMsg() {
		if (null == request.getSession().getAttribute("currentuser")
				|| request.getSession().isNew()) {
			// 没有登录
			System.out.print("没有登录");

			return "login";
		} else {
			System.out.println("走进新时代");
			UserDto ud = (UserDto) request.getSession().getAttribute(
					"currentuser");
			MessageResponseKey mrk = new MessageResponseKey(ud.getUserid(),
					"subscribe", "subscribe");
			MessageResponseDto SubscribeMsg = messageResponseDao
					.selectByPrimaryKey(mrk);
			if (null == SubscribeMsg) {
				SubscribeMsg = new MessageResponseDto();
				SubscribeMsg.setUserid(ud.getUserid());
				SubscribeMsg.setKeyword("subscribe");
				SubscribeMsg.setRequesttype("subscribe");
				SubscribeMsg.setContent("");
				SubscribeMsg.setResponsetype("");
				SubscribeMsg.setTitle("");
				SubscribeMsg.setPicture("");
				SubscribeMsg.setLinkurl("");
			}

			request.setAttribute("SubscribeMsg", SubscribeMsg);

			System.out.println(SubscribeMsg.getContent()
					+ "=============content============"
					+ SubscribeMsg.getResponsetype());
			return "success";
		}
	}
	
	public void setServletRequest(HttpServletRequest request) {
		System.out.println("==============setRequest===============");
		this.request = request;
		System.out.println("==============setRequestOOO===============");
	}

	public MessageResponseDao getMessageResponseDao() {
		return messageResponseDao;
	}

	public void setMessageResponseDao(MessageResponseDao messageResponseDao) {
		this.messageResponseDao = messageResponseDao;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getRequestType() {
		return requestType;
	}

	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getLinkUrl() {
		return linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	public String getResponseType() {
		return responseType;
	}

	public void setResponseType(String responseType) {
		this.responseType = responseType;
	}

	public File getUpfile() {
		return upfile;
	}

	public void setUpfile(File upfile) {
		this.upfile = upfile;
	}

	public File getUploadImage() {
		return uploadImage;
	}

	public void setUploadImage(File uploadImage) {
		this.uploadImage = uploadImage;
	}

}
