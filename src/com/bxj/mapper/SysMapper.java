package com.bxj.mapper;

import java.util.List;
import java.util.Map;

import com.bxj.model.*;

@SuppressWarnings("rawtypes")
public interface SysMapper {
	
	int addSysUser(SysUser sysuser);
	List<SysUser> findSysUser();
	void delSysUser(String[] ids);
	SysUser findSysUserById(int id);
	int updSysUser(SysUser sysuser);
	
	List<SysRole> findSysRole();

	int addSysMenu(SysMenu sysmenu);
	List<SysMenu> findSysMenu();
	SysMenu findSysMenuById(int id);
	int updSysMenu(SysMenu sysmenu);
	void delSysMenu(String[] ids);
	
	List<SysMenu> findUserSysMenu(String username);
	

	List<SysMenu> findSysRoleMenu(int roleId);
	void delSysRoleMenu(Map map);
	int addSysRoleMenu(Map map);
	
	List<SysRole> findSysUserRole(int userId);
	void delSysUserRole(Map map);
	int addSysUserRole(Map map);

	public SysUser findSysUserByName(String username);
	
	
	List<SysHKey> findSysHKey(SysHKey syshkey);
	int addSysHKey(SysHKey syshkey);
	SysHKey findSysHKeyById(int id);
	int updSysHKey(SysHKey syshkey);
	void delSysHKey(String[] ids);

}
