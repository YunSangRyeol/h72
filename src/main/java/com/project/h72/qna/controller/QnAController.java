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
	
	int page=1;
	int count=10;
	
	int result = 0;
	result =  qnaService.insertq(insertqTitle, insertqContent);
	
	int countAll=0;
	countAll = qnaService.getQnACount();
	List<QnA> list = qnaService.getQnAList2(page,count);
	int endPage = (int)(countAll / (count + 0.9) + 1);
	
	
	System.out.println("고!!" + countAll + ", " + endPage + ", "  + " page" + page);
	model.addAttribute("list", list );
	model.addAttribute("countAll", countAll); 
	model.addAttribute("endPage", endPage);
	model.addAttribute("count", count);
	model.addAttribute("page", page);
	
	return "redirect:/boader/qna";
}	

@RequestMapping(value = "boader/qna_answer", method = RequestMethod.GET)
public String qna_answer(@RequestParam("qNo") String qNo, Model model) {
		
	System.out.println("OK!!"+ qNo);
	
	QnA list = qnaService.updateqna(qNo);
	System.out.println( list );
	model.addAttribute("list", list );
	return "boader/qna_answer";
}
@RequestMapping(value = "/qna_up.do", method = RequestMethod.GET)
public String notice_up(@RequestParam("qNo") String qNo, 
		@RequestParam("answerContent") String answerContent, Model model) {
	
	int page=1;
	int count=10;
	
	System.out.println("qNo, upqTitle, upqContent,answerContent" + qNo +"/" +answerContent);
	int result = 0;

	result =  qnaService.upqna(qNo, answerContent );
	
	int countAll=0;
	countAll = qnaService.getQnACount();
	List<QnA> list = qnaService.getQnAList2(page,count);
	int endPage = (int)(countAll / (count + 0.9) + 1);
	
		System.out.println("고!!" + countAll + ", " + endPage + ", "  + " page" + page);
	model.addAttribute("list", list );
	model.addAttribute("countAll", countAll); 
	model.addAttribute("endPage", endPage);
	model.addAttribute("count", count);
	model.addAttribute("page", page);
	
	System.out.println("성공?????????????????" + result );
	return "redirect:/boader/qna";
}
@RequestMapping(value = "/qna_delete.do", method = RequestMethod.GET)
public String notice_delete(@RequestParam("qNo") String qNo, @RequestParam("qTitle") String qTitle,
		@RequestParam("qContent") String qContent, Model model) {
	
	int page=1;
	int count=10;		
	
	int result = 0;
	result =  qnaService.deleteqna(qNo, qTitle, qContent);
	
	int countAll=0;
	countAll = qnaService.getQnACount();
	List<QnA> list = qnaService.getQnAList2(page,count);
	int endPage = (int)(countAll / (count + 0.9) + 1);
	
	System.out.println("고!!" + countAll + ", " + endPage + ", "  + " page" + page);
	model.addAttribute("list", list );
	model.addAttribute("countAll", countAll); 
	model.addAttribute("endPage", endPage);
	model.addAttribute("count", count);
	model.addAttribute("page", page);
	
	return "redirect:/boader/qna";
}	

@RequestMapping(value="boader/qna", method = RequestMethod.GET)
public String qnaCount(@RequestParam("page") int page,
					       		@RequestParam("count") int count,	 Model model){
	
	System.out.println("시작!!" + page + ", " + count);
	
	int countAll = 0;
	
	countAll = qnaService.getQnACount();
	List<QnA> list = qnaService.getQnAList2(page,count);

	//총 페이지수 계산 : 목록이 최소 1개일 때, 1 page 로 처리하기 위해 0.9 더함
	int endPage = (int)(countAll / (count + 0.9) + 1);		
	
	System.out.println("고!!" + countAll + ", " + endPage + ", "  + " page" + page);
	model.addAttribute("list", list );
	model.addAttribute("countAll", countAll); //총 회원수
	model.addAttribute("endPage", endPage);
	model.addAttribute("nowPage", page);
	model.addAttribute("count", count);
	
	return "boader/qna_list";
}




}
