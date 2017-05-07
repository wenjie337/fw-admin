package com.bxj.model.activity;

public class ActivityVo {
	/**
	 * 活动ID
	 */
	private Long activityId;
	/**
	 * 产品名称
	 */
	private String productName;
	/**
	 * 所需人次
	 */
	private Long peopleCount;
	
	/**
	 * 产品ID
	 */
	private Long productId;
	/**
	 * 期数编码
	 */
	private String activityCode;
	/**
	 * 活动创建时间
	 */
	private String createTime;
	/**
	 * 活动开始时间
	 */
	private String startTime;
	/**
	 * 结束时间
	 */
	private String endTime;
	/**
	 * 抽奖时间
	 */
	private String lotteryTime;
	/**
	 * 抽奖编码
	 */
	private Long lotteryCode;
	/**
	 * 活动状态0未开始1进行中2待抽奖3结束
	 */
	private int status =-1;
	/**
	 * 中奖状态1获取商品2确认地址3商品发货4确认收货
	 */
	private int lotteryStatus;
	
	
	
    public int getLotteryStatus() {
        return lotteryStatus;
    }
    
    public void setLotteryStatus(int lotteryStatus) {
        this.lotteryStatus = lotteryStatus;
    }
    public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public Long getLotteryCode() {
		return lotteryCode;
	}
	public void setLotteryCode(Long lotteryCode) {
		this.lotteryCode = lotteryCode;
	}
	public Long getActivityId() {
		return activityId;
	}
	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Long getPeopleCount() {
		return peopleCount;
	}
	public void setPeopleCount(Long peopleCount) {
		this.peopleCount = peopleCount;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	public String getActivityCode() {
		return activityCode;
	}
	public void setActivityCode(String activityCode) {
		this.activityCode = activityCode;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getLotteryTime() {
		return lotteryTime;
	}
	public void setLotteryTime(String lotteryTime) {
		this.lotteryTime = lotteryTime;
	}
	
	
	
	
}
