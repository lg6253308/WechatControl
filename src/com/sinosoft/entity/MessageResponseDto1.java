package com.sinosoft.entity;

public class MessageResponseDto1 {

    private String userid;
    private String keyword;
    private String responsetype;
    private String requesttype;
    private String title;
    private String content;
    private String picture;
    private String linkurl;
    
    public MessageResponseDto1(){
    	
    }
    
	public MessageResponseDto1(String userid,String keyword,
		String responsetype,String requesttype,String title,String content,String picture,String linkurl){
    	this.userid = userid;
    	this.keyword = keyword;
    	this.requesttype = requesttype;
    	this.responsetype = responsetype;
    	this.title = title;
    	this.content = content;
    	this.picture = picture;
    	this.linkurl = linkurl;
    	
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
    public String getResponsetype() {
        return responsetype;
    }

    public void setResponsetype(String responsetype) {
        this.responsetype = responsetype;
    }

    public String getRequesttype() {
        return requesttype;
    }

    public void setRequesttype(String requesttype) {
        this.requesttype = requesttype;
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


    public String getPicture() {
        return picture;
    }


    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getLinkurl() {
        return linkurl;
    }

    public void setLinkurl(String linkurl) {
        this.linkurl = linkurl;
    }
}