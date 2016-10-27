package com.project.h72.notice.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.h72.HomeController;
@Controller
public class NoticeController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "boader/notice_list", method = RequestMethod.GET)
	public String notice_list(Locale locale, Model model) {
/*		logger.info("Welcome home! The client locale is {}.", locale);

		
		model.addAttribute("serverTime" );*/
		
		return "boader/notice_list";
	}


	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "boader/notice_detail", method = RequestMethod.GET)
	public String notice_detail(Locale locale, Model model) {
/*		logger.info("Welcome home! The client locale is {}.", locale);

		
		model.addAttribute("serverTime" );*/
		
		return "boader/notice_detail";
	}

	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "boader/notice_update", method = RequestMethod.GET)
	public String notice_update(Locale locale, Model model) {
/*		logger.info("Welcome home! The client locale is {}.", locale);

		
		model.addAttribute("serverTime" );*/
		
		return "boader/notice_update";
	}
}
