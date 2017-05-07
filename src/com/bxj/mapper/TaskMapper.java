package com.bxj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bxj.model.task.TaskVo;

public interface TaskMapper {

    /**
     * 查询列表
     * @param map
     * @return
     */
    public List<TaskVo> queryList(TaskVo taskVo);

    /**
     * 新增
     * @param taskVo
     */
    public void addTask(TaskVo taskVo);

    /**
     * 更新
     * @param taskVo
     */
    public void updateTask(TaskVo taskVo);

    public TaskVo queryTask(@Param("taskId") Long taskId);

    public void delTask(String[] ids);

    public List<TaskVo> queryListByStatus(int status);
}
