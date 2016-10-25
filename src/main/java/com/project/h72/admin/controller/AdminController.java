package com.project.h72.admin.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@RequestMapping(value = "admin/order", method = RequestMethod.GET)
	public String adminOrderView(Locale locale, Model model) {
		
		return "admin/salesChart";
	}
	
	@RequestMapping(value = "admin/user", method = RequestMethod.GET)
	public String adminUserManager(Locale locale, Model model) {
		
		return "admin/userManager";
	}
	
	@RequestMapping(value = "admin/chart", method = RequestMethod.GET)
	public String adminSalesChart(Locale locale, Model model) {
		
		return "admin/salesChart";
	}
	
	@RequestMapping(value = "member/update", method = RequestMethod.GET)
	public String memberUpdate(Locale locale, Model model) {
		
		return "member/memberUpdate";
	}
	
}
