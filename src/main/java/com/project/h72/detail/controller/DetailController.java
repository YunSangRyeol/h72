package com.project.h72.detail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DetailController {
	/*@RequestMapping(value="/", method= RequestMethod.POST)*/
	@RequestMapping(value = "/selectItem", method = RequestMethod.POST)
	public String selectItem(String ItemDetailId, Model model){
		
		return "";
	}
	@RequestMapping(value = "/addReview", method = RequestMethod.POST)
	public String addReview(String ItemDetailId, Model model){
		
		return "";//ajax사용 출력
	}
	
	
	
	
}
