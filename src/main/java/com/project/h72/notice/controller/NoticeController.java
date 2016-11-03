package com.project.h72.notice.controller;

import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.h72.HomeController;
import com.project.h72.admin.service.AdminService;
import com.project.h72.member.vo.Member;
import com.project.h72.notice.service.NoticeService;
import com.project.h72.notice.vo.Notice;
@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "boader/notice_list", method = RequestMethod.GET)
	public String notice_list(Locale locale, Model model) {

		List<Notice> list = noticeService.getNoticeList();
		System.out.println(list);
		model.addAttribute("list", list );
		
		return "boader/notice_list";
	}

	@RequestMapping(value = "boader/notice.do", method = RequestMethod.GET)
	public String notice_detail(@RequestParam("noticeNo") String noticeNo, Model model) {
		
		Notice list = noticeService.getNoticeContent(noticeNo);
		System.out.println( list );
		model.addAttribute("list", list );
	
		return "boader/notice_detail_view";
	}

	@RequestMapping(value = "boader/notice_update", method = RequestMethod.GET)
	public String notice_update(Locale locale, Model model) {

		return "boader/notice_update";
	}
	
	@RequestMapping(value = "boader/life_kit_detail", method = RequestMethod.GET)
	public String life_kit_detail(Locale locale, Model model) {
		
		return "boader/life_kit_detail";
	}
	
}
