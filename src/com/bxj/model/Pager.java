package com.bxj.model;

import java.io.Serializable;

import com.github.pagehelper.Page;

public class Pager implements Serializable{

	private static final long serialVersionUID = -128676870308677788L;
	
	private int pageNum;
	private int pageSize;
	private int startRow;
	private int endRow;
	private long total;
	private int pages;
	
	@SuppressWarnings("rawtypes")
	public static Pager page(Page page){
		Pager p = new Pager();
		p.setEndRow(page.getEndRow());
		p.setPageNum(page.getPageNum());
		p.setPages(page.getPages());
		p.setPageSize(page.getPageSize());
		p.setStartRow(page.getStartRow());
		p.setTotal(page.getTotal());
		return p;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	

}
