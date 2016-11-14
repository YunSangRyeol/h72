package com.project.h72.notice.service;

import java.util.ArrayList;
import java.util.List;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.h72.notice.vo.Notice;

@Service
public interface NoticeService {

	List<Notice> getNoticeList();

	Notice getNoticeContent(String noticeNo);

	int insertnotice(String insertNoticeTitle, String insertNoticeContent);

	int upnotice(String noticeNo, String upNoticeTitle, String upNoticeContent);

	Notice updatenotice(String noticeNo);

	int deletenotice(String noticeNo, String noticeTitle, String noticeContent);


	List<Notice> getNoticeList2(int page, int count);

	int getNoticeCount();
	
	
}
