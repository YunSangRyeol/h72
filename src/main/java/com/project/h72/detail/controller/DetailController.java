package com.project.h72.detail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wappl.moolmool.board.controller.Model;

@Controller
public class DetailController {
	/*@RequestMapping(value="/", method= RequestMethod.POST)*/
	@RequsetMapping(value="/selectItem", method=RequestMethod.POST)
	public String selectItem(String ItemDetailId, Model model){
		
		return "";
	}
	
	@RequestMapping(value="/addReview", mtehod=RequestMethod.POST)
	public String addReview(String ItemDetailId, Model model){
		
		return "";//ajax사용 출력
	}
	
	
	
	
}
