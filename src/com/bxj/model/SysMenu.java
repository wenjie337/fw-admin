package com.bxj.model;

import java.io.Serializable;
import java.util.List;

public class SysMenu implements Serializable,Cloneable {

	private static final long serialVersionUID = 2645457673349422693L;
	
	private Integer id;
	private String menuName;
	private String menuUrl;
	private Integer menuType;
	private Integer expand;
	private Integer menuIndex;
	private String menuIcon;
	private String menuClass;
	private Integer parentId;
	private String treeCode;
	
	private List<SysMenu> subs;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public Integer getMenuType() {
		return menuType;
	}
	public void setMenuType(Integer menuType) {
		this.menuType = menuType;
	}
	public Integer getExpand() {
		return expand;
	}
	public void setExpand(Integer expand) {
		this.expand = expand;
	}
	public Integer getMenuIndex() {
		return menuIndex;
	}
	public void setMenuIndex(Integer menuIndex) {
		this.menuIndex = menuIndex;
	}
	public String getMenuIcon() {
		return menuIcon;
	}
	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}
	public String getMenuClass() {
		return menuClass;
	}
	public void setMenuClass(String menuClass) {
		this.menuClass = menuClass;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getTreeCode() {
		return treeCode;
	}
	public void setTreeCode(String treeCode) {
		this.treeCode = treeCode;
	}
	public List<SysMenu> getSubs() {
		return subs;
	}
	public void setSubs(List<SysMenu> subs) {
		this.subs = subs;
	}

	public Object clone() {   
        SysMenu o = null;   
        try {   
            o = (SysMenu) super.clone();   
        } catch (Exception e) {   
        }   
        return o;   
    } 
}
