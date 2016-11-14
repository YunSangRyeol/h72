package com.project.h72.admin.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
import com.project.h72.admin.vo.Paging;
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
									@RequestParam("order") String order,
									@RequestParam("where") String where, Model model){
		
		
		System.out.println("시작!!" + page + ", " + count + ", " + order + ", " + where);
		
		int countAll = 0;
		
		List<Member> list = null;
		
		if(where.equals("null")){ //조건없음
			countAll = adminService.getMemberCount();
			list = adminService.getMemberList(new Paging(page * + 1, count, order));
			
		}else{ //조건 있음
			String[] wheres = where.split(",");
			
			if(wheres[0].equals("USER_ID")){
				//아이디
				countAll = adminService.getMemberCountWIDnName(wheres[0], wheres[1]);
				list = adminService.getMemberListWIDnName(new Paging(page * + 1, count, order, true, wheres[0], wheres[1]));
			}else if(wheres[0].equals("NAME")){
				//이름
				System.out.println("이ㅏ름으로 검색합니다.");
				
				countAll = adminService.getMemberCountWIDnName(wheres[0], wheres[1]);
				System.out.println("카운트성공" + countAll);
				list = adminService.getMemberListWIDnName(new Paging(page * + 1, count, order, false, wheres[0], wheres[1]));
			}else if(wheres[0].equals("ENROLLDATE")){
				//데이터 검색
				countAll = adminService.getMemberCountWDATE(wheres[1], wheres[2]);		
				list = adminService.getMemberListWDATE(new Paging(page  + 1, count, order, wheres[1], wheres[2]));
			}
		}		
		
		//총 페이지수 계산 : 목록이 최소 1개일 때, 1 page 로 처리하기 위해 0.9 더함
		int endPage = (int)(countAll / (count + 0.9) + 1);		
		
		System.out.println("고!!" + countAll + ", " + endPage + ", "  + " page" + page);
		model.addAttribute("list", list );
		model.addAttribute("countAll", countAll); //총 회원수
		model.addAttribute("endPage", endPage);
		model.addAttribute("nowPage", page);
		model.addAttribute("count", count);
		model.addAttribute("order", order);
		model.addAttribute("where", where);
		
		return "admin/userManager";
	}
	
	
	
	//회원관리 - ID검색
	@RequestMapping(value="adminSID.do", method = RequestMethod.POST)
	public String adminSearchId(@RequestParam("userid") String id, Model model){
		
		
		String where = "USER_ID," + id;

		
		model.addAttribute("page", 1);
		model.addAttribute("count", 10);
		model.addAttribute("order", "USER_ID");
		model.addAttribute("where", where);
		return "redirect:/admin/users";
	}
	
	//회원관리 - 이름검색
	@RequestMapping(value="adminSName.do", method = RequestMethod.POST)
	public String adminSearchName(@RequestParam("username") String name, Model model){
		
		String where = "NAME," + name;

		model.addAttribute("page", 1);
		model.addAttribute("count", 10);
		model.addAttribute("order", "USER_ID");
		model.addAttribute("where", where);
		
		return "redirect:/admin/users";
	}
	
	//회원관리 - 날짜검색
	@RequestMapping(value="adminSDate.do", method = RequestMethod.POST)
	public String adminSearchDate(@RequestParam("start") Date start, @RequestParam("end") Date end, Model model){
		
		String where = "ENROLLDATE," + start + "," + end;

		model.addAttribute("page", 1);
		model.addAttribute("count", 10);
		model.addAttribute("order", "USER_ID");
		model.addAttribute("where", where);
		
		return "redirect:/admin/users";
	}
	
	//회원관리 - 회원 상세 보기
	@RequestMapping(value="whoUser.do", method = RequestMethod.GET)
	public String whoUser(@RequestParam("userid") String id, Model model){
		
		
		Member user = adminService.whoUser(id);
		model.addAttribute("user", user);
		
		return "admin/userDetail";
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
	
	//주문상세보기
	@RequestMapping(value="orderNoDetail.do", method = RequestMethod.GET)
	public String orderNoDetail(@RequestParam("orderNo") String orderNo, Model model){

		Order aa = adminService.orderNoDetail(orderNo);	
		System.out.println("order ;alksdjfa;l" + aa);
		model.addAttribute("order", aa );

		
		return "admin/orderDetail";
		
	}
	
	//주문페이지 전체 변경
	@RequestMapping(value="updateOrderStatus.do", method = RequestMethod.GET)
	public String updateOrderStatus(@RequestParam("changeList") String[] orderNos, @RequestParam("selectStatus") String selectStatus, Model model){
		
		System.out.println(selectStatus);
		int result = adminService.updateOrderStatus(orderNos, selectStatus);
		
		if(result != orderNos.length){
			//오류 발생시...??
			System.out.println("ASDFASDF");
			return null;
		}		

		return "redirect:/admin/order";
		
	}
	
	//주문페이지 status 개별 변경
	@RequestMapping(value="/updateStatusOne.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateStatusOne(@RequestParam("orderNo") String orderNo, 
										@RequestParam("status") String status){
		int result= adminService.updateStatusOne(orderNo, status);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		
		return map;
	}
	//주문페이지 status 배송번호 개별 변경
	@RequestMapping(value="/updateStatusOne1.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateStatusOneTransportNo(@RequestParam("orderNo") String orderNo, 
										@RequestParam("status") String status, @RequestParam("transportNo") String transportNo){
		System.out.println(transportNo + ", " + orderNo + "transportNotransportNo");
		
		int result= adminService.updateStatusOneTransportNo(orderNo, status, transportNo);

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
		@RequestMapping(value="orderASearchUserID.do", method = RequestMethod.GET)
		public String orderASearchUserID(@RequestParam("userid") String id, Model model){
			
			List<Order> list = adminService.orderASearchUserID(id);
			
			model.addAttribute("list", list );
			
			return "admin/adminOrderList";
		}
	
/////////////////CHART/////////////////////////////////////////////////////////
	@RequestMapping(value = "admin/chart", method = RequestMethod.GET)
	public String adminSalesChart(@RequestParam("now") String now, Model model) {
		
		System.out.println("now??" + now);
		GregorianCalendar rightNow = null;
		SimpleDateFormat namesformat = new SimpleDateFormat("MM/dd");
		
		if(now.equals("null")){	
		     rightNow = new GregorianCalendar();	
		     rightNow.add(Calendar.MONTH, 1);
		}else{
			rightNow = new GregorianCalendar(Integer.parseInt(now.substring(0, 4)), Integer.parseInt(now.substring(5, 7)), Integer.parseInt(now.substring(8)));			
		}
				
		now = rightNow.get(Calendar.YEAR) + "-" + rightNow.get(Calendar.MONTH) + "-" +  ( rightNow.get(Calendar.DATE) < 10 ? "0" + rightNow.get(Calendar.DATE) : rightNow.get(Calendar.DATE) );
		
		System.out.println("입력될 now???" + now);
		String now0 = rightNow.get(Calendar.MONTH) + "/" + rightNow.get(Calendar.DATE);
	
		rightNow.add(Calendar.DATE, -1);		
		String now1 = rightNow.get(Calendar.MONTH) + "/" + rightNow.get(Calendar.DATE);
		rightNow.add(Calendar.DATE, -1);		
		String now2 = rightNow.get(Calendar.MONTH) + "/" + rightNow.get(Calendar.DATE);

		rightNow.add(Calendar.DATE, -1);		
		String now3 = rightNow.get(Calendar.MONTH) + "/" + rightNow.get(Calendar.DATE);
		
		rightNow.add(Calendar.DATE, -1);		
		String now4 = rightNow.get(Calendar.MONTH) + "/" + rightNow.get(Calendar.DATE);

		rightNow.add(Calendar.DATE, -1);		
		String now5 = rightNow.get(Calendar.MONTH) + "/" + rightNow.get(Calendar.DATE);

		rightNow.add(Calendar.DATE, -1);		
		String now6 = rightNow.get(Calendar.MONTH) + "/" + rightNow.get(Calendar.DATE);
		
			
		model.addAttribute("now", now);		
		model.addAttribute("now0", now0);	
		model.addAttribute("now1", now1);	
		model.addAttribute("now2", now2);	
		model.addAttribute("now3", now3);	
		model.addAttribute("now4", now4);	
		model.addAttribute("now5", now5);	
		model.addAttribute("now6", now6);	
		
		
		//오늘
		TotalOrder today = adminService.chartToday(now);
		model.addAttribute("today", today);
		System.out.println("today" + today);
		
		//년도별
		List nowYears = adminService.nowYears(now);
		List lastYears = adminService.lastYears(now);
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

	private void GregorianCalendar(int i, int j, int k) {
		// TODO Auto-generated method stub
		
	}
	

	
}
