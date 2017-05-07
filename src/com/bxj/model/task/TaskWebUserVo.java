package com.bxj.model.task;

public class TaskWebUserVo {

    private Long taskWebUserId;

    private Long taskId;

    private Long userId;
    //0未执行1已执行
    private Integer status;

    private String userName;

    private String pwd;

    public Long getTaskId() {
        return taskId;
    }

    public void setTaskId(Long taskId) {
        this.taskId = taskId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getTaskWebUserId() {
        return taskWebUserId;
    }

    public void setTaskWebUserId(Long taskWebUserId) {
        this.taskWebUserId = taskWebUserId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

}
