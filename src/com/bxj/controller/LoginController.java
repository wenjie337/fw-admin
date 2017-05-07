package com.bxj.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
//import org.apache.log4j.Logger;
//import org.apache.shiro.SecurityUtils;
//import org.apache.shiro.authc.AuthenticationException;
//import org.apache.shiro.authc.UsernamePasswordToken;
//import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bxj.model.SysMenu;
import com.bxj.service.SysService;
import com.bxj.util.TextUtil;
import com.github.pagehelper.Page;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/")
public class LoginController {
	
	//private final static Logger logger = Logger.getLogger(LoginController.class);
	
	@Autowired
	private SysService sysService;
	
	@RequestMapping("/signin")
	public String signin(HttpServletRequest request){
		return "/signin";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request){
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String uname = (String)request.getSession().getAttribute("username");
		
		if(StringUtils.isEmpty(username) && StringUtils.isEmpty(uname)){
			return "redirect:/signin.htm";
		}
		
		Subject user = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username,password);
		//token.setRememberMe(true);
		
		try {
			
			request.getSession().setAttribute("username", username);
			
			if (user.getSession() != null) {
		        user.logout();
		    }
			
			user.login(token);
			
			return "redirect:/index.htm";
		}catch (Exception e) {
			token.clear();
			//logger.error(e.getMessage(), e);
		}
		
		return "redirect:/signin.htm";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		
		Subject user = SecurityUtils.getSubject();
		try{
			request.getSession().removeAttribute("username");
			user.logout();
		}catch(Exception ex){
			
		}
		return "redirect:/signin.htm";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("/index")
	public String index(HttpServletRequest request){
		
		Subject user = SecurityUtils.getSubject();
		String username = (String)user.getPrincipal();
		List umenus = (List)request.getSession().getAttribute("usermenus");
		if(TextUtil.isValid(username) && (umenus==null||umenus.isEmpty())){
			List<SysMenu> menus = sysMenu(username);
			request.getSession().setAttribute("usermenus", menus);
		}
		
		return "/index";
	}
	
	@RequestMapping("/main")
	public String main(HttpServletRequest request){
		return "/_welcome";
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

	@RequestMapping("/unauthorized")
	public ModelAndView unauthorized(ModelAndView mav) {
		mav.setViewName("/unauthorized");
		return mav;
	}
}
