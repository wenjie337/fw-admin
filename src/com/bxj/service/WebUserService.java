package com.bxj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxj.mapper.WebUserMapper;
import com.bxj.model.task.WebUserVo;

@Service
public class WebUserService {

    @Autowired
    private WebUserMapper webUserMapper;

    /**
     * 查询列表
     * @param map
     * @return
     */
    public List<WebUserVo> queryList(WebUserVo vo) {
        return webUserMapper.queryList(vo);
    }

    /**
     * 新增
     * @param taskVo
     */
    public void addWebUser(WebUserVo webVo) {
        webUserMapper.addWebUser(webVo);
    }

    /**
     * 更新
     * @param taskVo
     */
    public void updateWebUser(WebUserVo vo) {
        webUserMapper.updateWebUser(vo);
    }

}
