package com.bxj.shiro.security.realm;


import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.bxj.model.SysUser;
import com.bxj.shiro.security.dao.UserDAO;


public class UserRealm extends AuthorizingRealm {
    //private static Logger logger = Logger.getLogger(UserRealm.class);

    private UserDAO userDAO;

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String) principals.getPrimaryPrincipal();

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setRoles(userDAO.getUserRoles(username));
        authorizationInfo.setStringPermissions(userDAO.findPermissionRoles(username));

        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

    	/*
        CustomUsernamePasswordToken login_token = (CustomUsernamePasswordToken) token;

        //校验码判断逻辑
        //取得用户输入的校验码
        String userInputValidCode = login_token.getValidCode();

        //取得真实的正确校验码
        String realRightValidCode = (String) SecurityUtils.getSubject().getSession().getAttribute("rand");

        if (null == userInputValidCode || !userInputValidCode.equalsIgnoreCase(realRightValidCode)) {
            logger.debug("验证码输入错误");
            throw new ValidCodeException("验证码输入不正确");
        }
        */
    	
        //以上校验码验证通过以后,查数据库
        String username = (String) token.getPrincipal();
        SysUser user = userDAO.findByUsername(username);

        if (user == null) {
            throw new UnknownAccountException();//没找到帐号
        }
        
        SecurityUtils.getSubject().getSession().setAttribute("username", username);
        /*
        SecurityUtils.getSubject().getSession().setAttribute("username", username);
        
        List<SysMenu> menus = sysMenu(username);
        SecurityUtils.getSubject().getSession().setAttribute("usermenus", menus);
        */
        

//        if (Boolean.FALSE.equals(user.getValid())) {
//            throw new LockedAccountException(); //帐号锁定
//        }

        //交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以自定义实现
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user.getUsername(), //用户名
                user.getPassword(), //密码
                getName()  //realm name
        );
        return authenticationInfo;
    }

    @Override
    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
        super.clearCachedAuthorizationInfo(principals);
    }

    @Override
    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
        super.clearCachedAuthenticationInfo(principals);
    }

    @Override
    public void clearCache(PrincipalCollection principals) {
        super.clearCache(principals);
    }

    public void clearAllCachedAuthorizationInfo() {
        getAuthorizationCache().clear();
    }

    public void clearAllCachedAuthenticationInfo() {
        getAuthenticationCache().clear();
    }

    public void clearAllCache() {
        clearAllCachedAuthenticationInfo();
        clearAllCachedAuthorizationInfo();
    }

}
