package com.bxj.mapper;

import java.util.List;

import com.bxj.model.task.WebUserVo;

public interface WebUserMapper {

    /**
     * 查询列表
     * @param map
     * @return
     */
    public List<WebUserVo> queryList(WebUserVo vo);

    /**
     * 新增
     * @param taskVo
     */
    public void addWebUser(WebUserVo webVo);

    /**
     * 更新
     * @param taskVo
     */
    public void updateWebTask(WebUserVo vo);

}
