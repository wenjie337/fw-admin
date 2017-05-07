package com.bxj.service;

import java.util.List;
import java.util.Map;

import com.bxj.model.*;

@SuppressWarnings("rawtypes")
public interface SysService {
	
	int addSysUser(SysUser sysuser);
	List<SysUser> findSysUser();
	void delSysUser(String ids);
	SysUser findSysUserById(int id);
	int updSysUser(SysUser sysuser);
	
	List<SysRole> findSysRole();
	
	int addSysMenu(SysMenu sysmenu);
	List<SysMenu> findSysMenu(int[] arr);
	SysMenu findSysMenuById(int id);
	int updSysMenu(SysMenu sysmenu);
	void delSysMenu(String ids);
	
	List<SysMenu> findUserSysMenu(String username);
	
	List<SysMenu> findSysRoleMenu(int roleId);
	int addSysRoleMenu(Map map);
	
	List<SysRole> findSysUserRole(int userId);
	int addSysUserRole(Map map);

	public SysUser findSysUserByName(String username);
	
	List<SysHKey> findSysHKey(Object ...arr);
	int addSysHKey(SysHKey syshkey);
	SysHKey findSysHKeyById(int id);
	int updSysHKey(SysHKey syshkey);
	void delSysHKey(String ids);

}
