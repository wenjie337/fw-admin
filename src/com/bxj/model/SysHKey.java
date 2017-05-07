package com.bxj.model;

import java.io.Serializable;

public class SysHKey implements Serializable{
	
	private static final long serialVersionUID = -1356893280471699256L;
	
	private Integer id;
	private String hessianKey;
	private String className;
	private String methodName;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getHessianKey() {
		return hessianKey;
	}
	public void setHessianKey(String hessianKey) {
		this.hessianKey = hessianKey;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getMethodName() {
		return methodName;
	}
	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}
	
}
