package com.sinosoft.entity;

public class MessageResponseKey11 {
	private String userid ;
	private String keyword ;
	private String requestType;
	public MessageResponseKey11(){}
	public MessageResponseKey11(String userid,String keyword,String requestType){
		this.userid = userid;
		this.keyword = keyword;
		this.requestType = requestType;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	 
}
