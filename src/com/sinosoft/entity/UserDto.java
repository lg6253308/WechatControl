package com.sinosoft.entity;

/* 
 * Entity
   Table(name = "WECHAT_USER")
 * */


public class UserDto implements java.io.Serializable{
		
	private String userid;
	private String password;
	private String publicCount;
	private String publicPassword;
	private String appId;
	private String appSecret;

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPublicCount() {
		return publicCount;
	}
	public void setPublicCount(String publicCount) {
		this.publicCount = publicCount;
	}
	public String getPublicPassword() {
		return publicPassword;
	}
	public void setPublicPassword(String publicPassword) {
		this.publicPassword = publicPassword;
	}
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getAppSecret() {
		return appSecret;
	}
	public void setAppSecret(String appSecret) {
		this.appSecret = appSecret;
	}
	//必须有无参构造
	public UserDto() {
	}
	
	public UserDto(String userid,String password,String publicCount,String publicPassword,String appId,String appdecret){
		this.userid = userid;
		this.password = password;
		this.publicCount = publicCount;
		this.publicPassword = publicPassword;
		this.appId= appId;
		this.appSecret = appdecret;
	}
	
}
