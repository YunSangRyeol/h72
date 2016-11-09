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
import org.springframework.web.servlet.ModelAndView;

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

	@RequestMapping(value = "boader/notice_detail_view", method = RequestMethod.GET)
	public String notice_detail(@RequestParam("noticeNo") String noticeNo, Model model) {
		
		Notice list = noticeService.getNoticeContent(noticeNo);
		System.out.println( list );
		model.addAttribute("list", list );
	
		return "boader/notice_detail_view";
	}

	
	@RequestMapping(value = "boader/notice_insert", method = RequestMethod.GET)
	public String notice_insert(Locale locale, Model model) {
		System.out.println("OK");
	
		return "boader/notice_insert";
	}
	
	@RequestMapping(value = "/notice_insert2.do", method = RequestMethod.GET)
	public String notice_insert2(@RequestParam("insertNoticeTitle") String insertNoticeTitle,
			@RequestParam("insertNoticeContent") String insertNoticeContent, Model model) {
		System.out.println("OK");
		System.out.println("insertNoticeTitle");
		
		int result = 0;
		result =  noticeService.insertnotice(insertNoticeTitle, insertNoticeContent);
		
		return "redirect:/boader/notice_list";
	}	

	@RequestMapping(value = "boader/notice_update_view", method = RequestMethod.GET)
	public String notice_update(@RequestParam("noticeNo") String noticeNo, Model model) {
		
		System.out.println("OK!!"+ noticeNo);
		
		Notice list = noticeService.updatenotice(noticeNo);
		System.out.println( list );
		model.addAttribute("list", list );

		return "boader/notice_update_view";
	}
	
	@RequestMapping(value = "/notice_up.do", method = RequestMethod.GET)
	public String notice_up(@RequestParam("noticeNo") String noticeNo, @RequestParam("upNoticeTitle") String upNoticeTitle,
			@RequestParam("upNoticeContent") String upNoticeContent, Model model) {
		
		int result = 0;
		result =  noticeService.upnotice(noticeNo, upNoticeTitle, upNoticeContent);
		
		return "redirect:/boader/notice_list";
	}	
	
	@RequestMapping(value = "boader/life_kit_detail", method = RequestMethod.GET)
	public String life_kit_detail(Locale locale, Model model) {
		
		return "boader/life_kit_detail";
	}
	
}
