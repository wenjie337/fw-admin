package com.bxj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bxj.model.*;
import com.bxj.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bxj.service.SysService;
import com.github.pagehelper.Page;

import net.sf.json.JSONArray;

@SuppressWarnings("rawtypes")
@Controller
@RequestMapping("/sys")
public class SysController {
	
	@Autowired
	private SysService sysService;
	@Autowired
	private Config config;
	
	
	@RequestMapping("/getSysUser")
	public String getSysUser(HttpServletRequest request){
		
		List<SysUser> list = sysService.findSysUser();
		
		request.setAttribute("users", ((Page)list));
		request.setAttribute("page", Pager.page(((Page)list)));
		
		return "/sys/sys_user_list";
	}
	
	@RequestMapping("/addSysUser")
	public String addSysUser(HttpServletRequest request,SysUser sysuser){
		
		if(sysuser!=null && sysuser.getUsername()!=null
				&& !"".equals(sysuser.getUsername()))
		sysService.addSysUser(sysuser);
		
		return "redirect:/sys/getSysUser.htm";
	}
	
	@RequestMapping("/delSysUser")
	public void delSysUser(HttpServletRequest request,HttpServletResponse response,String ids){
		
		try{
			sysService.delSysUser(ids);
			
			response.getWriter().write("1");
			response.getWriter().flush();
			
		}catch(Exception e){
			
		}
	}
	
	@RequestMapping("/getSysUserById")
	public String getSysUserById(HttpServletRequest request,int userId){
		
		SysUser sysuser = sysService.findSysUserById(userId);
		request.setAttribute("sysuser", sysuser);
		
		return "/sys/sys_user_upd";
	}
	
	@RequestMapping("/updSysUser")
	public String updSysUser(HttpServletRequest request,SysUser sysuser,RedirectAttributes redirectAttr){
		//@ModelAttribute("username") String username
		
		sysService.updSysUser(sysuser);
		
		return "redirect:/sys/getSysUser.htm";
	}
	
	
	@RequestMapping("/getSysRole")
	public String getSysRole(HttpServletRequest request){
		
		List<SysRole> list = sysService.findSysRole();
		
		request.setAttribute("roles", ((Page)list));
		request.setAttribute("page", Pager.page(((Page)list)));
		
		return "/sys/sys_role_list";
	}
	
	
	@RequestMapping("/getSysUserRole")
	public String getSysUserRole(HttpServletRequest request){
		return "/sys/sys_user_role";
	}
	
	
	
	@RequestMapping("/sysuser")
	public void sysuser(HttpServletRequest request,HttpServletResponse response){
		List<SysUser> list = sysService.findSysUser();
		
		JSONArray jsysuser = new JSONArray();
		jsysuser.addAll(list);
		
		try{
			String json = jsysuser.toString();
			json = JsonTree.sysuser(json);
			response.getWriter().write(json);
			response.getWriter().flush();
		}catch(Exception e){
			
		}
		
	}
	
	
	@RequestMapping("/sysrole")
	public void sysrole(HttpServletRequest request,HttpServletResponse response){
		List<SysRole> list = sysService.findSysRole();
		
		JSONArray jsysrole = new JSONArray();
		jsysrole.addAll(list);
		
		try{
			String json = jsysrole.toString();
			json = JsonTree.sysrole(json);
			response.getWriter().write(json);
			response.getWriter().flush();
		}catch(Exception e){
			
		}
		
	}
	
	@RequestMapping("/getSysMenu")
	public String getSysMenu(HttpServletRequest request){
		int pagesize = config.getPagesize();
		int pagenum = 1;
		String pn = request.getParameter("pagenum");
		if(TextUtil.isValidNumber(pn)){
			pagenum = Integer.parseInt(pn);
		}
		
		int[] arr = {1,pagenum,pagesize};
		List<SysMenu> list = sysService.findSysMenu(arr);
		
		request.setAttribute("menus", ((Page)list));
		request.setAttribute("page", Pager.page(((Page)list)));
		
		return "/sys/sys_menu_list";
	}
	
	@RequestMapping("/addSysMenuForm")
	public String addSysMenuForm(HttpServletRequest request){
		int[] arr = {0};
		List<SysMenu> list = sysService.findSysMenu(arr);
		request.setAttribute("menus", list);
		return "/sys/sys_menu_add";
	}

	@RequestMapping("/addSysMenu")
	public String addSysMenu(HttpServletRequest request,SysMenu sysmenu){
		
		if(sysmenu!=null && sysmenu.getMenuUrl()!=null
				&& !"".equals(sysmenu.getMenuUrl()))
		sysService.addSysMenu(sysmenu);
		
		return "redirect:/sys/getSysMenu.htm";
	}
	
	@RequestMapping("/getSysMenuById")
	public String getSysMenuById(HttpServletRequest request,int menuId){
		
		SysMenu sysmenu = sysService.findSysMenuById(menuId);
		request.setAttribute("sysmenu", sysmenu);
		
		int[] arr = {0};
		List<SysMenu> list = sysService.findSysMenu(arr);
		request.setAttribute("menus", list);
		
		return "/sys/sys_menu_upd";
	}
	
	@RequestMapping("/updSysMenu")
	public String updSysMenu(HttpServletRequest request,SysMenu sysmenu,RedirectAttributes redirectAttr){
		//@ModelAttribute("username") String username
		
		if(sysmenu!=null){
			sysService.updSysMenu(sysmenu);
		}
		
		return "redirect:/sys/getSysMenu.htm";
	}
	
	@RequestMapping("/delSysMenu")
	public void delSysMenu(HttpServletRequest request,HttpServletResponse response,String ids){
		
		try{
			sysService.delSysMenu(ids);
			
			response.getWriter().write("1");
			response.getWriter().flush();
			
		}catch(Exception e){
			
		}
	}
	
	
	@RequestMapping("/getSysRoleMenu")
	public String getSysRoleMenu(HttpServletRequest request){
		return "/sys/sys_role_menu";
	}
	
	@RequestMapping("/menurole")
	public void menurole(HttpServletRequest request,HttpServletResponse response){
		List<SysRole> list = sysService.findSysRole();
		
		JSONArray jsysrole = new JSONArray();
		jsysrole.addAll(list);
		
		try{
			String json = jsysrole.toString();
			json = JsonTree.menurole(json);
			response.getWriter().write(json);
			response.getWriter().flush();
		}catch(Exception e){
			
		}
		
	}
	
	private void subs(SysMenu menu,List<SysMenu> list){
		for(SysMenu sub : list){
			if(sub.getParentId() == menu.getId()){
				if(menu.getSubs()==null){
					menu.setSubs(new ArrayList<SysMenu>());
				}
				if(!TextUtil.isValid(sub.getMenuName())){
					sub.setMenuName(sub.getMenuUrl());
				}
				menu.getSubs().add(sub);
				subs(sub,list);
			}
			
		}
	}
	
	
	@RequestMapping("/sysmenu")
	public void sysmenu(HttpServletRequest request,HttpServletResponse response){
		int[] arr = {0};
		List<SysMenu> menus = sysService.findSysMenu(arr);
		
		List<SysMenu> list = new ArrayList<SysMenu>();
		for(SysMenu menu : menus){
			list.add((SysMenu)menu.clone());
		}
		
		List<SysMenu> ms = new ArrayList<SysMenu>(); 
		if(!(list instanceof Page)){
			for(SysMenu menu : list){
				if(menu.getParentId()==0){
					if(!TextUtil.isValid(menu.getMenuName())){
						menu.setMenuName(menu.getMenuUrl());
					}
					ms.add(menu);
					subs(menu,list);
				}
			}
		}
		
		
		JSONArray jsysmenu = new JSONArray();
		jsysmenu.addAll(ms);
		
		try{
			String json = jsysmenu.toString();
			json = JsonTree.sysmenu(json);
			response.getWriter().write(json);
			response.getWriter().flush();
		}catch(Exception e){
			
		}
		
	}
	
	@RequestMapping("/sysmenubyrole")
	public void sysmenubyrole(HttpServletRequest request,HttpServletResponse response,String roleId){
		if(TextUtil.isValidNumber(roleId)){
			List<SysMenu> menus = sysService.findSysRoleMenu(Integer.parseInt(roleId));
			
			JSONArray jsysmenu = new JSONArray();
			jsysmenu.addAll(menus);
			
			try{
				response.getWriter().write(jsysmenu.toString());
				response.getWriter().flush();
			}catch(Exception e){
				
			}
		}
		
	}
	
	
	@RequestMapping("/sysrolemenu")
	public void sysrolemenu(HttpServletRequest request,HttpServletResponse response,String roleId,String menuIds){
		
		if(TextUtil.isValidNumber(roleId) && TextUtil.isValid(menuIds)){
			Map<String,String> map = new HashMap<String,String>();
			map.put("roleId", roleId);
			map.put("menuIds", menuIds);
			int ret = sysService.addSysRoleMenu(map);
			
			try{
				response.getWriter().write(""+ret);
				response.getWriter().flush();
			}catch(Exception ex){
				
			}
		}
		
	}
	
	
	@RequestMapping("/sysrolebyuser")
	public void sysrolebyuser(HttpServletRequest request,HttpServletResponse response,String userId){
		if(TextUtil.isValidNumber(userId)){
			List<SysRole> roles = sysService.findSysUserRole(Integer.parseInt(userId));
			
			JSONArray jsysrole = new JSONArray();
			jsysrole.addAll(roles);
			
			try{
				response.getWriter().write(jsysrole.toString());
				response.getWriter().flush();
			}catch(Exception e){
				
			}
		}
		
	}
	
	
	@RequestMapping("/sysuserrole")
	public void sysuserrole(HttpServletRequest request,HttpServletResponse response,String userId,String roleIds){
		
		if(TextUtil.isValidNumber(userId) && TextUtil.isValid(roleIds)){
			Map<String,String> map = new HashMap<String,String>();
			map.put("userId", userId);
			map.put("roleIds", roleIds);
			int ret = sysService.addSysUserRole(map);
			
			try{
				response.getWriter().write(""+ret);
				response.getWriter().flush();
			}catch(Exception ex){
				
			}
		}
		
	}


	/**
	 * 跳转错误页的公共方法，带错误信息
	 * @param mav
	 * @param request
	 * @return
	 */
	@RequestMapping("/syserror")
	public ModelAndView syserror(ModelAndView mav,HttpServletRequest request){
		String errorMsg = request.getParameter("errorMsg");
		mav.addObject("errorMsg",errorMsg);
		return ResultErrorPage.forwordErrorPage(mav);
	}
	
	
	@RequestMapping("/getSysHKey")
	public String getSysHKey(HttpServletRequest request,SysHKey syshkey){
		int pagenum = 1;
		String pn = request.getParameter("pagenum");
		if(TextUtil.isValidNumber(pn)){
			pagenum = Integer.parseInt(pn);
		}
		
		
		Object[] arr = {pagenum,syshkey};
		List<SysHKey> list = sysService.findSysHKey(arr);
		
		request.setAttribute("hessianKey", syshkey==null||syshkey.getHessianKey()==null?"":syshkey.getHessianKey());
		request.setAttribute("hkeys", ((Page)list));
		request.setAttribute("page", Pager.page(((Page)list)));
		
		return "/sys/sys_hkey_list";
	}
	
	@RequestMapping("/addSysHKeyForm")
	public String addSysHKeyForm(HttpServletRequest request){
		return "/sys/sys_hkey_add";
	}

	@RequestMapping("/addSysHKey")
	public String addSysHKey(HttpServletRequest request,SysHKey syshkey){
		
		if(syshkey!=null){
			if(syshkey.getMethodName()!=null){
				String[] arr = syshkey.getMethodName().split(",");
				for(String mname : arr){
					syshkey.setMethodName(mname);
					sysService.addSysHKey(syshkey);
				}
			}
		}
		
		return "redirect:/sys/getSysHKey.htm";
	}
	
	@RequestMapping("/getSysHKeyById")
	public String getSysHKeyById(HttpServletRequest request,int keyId){
		
		SysHKey syshkey = sysService.findSysHKeyById(keyId);
		request.setAttribute("syshkey", syshkey);
		
		return "/sys/sys_hkey_upd";
	}
	
	@RequestMapping("/updSysHKey")
	public String updSysHKey(HttpServletRequest request,SysHKey syshkey,RedirectAttributes redirectAttr){
		//@ModelAttribute("username") String username
		
		if(syshkey!=null){
			sysService.updSysHKey(syshkey);
		}
		
		return "redirect:/sys/getSysHKey.htm";
	}
	
	@RequestMapping("/delSysHKey")
	public void delSysHKey(HttpServletRequest request,HttpServletResponse response,String ids){
		
		try{
			sysService.delSysHKey(ids);
			
			response.getWriter().write("1");
			response.getWriter().flush();
			
		}catch(Exception e){
			
		}
	}

}
