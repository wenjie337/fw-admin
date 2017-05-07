package com.bxj.model.lottery;


public class LotteryVo {

    private Long lotteryId;
    
    private Long activityId;
    
    private Long prizeNumber;
    
    private String userId;
    
    private String nickName;
    /**
     * 物流公司
     */
    private String wayName;
    /**
     * 物流单号
     */
    private String wayBill;
    /**
     * 收件人
     */
    private String consignee;
    /**
     * 收件地址
     */
    private String receiveAddress;
    /**
     * 手机号码 
     */
    private String mobile;
    /**
     * 状态1待确认地址2待发货3待收货4已收货
     */
    private Integer status;
    
    public Long getLotteryId() {
        return lotteryId;
    }
    
    public void setLotteryId(Long lotteryId) {
        this.lotteryId = lotteryId;
    }
    
    public Long getActivityId() {
        return activityId;
    }
    
    public void setActivityId(Long activityId) {
        this.activityId = activityId;
    }
    
    public Long getPrizeNumber() {
        return prizeNumber;
    }
    
    public void setPrizeNumber(Long prizeNumber) {
        this.prizeNumber = prizeNumber;
    }
    
    public String getUserId() {
        return userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    public String getNickName() {
        return nickName;
    }
    
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
    
    public String getWayName() {
        return wayName;
    }
    
    public void setWayName(String wayName) {
        this.wayName = wayName;
    }
    
    public String getWayBill() {
        return wayBill;
    }
    
    public void setWayBill(String wayBill) {
        this.wayBill = wayBill;
    }
    
    public String getConsignee() {
        return consignee;
    }
    
    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }
    
    public String getReceiveAddress() {
        return receiveAddress;
    }
    
    public void setReceiveAddress(String receiveAddress) {
        this.receiveAddress = receiveAddress;
    }
    
    public String getMobile() {
        return mobile;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    
    public Integer getStatus() {
        return status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    
}
