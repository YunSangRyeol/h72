package com.project.h72.notice.service;

import java.util.ArrayList;
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

	@Override
	public int upnotice(String noticeNo, String upNoticeTitle, String upNoticeContent) {
		// TODO Auto-generated method stub
		return dao.NoticeUp(noticeNo,upNoticeTitle,upNoticeContent);
	}


	@Override
	public Notice updatenotice(String noticeNo) {
		// TODO Auto-generated method stub
		return dao.updatenotice(noticeNo);
	}


	@Override
	public int deletenotice(String noticeNo, String noticeTitle, String noticeContent) {
		// TODO Auto-generated method stub
		return dao.deletenotice(noticeNo,noticeTitle,noticeContent);
	}

	@Override
	public List<Notice> getNoticeList2(int page, int count) {
		// TODO Auto-generated method stub
		System.out.println("asef;qli3wje;rsfdpihgbopdfil");
		List<Notice> list = dao.getNoticeList2(page, count);
		System.out.println("list"+ list);
		return list;
	}


	@Override
	public int getNoticeCount() {
		// TODO Auto-generated method stub
		return dao.getNoticeCount();
	}

}
