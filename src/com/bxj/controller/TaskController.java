package com.bxj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bxj.model.task.TaskVo;
import com.bxj.model.task.WebUserVo;
import com.bxj.service.TaskService;
import com.bxj.service.WebUserService;
import com.bxj.util.Config;

@Controller
@RequestMapping("/task")
public class TaskController {

    private static final Logger LOGGER = Logger.getLogger(TaskController.class);

    @Autowired
    private TaskService taskService;

    @Autowired
    private WebUserService webUserService;
    @Autowired
    private Config config;

    /**
     * 查询列表 
     * @param request
     * @param vo
     * @return
     */
    @RequestMapping("/getTaskList.htm")
    public String taskList(HttpServletRequest request, TaskVo vo) {
        try {
            List<TaskVo> taskList = taskService.queryList(vo);
            request.setAttribute("list", taskList);

        } catch (Exception e) {
            LOGGER.error(e);
            e.printStackTrace();
        }
        return "/task/task_list";
    }

    /**
     * 新增任务表单
     * @param request
     * @param vo
     * @return
     */
    @RequestMapping("/addTaskForm")
    public String addTaskForm(HttpServletRequest request, TaskVo vo) {
        WebUserVo userVo = new WebUserVo();
        userVo.setSource(1);
        userVo.setStatus(0);
        request.setAttribute("userList", webUserService.queryList(userVo));
        return "/task/task_add";
    }

    /**
     * 新增任务
     * @param request
     * @param vo
     * @return
     */
    @RequestMapping("/addTask")
    public String addTask(HttpServletRequest request, TaskVo vo) {
        try {
            taskService.addTask(vo);

        } catch (Exception e) {
            LOGGER.error(e);
            e.printStackTrace();
        }
        return "redirect:/task/getTaskList.htm";
    }

    /**
     * 新增任务
     * @param request
     * @param vo
     * @return
     */
    @RequestMapping("/startTask")
    public String startTask(HttpServletRequest request, TaskVo vo) {
        try {
            taskService.startTask(vo);

        } catch (Exception e) {
            LOGGER.error(e);
            e.printStackTrace();
        }
        return "redirect:/task/getTaskList.htm";
    }

    /**
     * 查询产品详情
     * @param request
     * @param vo
     * @return
     */
    @RequestMapping("/queryTask")
    public String queryTask(HttpServletRequest request, TaskVo vo) {
        try {
            TaskVo taskVo = taskService.queryTask(vo.getTaskId());
            request.setAttribute("taskVo", taskVo);
            request.setAttribute("configUrl", config.getBaseUrl());
        } catch (Exception e) {
            LOGGER.error(e);
            e.printStackTrace();
        }
        return "/task/task_update";
    }

    /**
     * 更新产品
     * @param request
     * @param vo
     * @return
     */
    @RequestMapping("/updateTask")
    public String updateTask(HttpServletRequest request, TaskVo vo) {
        try {
            taskService.updateTask(vo);

        } catch (Exception e) {
            LOGGER.error(e);
            e.printStackTrace();
        }
        return "redirect:/getTaskList.htm";
    }

    /**
     * 删除产品
     * @param request
     * @param
     * @return
     */
    @RequestMapping("/delTask")
    public void delTask(HttpServletRequest request, HttpServletResponse response, String ids) {
        try {
            taskService.delTask(ids);
            response.getWriter().write("1");
            response.getWriter().flush();
        } catch (Exception e) {
            LOGGER.error(e);
            e.printStackTrace();
        }
    }

}
