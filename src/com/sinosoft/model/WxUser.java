package com.sinosoft.model;

public class WxUser {
	//---图片数组-------------------------------------------
	private byte[] imageByte;
	//---详细信息-------------------------------------------
	
	private String address;
	private String groupList;
	private String remark_name;
	private String gender;                   //男1  女2
	private String signature;
//--------用户信息-----------------------------------------------------	
	private String fakeId;
	private String nickName;
	private String token;
	private String src;
	private String groupId;
	private String remarkName;
	public String getRemarkName() {
		return remarkName;
	}
	public void setRemarkName(String remarkNameString) {
		this.remarkName = remarkNameString;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupIdString) {
		this.groupId = groupIdString;
	}
	public String getFakeId() {
		return fakeId;
	}
	public void setFakeId(String fakeId) {
		this.fakeId = fakeId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRemark_name() {
		return remark_name;
	}
	public void setRemark_name(String remark_name) {
		this.remark_name = remark_name;
	}

	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getGroupList() {
		return groupList;
	}
	public void setGroupList(String groupList) {
		this.groupList = groupList;
	}
	public byte[] getImageByte() {
		return imageByte;
	}
	public void setImageByte(byte[] imageByte) {
		this.imageByte = imageByte;
	}
}
