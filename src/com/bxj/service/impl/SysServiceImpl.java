package com.bxj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.bxj.model.*;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bxj.mapper.SysMapper;
import com.bxj.service.SysService;
import com.bxj.shiro.security.PasswordHelper;
import com.bxj.util.TextUtil;
import com.github.pagehelper.PageHelper;

@SuppressWarnings({"rawtypes","unchecked"})
@Service
@Transactional
public class SysServiceImpl implements SysService{
	
	@Resource
	private SysMapper sysMapper;

	@Override
	public int addSysUser(SysUser sysuser) {
		
		if(sysuser==null)return 0;
		
		PasswordHelper ph = new PasswordHelper();
		String password = ph.encryptPassword(sysuser.getUsername(), sysuser.getPassword());
		sysuser.setPassword(password);
		return sysMapper.addSysUser(sysuser);
		
	}
	
	@Override
	public List<SysUser> findSysUser() {
		PageHelper.startPage(1, 10);
		List<SysUser> list = sysMapper.findSysUser();
		
		return list;
	}
	
	@Override
	public void delSysUser(String ids) {
		if(ids==null)return;
		sysMapper.delSysUser(ids.split("@"));
	}
	
	@Override
	public SysUser findSysUserById(int id) {
		return sysMapper.findSysUserById(id);
	}
	
	@Override
	public int updSysUser(SysUser sysuser) {
		if(sysuser == null)return 0;
		
		if(sysuser.getPassword()!=null && !"".equals(sysuser.getPassword())){
			PasswordHelper ph = new PasswordHelper();
			String password = ph.encryptPassword(sysuser.getUsername(), sysuser.getPassword());
			sysuser.setPassword(password);
		}
		
		return sysMapper.updSysUser(sysuser);
	}
	
	
	@Override
	public List<SysRole> findSysRole() {
		PageHelper.startPage(1, 10);
		List<SysRole> list = sysMapper.findSysRole();
		
		return list;
	}

	@Override
	public List<SysMenu> findSysMenu(int[] arr) {
		if(arr!=null && arr.length>0 && arr[0] > 0){
			if(arr.length>2){
				PageHelper.startPage(arr[1], arr[2]);
			}
		}
		
		List<SysMenu> list = sysMapper.findSysMenu();
		
		return list;
	}
	

	@Override
	public int addSysMenu(SysMenu sysmenu) {
		return sysMapper.addSysMenu(sysmenu);
	}

	@Override
	public int addSysRoleMenu(Map map) {
		if(map == null)return 0;
		String roleId = (String)map.get("roleId");
		String menuIds = (String)map.get("menuIds");
		
		if(!TextUtil.isValidNumber(roleId) || !TextUtil.isValid(menuIds)){
			return 0;
		}
		
		sysMapper.delSysRoleMenu(map);
		
		String[] arr = menuIds.split(",");
		
		int ret = 0;
		for(String menuId : arr){
			map.put("menuId", menuId);
			ret = sysMapper.addSysRoleMenu(map);
		}
		
		return ret;
	}

	@Override
	public List<SysMenu> findSysRoleMenu(int roleId) {
		return sysMapper.findSysRoleMenu(roleId);
	}

	@Override
	public List<SysRole> findSysUserRole(int userId) {
		return sysMapper.findSysUserRole(userId);
	}

	@Override
	public int addSysUserRole(Map map) {
		if(map == null)return 0;
		String userId = (String)map.get("userId");
		String roleIds = (String)map.get("roleIds");
		
		if(!TextUtil.isValidNumber(userId) || !TextUtil.isValid(roleIds)){
			return 0;
		}
		
		sysMapper.delSysUserRole(map);
		
		String[] arr = roleIds.split(",");
		
		int ret = 0;
		for(String roleId : arr){
			map.put("roleId", roleId);
			ret = sysMapper.addSysUserRole(map);
		}
		
		return ret;
	}

	@Override
	public SysMenu findSysMenuById(int id) {
		return sysMapper.findSysMenuById(id);
	}

	@Override
	public int updSysMenu(SysMenu sysmenu) {
		return sysMapper.updSysMenu(sysmenu);
	}

	@Override
	public List<SysMenu> findUserSysMenu(String username) {
		return sysMapper.findUserSysMenu(username);
	}

	@Override
	public void delSysMenu(String ids) {
		if(ids==null)return;
		sysMapper.delSysMenu(ids.split("@"));
	}


	@Override
	public SysUser findSysUserByName(String username) {
		if(StringUtils.isBlank(username))	return null;

		return sysMapper.findSysUserByName(username);
	}

	@Override
	public List<SysHKey> findSysHKey(Object ...arr) {
		if(arr!=null && arr.length>0){
			PageHelper.startPage((int)arr[0], 10);
		}
		SysHKey syshkey = null;
		if(arr.length>1){
			syshkey = (SysHKey)arr[1];
		}
		return sysMapper.findSysHKey(syshkey);
	}

	@Override
	public int addSysHKey(SysHKey syshkey) {
		return sysMapper.addSysHKey(syshkey);
	}

	@Override
	public SysHKey findSysHKeyById(int id) {
		return sysMapper.findSysHKeyById(id);
	}

	@Override
	public int updSysHKey(SysHKey syshkey) {
		return sysMapper.updSysHKey(syshkey);
	}

	@Override
	public void delSysHKey(String ids) {
		if(ids==null)return;
		sysMapper.delSysHKey(ids.split("@"));
	}

	
	public static void main(String []args){
		PasswordHelper ph = new PasswordHelper();
		String password = ph.encryptPassword("admin", "admin");
		System.out.println(password);
	}
}
