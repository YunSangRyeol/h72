package com.project.h72.ProductEnroll.controller;

import java.util.Locale;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class ProductEnrollController {

	@RequestMapping(value = "/ProductEnrollView", method = RequestMethod.GET)
	public String ProductEnrollView(Locale locale, Model model) {
		
		return "productEnroll";
	}
	
	@RequestMapping(value = "/ProductEnrollInsert", method = RequestMethod.GET)
	public String ProductEnrollInsert(Locale locale, Model model) {
		
		return "index";
	}
	
	

}
