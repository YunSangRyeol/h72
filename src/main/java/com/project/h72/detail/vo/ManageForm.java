package com.project.h72.detail.vo;

import java.io.Serializable;

public class ManageForm implements Serializable {
	private String reviewNo;
	private String user;
	private String itemDetailId;
	
	public ManageForm(){}
	
	public ManageForm(String reviewNo, String user, String itemDetailId) {
		super();
		this.reviewNo = reviewNo;
		this.user = user;
		this.itemDetailId = itemDetailId;
	}

	public String getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getItemDetailId() {
		return itemDetailId;
	}

	public void setItemDetailId(String itemDetailId) {
		this.itemDetailId = itemDetailId;
	}

	@Override
	public String toString(){
		return reviewNo + ", " + user + ", " + itemDetailId;
	}

}
