package com.bxj.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.AsyncTaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bxj.mapper.TaskMapper;
import com.bxj.mapper.TaskWebUserMapper;
import com.bxj.mapper.WebUserMapper;
import com.bxj.model.task.TaskVo;
import com.bxj.model.task.TaskWebUserVo;
import com.bxj.model.task.WebUserVo;

@Service
public class TaskService {

    @Autowired
    private TaskExecutorService taskExecutorService;
    @Autowired
    private TaskMapper taskMapper;
    @Autowired
    private TaskWebUserMapper taskWebUserMapper;
    @Autowired
    private WebUserMapper webUserMapper;
 
    @Resource(name = "requestAsyncExecutorSvc")
    private AsyncTaskExecutor executor;

    /**
     * 查询列表
     * @param
     * @return
     */
    public List<TaskVo> queryList(TaskVo taskVo) {
        return taskMapper.queryList(taskVo);
    }

    /**
     * 新增
     * @param taskVo
     */
    @Transactional
    public void addTask(TaskVo taskVo) {
        taskMapper.addTask(taskVo);
        taskWebUserMapper.add(taskVo.getUserIds().split(","), taskVo.getTaskId());
    }

    /**
     * 开始执行任务
     * @param taskVo
     */
    public void startTask(final TaskVo taskVo) {
        final TaskVo vo = queryTask(taskVo.getTaskId());
        if(vo == null){
            return;
        }
        if(vo.getStatus() == 1){
            System.out.println("任务正在进行中。。。");
            return;
        }
        List<TaskWebUserVo> userList = taskWebUserMapper.queryList(taskVo.getTaskId());
        if (userList == null) {
            return;
        }
        //将任务状态修改为进行中
        taskVo.setStatus(1);
        taskMapper.updateTask(taskVo);
        for (final TaskWebUserVo userVo : userList) {
            executor.execute(new Runnable() {

                @Override
                public void run() {
                    // TODO
                    try {
                        taskExecutorService.start(vo, userVo);
                        //将任务用户置为已发布
                        userVo.setStatus(1);
                        taskWebUserMapper.update(userVo);
                        
                        //将用户表中用户状态设置为已发布
                        WebUserVo wvo = new WebUserVo();
                        wvo.setUserId(userVo.getUserId());
                        wvo.setStatus(1);
                        webUserMapper.updateWebUser(wvo);
                    }catch (Exception e){
                        e.printStackTrace();
                    }
                }
            });

        }
        //发完贴后，将任务状态修改为已完成
//        taskVo.setStatus(2);
//        taskMapper.updateTask(taskVo);

    }

    /**
     * 更新
     * @param taskVo
     */
    public void updateTask(TaskVo taskVo) {
        taskMapper.updateTask(taskVo);
    }

    public TaskVo queryTask(Long taskId) {
        return taskMapper.queryTask(taskId);
    }

    public void delTask(String ids) {
        taskMapper.delTask(ids.split(","));
    }

}
