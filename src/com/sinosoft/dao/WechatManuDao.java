package com.sinosoft.dao;

import java.util.List;

import com.sinosoft.entity.ManuDto;
import com.sinosoft.entity.UserDto;
import com.sinosoft.entity.WechatManuKey;

public interface WechatManuDao {
   
    int deleteByPrimaryKey(WechatManuKey key);

    int insert(ManuDto record);

   
    int insertSelective(ManuDto record);

   
    ManuDto selectByPrimaryKey(WechatManuKey key);
    
    List<ManuDto> selectByUserId(String userid);
   
    int updateByPrimaryKeySelective(ManuDto record);
    
    
    int updateByPrimaryKey(ManuDto record);
}