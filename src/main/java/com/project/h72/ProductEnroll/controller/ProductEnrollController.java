package com.project.h72.ProductEnroll.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductEnrollController {

	@RequestMapping(value = "productEnroll/productEnrollView", method = RequestMethod.GET)
	public String ProductEnrollView(Locale locale, Model model) {
		
		return "admin/productEnroll";
	}
	
	@RequestMapping(value = "/ProductEnrollInsert", method = RequestMethod.GET)
	public String ProductEnrollInsert(Locale locale, Model model) {
		
		return "index";
	}
	
	

}
