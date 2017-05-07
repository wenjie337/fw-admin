package com.bxj.manager;

import nl.justobjects.pushlet.core.Event;
import nl.justobjects.pushlet.core.Session;
import nl.justobjects.pushlet.core.SessionManager;
import nl.justobjects.pushlet.util.PushletException;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

/**
 * Created by dukang on 2015/11/6.
 */
public class PushSessionManager extends SessionManager {

    @Override
    public Session createSession(Event anEvent) throws PushletException {
        getSessionName();
        return Session.create(anEvent.getField("userId", "visitor"));
    }

    @Override
    public Session removeSession(Session aSession) {
        return super.removeSession(aSession);
    }

    public static String getSessionName(){
        Subject user = SecurityUtils.getSubject();
        String username = (String)user.getSession().getAttribute("username");
        return username;
    }
}
