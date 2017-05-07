package com.bxj.model;

import java.io.Serializable;

public class SysRole implements Serializable{

	private static final long serialVersionUID = -78574961271981478L;
	
	private Integer id;
	private String roleName;
	private String roleDesc;
	
	public SysRole(){
		
	}
	
	public SysRole(String roleName){
		this.roleName = roleName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}

}
