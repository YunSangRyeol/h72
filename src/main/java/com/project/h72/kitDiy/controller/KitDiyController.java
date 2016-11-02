package com.project.h72.kitDiy.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.h72.kitDiy.service.KitDiyService;
import com.project.h72.kitDiy.vo.KitDiy;
@Controller

@RequestMapping("/kitDiy")
public class KitDiyController {
	@Autowired private KitDiyService service;
	
	@RequestMapping(value = "/kitDiyView", method = RequestMethod.GET)
	public String kitDiyView(Locale locale, Model model) {
		/*모든 상품 정보 가져오기 */
		List<KitDiy> itemAllView = service.itemAllViewSelect();
		List<KitDiy> itemDetailView = service.itemDetailViewSelect();
		model.addAttribute("itemAllView",itemAllView);
		model.addAttribute("itemDetailView",itemDetailView);
		return "detail/kitDiy";
	}
	
	@RequestMapping(value = "/kitDiyOrder", method = RequestMethod.GET)
	public String kitDiyOrder(Locale locale, Model model) {
		
		return "kityDiy";
	}
	
	@RequestMapping(value = "/kitDiyCart", method = RequestMethod.GET)
	public String kitDiyCart(Locale locale, Model model) {
		
		return "kityDiy";
	}
	

}
