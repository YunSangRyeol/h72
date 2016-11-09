package com.project.h72.admin.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.h72.admin.service.AdminService;
import com.project.h72.admin.vo.TotalOrder;
import com.project.h72.member.vo.Member;
import com.project.h72.order.vo.Order;
import com.project.h72.order.vo.OrderContents;

import ch.qos.logback.core.net.SyslogOutputStream;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	//멤버회원정보 페이지
	@RequestMapping(value="member/memberUpdate", method = RequestMethod.GET)
	public String memberUpdate(HttpSession session, Model model){
		
		Member user = (Member) session.getAttribute("loginUser");		
		Member loginUser = adminService.memberUPage(user.getUserid());
		
		session.setAttribute("loginUser", loginUser);
		model.addAttribute("loginUser", loginUser);
		
		return "member/memberUpdate";		
	}
	
	//정보변경
	@RequestMapping(value="mModify.do", method = RequestMethod.POST)
	public String memberModify(HttpSession session, @RequestParam("userpassNew") String userpwd, @RequestParam("postnum") String postnum,
			@RequestParam("address") String address, @RequestParam("addressDetail") String addressDetail,
			@RequestParam("phone1") String phone1, @RequestParam("phone2") String phone2, @RequestParam("phone3") String phone3,
			@RequestParam("email1") String email1, @RequestParam("email2") String email2){
			
		Member login = (Member) session.getAttribute("loginUser");
		Map<String, String> newInfo = new HashMap<String, String>();
			newInfo.put( "userid", login.getUserid() );
			newInfo.put( "userpwd", userpwd );
			newInfo.put( "postnum", postnum );
			newInfo.put( "address", address );
			newInfo.put( "addressDetail", addressDetail );
			newInfo.put( "phone", phone1 + "-" + phone2 + "-" + phone3 );
			newInfo.put( "email", email1 + "@" + email2 );
			
			System.out.println(newInfo);
			
		int result = adminService.memberModify(newInfo);
		
		if(result == 0){
			return null;
		}		
		
		return "redirect:/member/memberUpdate";
	}
	
	//회원탈퇴
	@RequestMapping(value="deleteMe.do", method = RequestMethod.GET)
	public String deleteMe(HttpSession session){
		Member login = (Member) session.getAttribute("loginUser");
		int result = adminService.deleteMe(login.getUserid());
		
		return "redirect:/logout.do";
	}
	
	
///////////////////////////////////////////////////////////////////////////////////////////////////
	//회원관리 페이지 
	@RequestMapping(value="admin/users", method = RequestMethod.GET)
	public String adminMemberManager(@RequestParam("page") int page,
						       		@RequestParam("count") int count,
									@RequestParam("order") String order, Model model){
		
		
		System.out.println("시작!!" + page + ", " + count + ", " + order);
		
		
		//총 유저 수 확인
		int countAll = adminService.getMemberCount();
		System.out.println(countAll);
		

		List<Member> list = adminService.getMemberList(page * + 1, count, order );
		
		
		//총 페이지수 계산 : 목록이 최소 1개일 때, 1 page 로 처리하기 위해 0.9 더함
		int endPage = (int)(countAll / (count + 0.9));		
		
		System.out.println("고!!" + countAll + ", " + endPage + ", "  + " page" + page);
		model.addAttribute("list", list );
		model.addAttribute("countAll", countAll); //총 회원수
		model.addAttribute("endPage", endPage);
		model.addAttribute("nowPage", page);
		model.addAttribute("count", count);
		model.addAttribute("order", order);
		
		
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

//////////////////////////////////////////////////////////////////////////////////////////
	//주문내역 페이지 
	@RequestMapping(value="admin/order", method = RequestMethod.GET)
	public String adminOrderView(Model model){
		
		List<Order> list = adminService.getOrderList();
		List<OrderContents> listContents = adminService.getOrderContentsList();
		
		System.out.println(list);
		System.out.println(listContents);
		
		model.addAttribute("list", list );
		model.addAttribute("listContents", listContents );
		
		return "admin/adminOrderList";
	}
	
	//주문페이지 전체 변경
	@RequestMapping(value="updateOrderStatus.do", method = RequestMethod.GET)
	public String updateOrderStatus(@RequestParam("changeList") String[] orderNos, @RequestParam("selectStatus") String selectStatus, Model model){
		
		System.out.println(selectStatus);
		int result = adminService.updateOrderStatus(orderNos, selectStatus);
		
		if(result != orderNos.length){
			//오류 발생시...??
			return null;
		}		

		return "redirect:/admin/order";
		
	}
	
	//주문페이지 status 개별 변경
	@RequestMapping(value="/updateStatusOne.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateStatusOne(@RequestParam("orderNo") String orderNo, @RequestParam("status") String status){
		
		int result= adminService.updateStatusOne(orderNo, status);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		
		return map;
	}
	
	//주문페이지 change 개별 변경
		@RequestMapping(value="/updateChangeOne.do", method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> updateChangeOne(@RequestParam("orderNo") String orderNo, @RequestParam("change") String change){
			
			int result= adminService.updateChangeOne(orderNo, change);
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("result", result);
			
			return map;
		}

	//주문페이지 날짜 검색
	@RequestMapping(value="orderASearchDate.do", method = RequestMethod.POST)
	public String orderASearchDate(@RequestParam("start") Date start, @RequestParam("end") Date end, Model model){
		
		List<Order> list = adminService.orderASearchDate(start, end);
		
		model.addAttribute("list", list );
		
		return "admin/adminOrderList";
	}
		
	//회원관리 - ID검색
		@RequestMapping(value="orderASearchUserID.do", method = RequestMethod.POST)
		public String orderASearchUserID(@RequestParam("userid") String id, Model model){
			
			List<Order> list = adminService.orderASearchUserID(id);
			
			model.addAttribute("list", list );
			
			return "admin/adminOrderList";
		}
	
//////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "admin/chart", method = RequestMethod.GET)
	public String adminSalesChart(@RequestParam("now") String now, Model model) {
		
//		java.util.Date date = new java.util.Date();
		
		
		
		if(now.equals("null")){		
			String nowDate = new SimpleDateFormat("YYYY-MM-dd").format(new java.util.Date());
			now = nowDate;
		}else{
//			java.util.Date date = Calendar.set(now.substring(0, 4), now.substring(0, 2), now.substring(0, 2));
		}
		
		/*
		Map<String, String> date = new HashMap<String, String>();
		date.put( "year", now.substring(0, 4));*/
	/*	date.put( "month", end );
		date.put( "day", end );*/
		
		model.addAttribute("now", now);		
		
		//오늘
		TotalOrder today = adminService.chartToday(now);
		model.addAttribute("today", today);
		
		//년도별
		List nowYears = adminService.nowYears(now);
		List lastYears = adminService.nowYears(now);
		model.addAttribute("nowYears", nowYears);
		model.addAttribute("lastYears", lastYears);
		
		//주간
		List thisWeek = adminService.thisWeek(now);
		List LastWeek = adminService.LastWeek(now);
		model.addAttribute("thisWeek", thisWeek);
		model.addAttribute("LastWeek", LastWeek);
		
		//카테고리
		TotalOrder category = adminService.category(now);
		model.addAttribute("category", category);
		
		//kit
		TotalOrder kit = adminService.kit(now);
		model.addAttribute("kit", kit);
		
		return "admin/salesChart";
	}
	

	
}
