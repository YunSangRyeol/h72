package com.project.h72.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.h72.notice.vo.Notice;

@Service
public interface NoticeService {

	List<Notice> getNoticeList();

	Notice getNoticeContent(String noticeNo); 
}
