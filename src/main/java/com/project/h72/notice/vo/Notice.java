package com.project.h72.notice.vo;

import java.sql.Date;

public class Notice {
	
	private int noticeNo; //글번호
	private String noticeTitle; //글제목
	private String noticeContent; //글내용
	private Date enrolldate; //날짜

	public Notice() {
		super();
	}
	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date enrolldate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.enrolldate = enrolldate;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getEnrolldate() {
		return enrolldate;
	}
	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	
	
	

}
