package com.bxj.controller;

import com.bxj.service.PushService;
import com.bxj.util.ResultModel;
import nl.justobjects.pushlet.core.Event;
import nl.justobjects.pushlet.core.EventPullSource;
import nl.justobjects.pushlet.core.Session;
import nl.justobjects.pushlet.core.SessionManager;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoaderListener;

import java.io.Serializable;


/**
 * Created by dukang on 2015/10/29.
 */
@Controller
public class PushletController implements Serializable {

     private static final long serialVersionUID = -8132854670280249826L;

     private static PushService pushService;

     public static class Pushlet extends EventPullSource{
        @Override
        protected long getSleepTime() {
            return 1000*60*15;
        }
        
        @SuppressWarnings("static-access")
		@Override
        protected Event pullEvent() {
            Event event =Event.createDataEvent("orderNotice");
            pushService = (PushService)ContextLoaderListener
                    .getCurrentWebApplicationContext().getBean("pushService");

            // 获取当前登陆用户Id(加入事件订阅的用户)
            Session[] sessions = SessionManager.getInstance().getSessions();
            //查询当前用户的任务
            for(int i=0; i<sessions.length; i++){
                int count = new PushletController().pushService.getOrderCountNeedSend(sessions[i].getId());
                event.setField("pushData_"+sessions[i].getId(), count);// 封装参数
            }
            return event;
        }
    }

    @RequestMapping("/getusername")
    @ResponseBody
    public Object getusername(){
        ResultModel.JsonObject jsonObject = ResultModel.genJsonObject(true,100,"");
        Subject user = SecurityUtils.getSubject();
        String username = (String)user.getSession().getAttribute("username");
        jsonObject.addAttr("username", username);
        return jsonObject;
    }


}
