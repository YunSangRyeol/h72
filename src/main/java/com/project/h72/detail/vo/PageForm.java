package com.project.h72.detail.vo;

import java.io.Serializable;

public class PageForm implements Serializable{
	
	private int pageNo;
	private String itemDetailId;
	
	public PageForm(){}

	public PageForm(int pageNo, String itemDetailId) {
		super();
		this.pageNo = pageNo;
		this.itemDetailId = itemDetailId;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getItemDetailId() {
		return itemDetailId;
	}

	public void setItemDetailId(String itemDetailId) {
		this.itemDetailId = itemDetailId;
	}
	
	@Override
	public String toString(){
		return pageNo + ", " + itemDetailId;
	}
	
	
}
