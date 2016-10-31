package com.project.h72.admin.controller;

import java.sql.Date;
import java.util.List;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.h72.admin.service.AdminService;
import com.project.h72.member.vo.Member;
import com.project.h72.order.vo.Order;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	
	//회원관리 페이지 
	@RequestMapping(value="admin/users", method = RequestMethod.GET)
	public String adminMemberManager(Model model){
		
		List<Member> list = adminService.getMemberList();
		model.addAttribute("list", list );
		
		return "admin/userManager";
	}
	
	//회원관리 - ID검색
	@RequestMapping(value="adminSID.do", method = RequestMethod.POST)
	public String adminSearchId(@RequestParam("userid") String id, Model model){
		
		List<Member> list = adminService.adminSearchId(id);
		
		model.addAttribute("list", list );
		
		return "admin/userManager";
	}
	
	//회원관리 - 이름검색
	@RequestMapping(value="adminSName.do", method = RequestMethod.POST)
	public String adminSearchName(@RequestParam("username") String name, Model model){
		
		List<Member> list = adminService.adminSearchName(name);
		
		model.addAttribute("list", list );
		
		return "admin/userManager";
	}
	
	//회원관리 - 날짜검색
	@RequestMapping(value="adminSDate.do", method = RequestMethod.POST)
	public String adminSearchDate(@RequestParam("start") Date start, @RequestParam("end") Date end, Model model){
		
		List<Member> list = adminService.adminSearchDate(start, end);
		
		model.addAttribute("list", list );
		
		return "admin/userManager";
	}
	
	//주문내역 페이지 
	@RequestMapping(value="admin/order", method = RequestMethod.GET)
	public String adminOrderView(Model model){
		
		List<Order> list = adminService.getOrderList();
		model.addAttribute("list", list );
		
		return "admin/adminOrderList";
	}
	
/*	@RequestMapping(value = "admin/order", method = RequestMethod.GET)
	public String adminOrderView(Locale locale, Model model) {
		
		return "admin/adminOrderList";
	}*/
	
	@RequestMapping(value = "admin/chart", method = RequestMethod.GET)
	public String adminSalesChart(Locale locale, Model model) {
		
		return "admin/salesChart";
	}
	
	@RequestMapping(value = "member/update", method = RequestMethod.GET)
	public String memberUpdate(Locale locale, Model model) {
		
		return "member/memberUpdate";
	}
	
	
}
