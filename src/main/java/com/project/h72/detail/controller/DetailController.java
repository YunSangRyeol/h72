package com.project.h72.detail.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.h72.member.controller.MemberController;

@Controller
public class DetailController {
	private static final Logger logger = LoggerFactory.getLogger(DetailController.class);

	/*@RequestMapping(value="/", method= RequestMethod.POST)*/
	@RequestMapping(value = "/selectItem", method = RequestMethod.GET)
	public String selectItem(String ItemDetailId, Model model){
		
		return null;
	}
	
	@RequestMapping(value = "/insertReview", method = RequestMethod.GET)
	public String insertReview(String ItemDetailId, Model model){
		
		return null;//ajax사용 출력
	}
	
	@RequestMapping(value = "/insertCart", method = RequestMethod.GET)
	public String insertCart(String ItemId, Model model){
		
		return null;
	}
	
	
}
