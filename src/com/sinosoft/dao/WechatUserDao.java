package com.sinosoft.dao;

import java.util.List;

import com.sinosoft.entity.UserDto;

public interface WechatUserDao {
	public List<UserDto> getUser(String userid);
	public void insertUser(UserDto ud);
	public int updateUserInfo(UserDto ud);
	
	public List<UserDto> getAllUser();
//	public String updateUser(UserDto us);
}
