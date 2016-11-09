package com.project.h72.qna.controller;

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
import com.project.h72.notice.service.NoticeService;
import com.project.h72.notice.vo.Notice;
import com.project.h72.qna.service.QnAService;
import com.project.h72.qna.vo.QnA;
@Controller
public class QnAController {
	@Autowired
	private QnAService qnaService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
@RequestMapping(value = "boader/qna_list", method = RequestMethod.GET)
public String qna_list(Locale locale, Model model) {

	List<QnA> list = qnaService.getQnAList();
	System.out.println(list);
	model.addAttribute("list", list );
	
	return "boader/qna_list";
}

@RequestMapping(value = "boader/qna_detail_view", method = RequestMethod.GET)
public String qna_detail(@RequestParam("qNo") String qNo, Model model) {
	
	QnA list = qnaService.getQnAContent(qNo);
	System.out.println( list );
	model.addAttribute("list", list );
	
	return "boader/qna_detail_view";
}

@RequestMapping(value = "boader/qna_insert", method = RequestMethod.GET)
public String qna_insert(Locale locale, Model model) {

	return "boader/qna_insert";
}
@RequestMapping(value = "/qna_insert2.do", method = RequestMethod.GET)
public String qna_insert2(@RequestParam("insertqTitle") String insertqTitle,
		@RequestParam("insertqContent") String insertqContent, Model model) {
	System.out.println("OK");
	System.out.println("insertqTitle");
	
	int result = 0;
	result =  qnaService.insertq(insertqTitle, insertqContent);
	
	return "redirect:/boader/qna_list";
}	

@RequestMapping(value = "boader/qna_update_view", method = RequestMethod.GET)
public String qna_update(@RequestParam("qNo") String qNo, Model model) {
/*	logger.info("Welcome home! The client locale is {}.", locale);

	
	model.addAttribute("serverTime" );*/

	System.out.println("OK!!"+ qNo);
	
	QnA list = qnaService.updateqna(qNo);
	System.out.println( list );
	model.addAttribute("list", list );
	return "boader/qna_update_view";
}
@RequestMapping(value = "/qna_up.do", method = RequestMethod.GET)
public String notice_up(@RequestParam("qNo") String qNo, @RequestParam("upqTitle") String upqTitle,
		@RequestParam("upqContent") String upqContent, Model model) {
	
	int result = 0;
	result =  qnaService.upqna(qNo, upqTitle, upqContent);
	
	return "redirect:/boader/qna_list";
}	


}
