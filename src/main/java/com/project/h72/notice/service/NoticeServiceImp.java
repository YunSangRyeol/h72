package com.project.h72.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.notice.dao.NoticeDao;
import com.project.h72.notice.vo.Notice;

@Service
public class NoticeServiceImp implements NoticeService {
	@Autowired
	private NoticeDao dao;


	public List<Notice> getNoticeList() {
		// TODO Auto-generated method stub
		return dao.getNoticeList();
	}


	@Override
	public Notice getNoticeContent(String noticeNo) {
		// TODO Auto-generated method stub
		return dao.getNoticeContent(noticeNo);
	}


	@Override
	public int insertnotice(String insertNoticeTitle, String insertNoticeContent) {
		// TODO Auto-generated method stub
		return dao.NoticeInsert(insertNoticeTitle,insertNoticeContent);
	}

	
}
