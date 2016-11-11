package com.project.h72.admin.vo;


public class Paging {
	private int page;
	private int count;
	private String order;
	private String whatIdNName;
	private String idNname;
	private String start;
	private String end;
	
	public Paging() {
		super();
	}

	public Paging(int page, int count, String order) {
		super();
		this.page = page;
		this.count = count;
		this.order = order;
	}

	public Paging(int page, int count, String order, String idNname) {
		super();
		this.page = page;
		this.count = count;
		this.order = order;
		this.idNname = idNname;
	}	

	public Paging(int page, int count, String order, String start, String end) {
		super();
		this.page = page;
		this.count = count;
		this.order = order;
		this.start = start;
		this.end = end;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}
	

	public String getIdNname() {
		return idNname;
	}

	public void setIdNname(String idNname) {
		this.idNname = idNname;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "Paging [page=" + page + ", count=" + count + ", order=" + order + ", idNname=" + idNname 
				+ ", start=" + start + ", end=" + end + "]";
	}

	
	
	
	
	
}
