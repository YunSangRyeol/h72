package com.project.h72.kitDiy.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class KitDiyController {

	@RequestMapping(value = "/kitDiy/kitDiyView", method = RequestMethod.GET)
	public String kitDiyView(Locale locale, Model model) {
		
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
