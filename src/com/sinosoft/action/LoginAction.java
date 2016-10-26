package com.sinosoft.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sinosoft.dao.WechatUserDao;
import com.sinosoft.entity.UserDto;
public class LoginAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private HttpServletResponse response;
//	private ILoginDao loginDao;
	private WechatUserDao wechatUserDao;
	
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
	public String login(){
		String username = request.getParameter("username"); 
		String password = request.getParameter("password"); 
		System.out.println(username+"\n"+password);
		//-------------------------------------------
		
		List<UserDto> userList = wechatUserDao.getUser(username);
		if(userList.size()!=0){
		UserDto ud = userList.iterator().next();		
		if(password.equals(ud.getPassword())){
			ActionContext.getContext().getSession().put("currentuser",ud);
			request.setAttribute("result", "success");
			return "success";
		}
		else{
       	request.setAttribute("result", "faild");
//		
//		 response = ServletActionContext.getResponse();
		 
		return "error";
		}
		}else{
			request.setAttribute("result", "undifine");
			return "error";
		}
		
	}
	public String register(){
		String username = request.getParameter("username"); 
		String password = request.getParameter("password"); 
		String publiccount = request.getParameter("publiccount");
		String publicpassword = request.getParameter("publicpassword");
		System.out.println(publicpassword+"------------------------------");
		String appId = request.getParameter("appid");
		String appSecret = request.getParameter("appsecret");

		UserDto ud = new UserDto(username,password,publiccount,publicpassword,appId,appSecret);
		System.out.println(ud.getPublicPassword()+"++++++++++++++++++++++++++++");
		wechatUserDao.insertUser(ud);
//		if(wechatUserDao.insertUser(ud)){
			return "success";
//		}else{
//			return "error";
//		}
	}
	public String usernameCheck(){
		String username = request.getParameter("username");
		List<UserDto> udls=wechatUserDao.getUser(username);
		response = ServletActionContext.getResponse();
		PrintWriter pw;
		try {
			
			pw = response.getWriter();
			System.out.println(udls.toString()+udls.size());
			if(null==udls||udls.size()==0){
				pw.write("exist");
			}else{
				pw.write("noexist");
			}
			pw.flush();
			pw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public String updateUserInfo(){
		
		String username = request.getParameter("username");
		String password = request.getParameter("password"); 
		String newPassword = request.getParameter("password1");
		String publiccount = request.getParameter("publiccount");
		String publicpassword = request.getParameter("publicpassword");	
	
		String appId = request.getParameter("appid");
		String appSecret = request.getParameter("appsecret");
		System.out.println(appSecret+"===============测速=======");
		List<UserDto> userList = wechatUserDao.getUser(username);
		if(userList.size()!=0){
			UserDto ud =(UserDto)wechatUserDao.getUser(username).iterator().next();
			System.out.println(ud.getPassword());
			if(password.equals(ud.getPassword())){
				UserDto newud =new UserDto(username,newPassword,publiccount,publicpassword,appId,appSecret);
				wechatUserDao.updateUserInfo(newud);
				return "login";
			}else{
				System.out.println("password错误");
				return "error";
			}
			}else{
				System.out.println("List为空");
			return "error";
		}
		
	}
	public WechatUserDao getWechatUserDao() {
		return wechatUserDao;
	}
	public void setWechatUserDao(WechatUserDao wechatUserDao) {
		this.wechatUserDao = wechatUserDao;
	}
	public HttpServletResponse getResponse() {
		return response;
	}
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	
}
