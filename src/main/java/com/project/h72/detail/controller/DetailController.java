package com.project.h72.detail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DetailController {
	/*@RequestMapping(value="/", method= RequestMethod.POST)*/
	@RequestMapping(value = "/selectItem", method = RequestMethod.GET)
	public String selectItem(String ItemDetailId, Model model){
		
		return "";
	}
	
	@RequestMapping(value = "/insertReview", method = RequestMethod.GET)
	public String insertReview(String ItemDetailId, Model model){
		
		return "";//ajax사용 출력
	}
	
	@RequestMapping(value = "/insertCart", method = RequestMethod.GET)
	public String insertCart(String ItemId, Model model){
		
		return "";
	}
	
	
}
