package com.bxj.interceptor;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bxj.hessian.service.HessianService;
import com.bxj.model.SysHKey;
import com.bxj.model.SysMenu;
import com.bxj.service.SysService;
import com.bxj.util.TextUtil;
import com.github.pagehelper.Page;

public class ParameterInterceptor implements HandlerInterceptor {
	
	@Autowired
	private SysService sysService;
	@Autowired
	private HessianService hessianService;

	@SuppressWarnings("rawtypes")
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
		try{
			String username = (String)arg0.getSession().getAttribute("username");
			if(username==null){
				username = (String)SecurityUtils.getSubject().getPrincipal();
				arg0.getSession().setAttribute("username", username);
			}
			List umenus = (List)arg0.getSession().getAttribute("usermenus");
			if(TextUtil.isValid(username) && (umenus==null||umenus.isEmpty())){
				List<SysMenu> menus = sysMenu(username);
				arg0.getSession().setAttribute("usermenus", menus);
			}
			
			List<SysHKey> hkeys = sysService.findSysHKey();
			if(hkeys!=null && !hkeys.isEmpty()){
				String className = ((HandlerMethod)arg2).getBean().getClass().getName();
				String methodName = ((HandlerMethod)arg2).getMethod().getName();
				
				for(SysHKey hkey : hkeys){
					if(hkey.getClassName()!=null && hkey.getClassName().equals(className)
							&& hkey.getMethodName()!=null && hkey.getMethodName().equals(methodName)){
						hessianService.flush(hkey.getHessianKey());
						break;
					}
				}
			}
		}catch(IllegalStateException e){
			
		}
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		Map<String,Object> params = (Map)arg0.getSession().getAttribute("search_params");
		
		String uri = arg0.getRequestURI();
		String[] uris = uri.split("/");
		if (uris.length >= 1) {
			String action = uris[uris.length-1];
			if(action.startsWith("get") || action.startsWith("index")){
				String xrw = arg0.getHeader("x-requested-with");
				
				if(xrw == null){//不是ajax请求
					params = getAllParameter(arg0,params);
					arg0.getSession().setAttribute("search_params", params);
				}
			}
		}
		
		if(params!=null && params.get("m")!=null){
			arg0.getSession().setAttribute("m", params.get("m"));
			arg0.getSession().removeAttribute("search_params");
		}
		
		return true;
	}
	
	public static Map<String, Object> getAllParameter(HttpServletRequest request,Map<String,Object> map) {
		if(map==null){
			map = new HashMap<String, Object>();
		}
		Enumeration<?> enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String paraName = (String) enu.nextElement();
			map.put(paraName, request.getParameter(paraName));
			//System.out.println(paraName+"="+request.getParameter(paraName));
		}
		return map;
	}
	
	private List<SysMenu> sysMenu(String username){
		List<SysMenu> menus = sysService.findUserSysMenu(username);
		
		List<SysMenu> list = new ArrayList<SysMenu>();
		for(SysMenu menu : menus){
			list.add((SysMenu)menu.clone());
		}
		
		List<SysMenu> ms = new ArrayList<SysMenu>(); 
		if(!(list instanceof Page)){
			for(SysMenu menu : list){
				if(menu.getParentId()==0){
					if(menu.getMenuType()==null || menu.getMenuType()==0){
						continue;
					}
					ms.add(menu);
					subs(menu,list);
				}
			}
		}
		
		return ms;
	}
	
	private void subs(SysMenu menu,List<SysMenu> list){
		for(SysMenu sub : list){
			if(sub.getParentId() == menu.getId()){
				if(menu.getSubs()==null){
					menu.setSubs(new ArrayList<SysMenu>());
				}
				if(sub.getMenuType()==null || sub.getMenuType()==0){
					continue;
				}
				menu.getSubs().add(sub);
				subs(sub,list);
			}
			
		}
	}

}
