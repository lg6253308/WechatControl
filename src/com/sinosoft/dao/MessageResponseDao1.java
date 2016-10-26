package com.sinosoft.dao;

import java.util.List;
import java.util.Map;

import com.sinosoft.entity.MessageResponseDto1;





public interface MessageResponseDao1 {
	//插入
    int insert(MessageResponseDto1 record);
    //查找
    List<MessageResponseDto1> select(Map keyMap);
    //查找
    List<MessageResponseDto1> selectAll(String userid);      //-----------------------------------

    //插入
    int insertSelective(MessageResponseDto1 record);
    //删除
    int delete(Map keyMap);
    //更新
    int update(MessageResponseDto1 record);
}