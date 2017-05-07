package com.bxj.job;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.bxj.mapper.TaskMapper;
import com.bxj.mapper.TaskWebUserMapper;
import com.bxj.model.task.TaskVo;

@Service
public class MyJob {
    @Autowired
    private TaskWebUserMapper taskWebUserMapper;
    @Autowired
    private TaskMapper taskMapper;
    
    @Scheduled(cron = "0/5 * * * * ?")
    public void updateTaskStatus(){
        
        List<TaskVo> taskList = taskMapper.queryListByStatus(1);
        if(taskList == null || taskList.size() == 0){
            return;
        }
        for(TaskVo vo : taskList){
            Map<String,Object> map = taskWebUserMapper.queryExecutNum(vo.getTaskId());
            if(map.get("userCount").equals(map.get("taskCount"))){
                vo.setStatus(2);
                taskMapper.updateTask(vo);
            }
        }
    }
}
