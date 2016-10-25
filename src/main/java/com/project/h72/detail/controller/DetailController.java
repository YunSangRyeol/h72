package com.project.h72.detail.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.h72.member.controller.MemberController;

@Controller
@RequestMapping(value="/detail", method = RequestMethod.GET)
public class DetailController {
	private static final Logger logger = LoggerFactory.getLogger(DetailController.class);
	
	@RequestMapping(value = "/selectDetailItem", method = RequestMethod.GET)
	public String selectDetailItem(String ItemDetailId, Model model){
		
		return "detail/item";//item_detail_id 로 1범주 조회(ex.방한용품/장갑/보온포)
	}
	
	@RequestMapping(value = "/selectItem", method = RequestMethod.GET)
	public String selectItem(String ItemDetailId, Model model){
		
		return "detail/detail";//item_id 로 2범주 조회(ex.방한용품옵션/장갑옵션/보온포옵션)
	}
	
	@RequestMapping(value = "/insertReview", method = RequestMethod.GET)
	public String insertReview(String ItemDetailId, Model model){
		
		return null;//ajax사용 출력
	}
	
	@RequestMapping(value = "/insertCart", method = RequestMethod.GET)
	public String insertCart(String ItemId, Model model){
		
		return null;
	}
	
	@RequestMapping(value = "/selectReview", method = RequestMethod.GET)
	public String selectReview(String ItemId, Model model){
		
		return "detail/review";
	}
	
	
}
