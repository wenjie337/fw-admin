package com.bxj.model.product;

import java.io.Serializable;

import com.bxj.model.Page;

public class ProductVo extends Page implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * ID
	 */
	private Long productId;
	/**
	 *产品名称
	 */
	private String productName;
	/**
	 * 产品描述 
	 */
	private String productDesc;
	
	/**
	 * 产品图标
	 */
	private String productImg;
	/**
	 * 单价：分
	 */
	private Long price;
	/**
	 * 总需人次
	 */
	private Long peopleCount;
	/**
	 * 状态0上架1下架
	 */
	private Integer status;
	
	private String createTime;
	
	
	
	private String lastUpdateTime;
	
	/**
	 * banner图片
	 */
	private String bannerImg;
	/**
	 * 产品详情图片
	 */
	private String detailImg;
	
	private String [] bannerImgs;
	
	private String [] detaileImgs;
	/**
	 * 是否有正在进行中的活动
	 */
	private int isActivity;
	
	
	
	public int getIsActivity() {
		return isActivity;
	}
	public void setIsActivity(int isActivity) {
		this.isActivity = isActivity;
	}
	public String[] getBannerImgs() {
		if(bannerImg != null && !"".equals(bannerImg)){
			return bannerImg.split(",");
		}
		return bannerImgs;
	}
	public void setBannerImgs(String[] bannerImgs) {
		this.bannerImgs = bannerImgs;
	}
	public String[] getDetaileImgs() {
		if(detailImg != null && !"".equals(detailImg)){
			return detailImg.split(",");
		}
		return detaileImgs;
	}
	public void setDetaileImgs(String[] detaileImgs) {
		this.detaileImgs = detaileImgs;
	}
	public String getBannerImg() {
		return bannerImg;
	}
	public void setBannerImg(String bannerImg) {
		this.bannerImg = bannerImg;
	}
	public String getDetailImg() {
		return detailImg;
	}
	public void setDetailImg(String detailImg) {
		this.detailImg = detailImg;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(String lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Long getPeopleCount() {
		return peopleCount;
	}
	public void setPeopleCount(Long peopleCount) {
		this.peopleCount = peopleCount;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Long getProductId() {
		return productId;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	
	
}
