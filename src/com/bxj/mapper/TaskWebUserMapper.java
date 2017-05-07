package com.bxj.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.bxj.model.task.TaskWebUserVo;

public interface TaskWebUserMapper {

    /**
     * 查询列表
     * @param map
     * @return
     */
    public List<TaskWebUserVo> queryList(Long taskId);

    /**
     * 新增
     * @param taskVo
     */
    public void add(@Param("ids") String[] ids, @Param("taskId") Long taskId);

    /**
     * 更新
     * @param taskVo
     */
    public void update(TaskWebUserVo vo);
    
    
    public Map<String,Object> queryExecutNum(Long taskId);

}
