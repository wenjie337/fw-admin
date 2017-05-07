package com.bxj.model;

import java.io.Serializable;

public class SysUser implements Serializable{

	private static final long serialVersionUID = -7726733154241969678L;
	
	private Integer id;
	private String username;
	private String password;
	private Integer userStatus;
	
	private SysRole role;
	
	public SysUser(String username,String password){
		this.username = username;
		this.password = password;
	}
	
	public SysUser(){
		
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}

	public SysRole getRole() {
		return role;
	}
	public void setRole(SysRole role) {
		this.role = role;
	}

}
