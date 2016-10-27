package com.project.h72.qna.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.h72.HomeController;
@Controller
public class QnAController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
@RequestMapping(value = "boader/qna_list", method = RequestMethod.GET)
public String qna_list(Locale locale, Model model) {
/*	logger.info("Welcome home! The client locale is {}.", locale);

	
	model.addAttribute("serverTime" );*/
	
	return "boader/qna_list";
}

@RequestMapping(value = "boader/qna_detail", method = RequestMethod.GET)
public String qna_detail(Locale locale, Model model) {
/*	logger.info("Welcome home! The client locale is {}.", locale);

	
	model.addAttribute("serverTime" );*/
	
	return "boader/qna_detail";
}
@RequestMapping(value = "boader/qna_update", method = RequestMethod.GET)
public String qna_update(Locale locale, Model model) {
/*	logger.info("Welcome home! The client locale is {}.", locale);

	
	model.addAttribute("serverTime" );*/
	
	return "boader/qna_update";
}

}
