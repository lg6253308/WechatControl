package com.sinosoft.dao;

import java.util.List;

import com.sinosoft.entity.MessageResponseDto;

import com.sinosoft.entity.MessageResponseKey;


public interface MessageResponseDao {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wechat_messageresponse
     *
     * @mbggenerated Wed Dec 25 10:07:19 CST 2013
     */
    int deleteByPrimaryKey(MessageResponseKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wechat_messageresponse
     *
     * @mbggenerated Wed Dec 25 10:07:19 CST 2013
     */
    int insert(MessageResponseDto record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wechat_messageresponse
     *
     * @mbggenerated Wed Dec 25 10:07:19 CST 2013
     */
    int insertSelective(MessageResponseDto record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wechat_messageresponse
     *
     * @mbggenerated Wed Dec 25 10:07:19 CST 2013
     */
    MessageResponseDto selectByPrimaryKey(MessageResponseKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wechat_messageresponse
     *
     * @mbggenerated Wed Dec 25 10:07:19 CST 2013
     */
    int updateByPrimaryKeySelective(MessageResponseDto record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table wechat_messageresponse
     *
     * @mbggenerated Wed Dec 25 10:07:19 CST 2013
     */
    int updateByPrimaryKey(MessageResponseDto record);
    //获取列表
    List<MessageResponseDto> selectAll(String userid);
    List<MessageResponseDto> selectManuAll(String userid);
}