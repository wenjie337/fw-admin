package com.bxj.model.task;

/**
 * 
 * The class TaskVo.
 *
 * Description:任务
 *
 * @author: yaojiewen
 * @since: 2017年4月27日
 * @version: $Revision$ $Date$ $LastChangedBy$
 *
 */
public class TaskVo {

    private Long taskId;

    private String taskName;
    //1 ：58，2：赶集3百姓
    private Integer source;

    private String createTime;

    private String lastUpdateTime;

    private String sendUrl;

    private Integer status;
    private String xiaoqu;

    private String huxingshi;
    private String huxingting;
    private String huxingwei;
    private String area;
    private String floor;
    private String zonglouceng;
    private String minPrice;
    private String fukuanfangshi;
    private String title;
    private String roomDesc;
    private String roomImg;
    private String goblianxiren;
    private String phone;
    private String userIds;

    public Long getTaskId() {
        return taskId;
    }

    public void setTaskId(Long taskId) {
        this.taskId = taskId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public Integer getSource() {
        return source;
    }

    public void setSource(Integer source) {
        this.source = source;
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

    public String getSendUrl() {
        return sendUrl;
    }

    public void setSendUrl(String sendUrl) {
        this.sendUrl = sendUrl;
    }

    public String getXiaoqu() {
        return xiaoqu;
    }

    public void setXiaoqu(String xiaoqu) {
        this.xiaoqu = xiaoqu;
    }

    public String getHuxingshi() {
        return huxingshi;
    }

    public void setHuxingshi(String huxingshi) {
        this.huxingshi = huxingshi;
    }

    public String getHuxingting() {
        return huxingting;
    }

    public void setHuxingting(String huxingting) {
        this.huxingting = huxingting;
    }

    public String getHuxingwei() {
        return huxingwei;
    }

    public void setHuxingwei(String huxingwei) {
        this.huxingwei = huxingwei;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public String getZonglouceng() {
        return zonglouceng;
    }

    public void setZonglouceng(String zonglouceng) {
        this.zonglouceng = zonglouceng;
    }

    public String getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(String minPrice) {
        this.minPrice = minPrice;
    }

    public String getFukuanfangshi() {
        return fukuanfangshi;
    }

    public void setFukuanfangshi(String fukuanfangshi) {
        this.fukuanfangshi = fukuanfangshi;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRoomImg() {
        return roomImg;
    }

    public void setRoomImg(String roomImg) {
        this.roomImg = roomImg;
    }

    public String getGoblianxiren() {
        return goblianxiren;
    }

    public void setGoblianxiren(String goblianxiren) {
        this.goblianxiren = goblianxiren;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRoomDesc() {
        return roomDesc;
    }

    public void setRoomDesc(String roomDesc) {
        this.roomDesc = roomDesc;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getUserIds() {
        return userIds;
    }

    public void setUserIds(String userIds) {
        this.userIds = userIds;
    }

}
