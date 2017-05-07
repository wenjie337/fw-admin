package com.bxj.model.product;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by dukang on 2015/9/10.
 */
public class GoodsInfo implements Serializable {

    private static final long serialVersionUID = -3634150179665972073L;

    private Integer id;
    /**商品id*/
    private Integer goodsId;
    /** 0=banner图  1=图文介绍 */
    private Integer infoType;
    /**图片*/
    private String infoImg;
    /**排序*/
    private Integer infoIndex;
    private Date createTime;
    private Date updateTime;

    private String oldImg;
    
    private Integer imgWidth;
    private Integer imgHeight;

    public String getOldImg() {
        return oldImg;
    }

    public void setOldImg(String oldImg) {
        this.oldImg = oldImg;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getInfoIndex() {
        return infoIndex;
    }

    public void setInfoIndex(Integer infoIndex) {
        this.infoIndex = infoIndex;
    }

    public String getInfoImg() {
        return infoImg;
    }

    public void setInfoImg(String infoImg) {
        this.infoImg = infoImg;
    }

    public Integer getInfoType() {
        return infoType;
    }

    public void setInfoType(Integer infoType) {
        this.infoType = infoType;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

	public Integer getImgWidth() {
		return imgWidth;
	}

	public void setImgWidth(Integer imgWidth) {
		this.imgWidth = imgWidth;
	}

	public Integer getImgHeight() {
		return imgHeight;
	}

	public void setImgHeight(Integer imgHeight) {
		this.imgHeight = imgHeight;
	}
}
