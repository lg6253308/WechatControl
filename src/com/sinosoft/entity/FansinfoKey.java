package com.sinosoft.entity;

public class FansinfoKey {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wechat_fansinfo.USERID
     *
     * @mbggenerated Mon Dec 09 10:57:04 CST 2013
     */
    private String userid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column wechat_fansinfo.FAKEID
     *
     * @mbggenerated Mon Dec 09 10:57:04 CST 2013
     */
    private String fakeid;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wechat_fansinfo.USERID
     *
     * @return the value of wechat_fansinfo.USERID
     *
     * @mbggenerated Mon Dec 09 10:57:04 CST 2013
     */
    public String getUserid() {
        return userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wechat_fansinfo.USERID
     *
     * @param userid the value for wechat_fansinfo.USERID
     *
     * @mbggenerated Mon Dec 09 10:57:04 CST 2013
     */
    public void setUserid(String userid) {
        this.userid = userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column wechat_fansinfo.FAKEID
     *
     * @return the value of wechat_fansinfo.FAKEID
     *
     * @mbggenerated Mon Dec 09 10:57:04 CST 2013
     */
    public String getFakeid() {
        return fakeid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column wechat_fansinfo.FAKEID
     *
     * @param fakeid the value for wechat_fansinfo.FAKEID
     *
     * @mbggenerated Mon Dec 09 10:57:04 CST 2013
     */
    public void setFakeid(String fakeid) {
        this.fakeid = fakeid;
    }
    public FansinfoKey(){
    	
    }
public FansinfoKey(String userid,String fakeid){
    	this.fakeid=fakeid;
    	this.userid=userid;
    	
    }
}