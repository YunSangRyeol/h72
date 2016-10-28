package com.project.h72.admin.controller;

import java.util.List;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.h72.admin.service.AdminService;
import com.project.h72.member.vo.Member;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@RequestMapping(value = "admin/order", method = RequestMethod.GET)
	public String adminOrderView(Locale locale, Model model) {
		
		return "admin/adminOrderList";
	}
	
	@RequestMapping(value="adminM.do", method = RequestMethod.GET)
	public String adminMemberManager(Locale locale, Model model){
		System.out.println("컨트롤러 실행");
		
		List<Member> list = adminService.getMemberList();
		
		model.addAttribute("list", list );
		
		return "admin/userManager";
	}
	
/*	@RequestMapping(value = "admin/user", method = RequestMethod.GET)
	public String adminUserManager(Locale locale, Model model) {
		
		return "admin/userManager";
	}*/
	
	@RequestMapping(value = "admin/chart", method = RequestMethod.GET)
	public String adminSalesChart(Locale locale, Model model) {
		
		return "admin/salesChart";
	}
	
	@RequestMapping(value = "member/update", method = RequestMethod.GET)
	public String memberUpdate(Locale locale, Model model) {
		
		return "member/memberUpdate";
	}
	
	@RequestMapping(value = "chart", method = RequestMethod.GET)
	public String admin(Locale locale, Model model) {
		
		return "admin/salesChart";
	}
	
}
