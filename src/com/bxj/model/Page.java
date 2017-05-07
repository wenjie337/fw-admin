package com.bxj.model;

public class Page {
	
	int pagenum;
	int pagesize;

	public int getPagenum() {
		return pagenum==0?1:pagenum;
	}

	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	
}
