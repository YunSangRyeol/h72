package com.project.h72.order.controller;

import java.util.*;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.h72.cart.vo.Cart;
import com.project.h72.member.vo.Member;
import com.project.h72.order.service.OrderService;
import com.project.h72.order.vo.Order;
import com.project.h72.order.vo.OrderContents;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService os;
	
	@RequestMapping(value = "/orderAll", method = RequestMethod.GET)
	public String orderForm(@RequestParam("cartAll") String[] cartAll, HttpSession session, Model model) {
		Member login = (Member) session.getAttribute("loginUser");
		if(!(login==null)){
			List<Cart> orderlist = os.getCartOrder(cartAll);
			model.addAttribute("olist", orderlist);
			
		}
		return "order/order";
	}
	
	
	@RequestMapping(value = "/directOrder", method = RequestMethod.GET)
	public String directOrderForm(@RequestParam("cartAll") String[] cartAll, HttpSession session, Model model) {
		Member login = (Member) session.getAttribute("loginUser");
		if(!(login==null)){
			List<Cart> orderlist = os.getCartOrder(cartAll);
			model.addAttribute("olist", orderlist);
			
		}
		return "order/order";
	}
	
	
	@RequestMapping(value = "/insertOrder", method = RequestMethod.POST)
	public String insertOrderFinish(HttpServletRequest request,HttpServletResponse response, HttpSession session, Model model) {
		System.out.println("결제페이지 넘어옴!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		Member login = (Member) session.getAttribute("loginUser");
		/*
		 
		ORDER_NO 
		USER_ID
		DELEVERY_NAME : rname
		MAIN_IMG_N1 : item_img
		ITEM_NAME_N1 : item_name
		ITEM_OPTION_NAME_N1 : item_option
		TOTAL_QUANTITY : item_quantity
		KINDS_QUANTITY
		TOTAL_PRICE : item_cost
		PAYMENT_METHOD : payMethodName
		PYMNET_POINT : input_mile
		TOTAL_SAVING_POINT : item_mileage_all
		DELEVERY_PEE : 2500
		PHONE : rphone2
		POST_NUM : rpostnum
		ADDRESS :raddress
		ADDRESS_DETAIL : raddressDetail
		DELIVERY_MESSAGE : omessage
		ORDER_STATUS : 주문접수
		ORDER_CHANGE : null
		ENROLL_DATE : sysdate
		*/
		
		String[] cartId = request.getParameterValues("cartId");
		String orderNO = request.getParameter("orderNo");
		String userId = login.getUserid();
		String deleveryName =request.getParameter("rname");
		String[] itemImg= request.getParameterValues("item_img");
		String[] itemName = request.getParameterValues("item_name");
		String[] itemOption = request.getParameterValues("item_option");
		String[] itemQuantity = request.getParameterValues("item_quantity");
		String totalPrice = request.getParameter("totalPrice");
		int totalQuantity=0;
		for(int i=0; i<itemQuantity.length; i++){
			totalQuantity += Integer.valueOf(itemQuantity[i]);
		}
		String[] itemCost = request.getParameterValues("item_cost");
		String paymethod = request.getParameter("payMethodName");
		String inputMile = request.getParameter("input_mile");
		if(inputMile =="" || inputMile==null){
			inputMile = "0";
		}
		String[] itemMileage = request.getParameterValues("item_mileage");
		int totalMileage=0;
		for(int i=0; i<itemMileage.length; i++){
			totalMileage += Double.valueOf(itemMileage[i]);
		}
		int deliveryPee = 0;
		if(Integer.valueOf(totalPrice) < 80000){
			deliveryPee = 2500;
		}
		String[] rphone = request.getParameterValues("rphone2");
		String phone="";
		for(int i=0; i<rphone.length; i++){
			if(i< rphone.length-1){
				phone += rphone[i]+"-";
			}else{
				phone += rphone[i];
			}
			
		}
		String[] kitNY = request.getParameterValues("cartKitNY");
		String[] itemId = request.getParameterValues("itemId");
		String[] itemDetailId = request.getParameterValues("itemDetailId");
		
		
		String postNum = request.getParameter("rpostnum");
		String address = request.getParameter("raddress");
		String addressDetail = request.getParameter("raddressDetail");
		String deliveryMessage = request.getParameter("omessage");
		System.out.println("deliveryMessage : "+deliveryMessage);
		if(deliveryMessage==null || deliveryMessage ==""){
			deliveryMessage ="-";
		}
		String orderStatus = "배송 준비중";
		System.out.println("deliveryMessage : "+deliveryMessage);
		if(paymethod.equals("가상계좌 입금")){
			orderStatus = "입금전";
		}
		String orderChange = "-";
		java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
		
		Order order = new Order(orderNO, userId, deleveryName, itemImg[0], itemName[0],
				itemOption[0], totalQuantity, itemName.length, Integer.valueOf(totalPrice), paymethod,
				Integer.valueOf(inputMile), totalMileage, deliveryPee, phone, postNum, address,
				addressDetail, deliveryMessage, orderStatus, orderChange, date);
		
		System.out.println("orderController : "+order);
		
		
		String vbank_num = request.getParameter("vbank_num");
		String vbank_name = request.getParameter("vbank_name");
		String buyer_name = request.getParameter("buyer_name");
		System.out.println("vbank_num:"+vbank_num +"vbank_name"+vbank_name+"buyer_name:"+buyer_name);
		Map<String, String> bankMap = new HashMap<String, String>();
		bankMap.put("orderNo", orderNO);
		bankMap.put("vbankNum", vbank_num);
		bankMap.put("vbankName", vbank_name);
		bankMap.put("vName", buyer_name);
		
		
		int resultOrderContents =0;
		for(int i=0; i<itemId.length; i++){
			OrderContents orderContents = new OrderContents(orderNO,itemId[i],itemName[i],itemOption[i],
				itemDetailId[i], itemImg[i], Integer.valueOf(itemQuantity[i]) ,Double.valueOf(itemMileage[i]).intValue(), 
				Integer.valueOf(itemCost[i]), deliveryMessage, kitNY[i].charAt(0));
			System.out.println("orderControllder:"+orderContents);
			
			resultOrderContents = os.insertOrderContents(orderContents);
		}
		
		
		int bankResult = 0;
		bankResult = os.insertBankInfo(bankMap);
		
		int resultOrder = 0;
		resultOrder = os.insertOrderInfo(order);
		
		if(bankResult>0 && resultOrder>0 && resultOrderContents>0){
			
			int resultCart = os.deleteFinishCart(cartId);
			
			if(resultCart>0){
				model.addAttribute("order", order);
				model.addAttribute("bankInfo", bankMap);
			}
		}
		
		return "order/order_finish";
	}
	
	
	@RequestMapping(value = "order/order_list", method = RequestMethod.GET)
	public String orderListView(HttpSession session,HttpServletRequest request, Model model) {
		
		Member login = (Member) session.getAttribute("loginUser");
		List<Order> listOrder = new ArrayList<Order>();
		
		if(login==null){
			
		 	return "member/loginPage";
		}else{
			
			String userId = login.getUserid();
			Date currentDate = new Date(new java.util.Date().getTime());
			Calendar cal = Calendar.getInstance ( );//오늘 날짜를 기준으루..
			cal.add ( cal.MONTH, -3 );
			Date preDate = new Date(cal.getTime().getTime());
			System.out.println(preDate+" , "+currentDate);
			
			
			//페이지 수 처리용 변수 
			int currentPage = 1;
			int limit = 5;	//한 페이지에 10개씩 출력
			
			//전달받은 페이지 값 추출
			if(request.getParameter("page") != null)
				currentPage = Integer.parseInt(request.getParameter("page"));
			
			//전체리스트 갯수
			int listCount = os.getListCount(userId, currentDate, preDate);
			//페이지 단위로 게시글 목록 조회용
			listOrder = os.selectOrderList(userId, currentDate, preDate,currentPage,limit);
			
			//총 페이지수 계산 : 목록이 최소 1개일 때, 1 page 로 처리하기 위해 0.9 더함
			int maxPage = (int)((double)listCount / limit + 0.9);
			//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21, .....)
			int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
			//현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30, .....)
			int endPage = startPage + limit - 1;
			if(maxPage < endPage)
				endPage = maxPage;
			
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("startPage", startPage);
			
			
			if(listOrder.isEmpty()||listOrder==null){
				listOrder = null;
			}
			
		}
		
		model.addAttribute("orderList", listOrder);
		
		System.out.println(listOrder);
		
		return "order/order_list";
	}
	
	
	
	@RequestMapping(value = "/searchOrder", method = RequestMethod.GET)
	public String searchOrder(@RequestParam("page") String page, @RequestParam("start_date") Date startDate, @RequestParam("end_date") Date endDate, Model model,HttpSession session,HttpServletRequest request) {
		Member login = (Member) session.getAttribute("loginUser");
		List<Order> listOrder = new ArrayList<Order>();
		
		System.out.println("controller:"+page+","+startDate+","+endDate);
		
		int getPage = Integer.valueOf(page);
		
		String userId = login.getUserid();
		Date currentDate = new Date(new java.util.Date().getTime());
		Calendar cal = Calendar.getInstance ( );//오늘 날짜를 기준으루..
		cal.add ( cal.MONTH, -3 );
		Date preDate = new Date(cal.getTime().getTime());
		System.out.println(preDate+" , "+currentDate);
		
		
		//페이지 수 처리용 변수 
		int currentPage = 1;
		int limit = 5;	//한 페이지에 10개씩 출력
		
		//전달받은 페이지 값 추출
		if(getPage>0)
			currentPage = getPage;
		if(startDate != null)
			preDate = startDate;
		if(endDate!= null)
			currentDate = endDate;
		
		//전체리스트 갯수
		int listCount = os.getListCount(userId, currentDate, preDate);
		//페이지 단위로 게시글 목록 조회용
		listOrder = os.selectOrderList(userId, currentDate, preDate,currentPage,limit);
		
		//총 페이지수 계산 : 목록이 최소 1개일 때, 1 page 로 처리하기 위해 0.9 더함
		int maxPage = (int)((double)listCount / limit + 0.9);
		//현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21, .....)
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		//현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30, .....)
		int endPage = startPage + limit - 1;
		if(maxPage < endPage)
			endPage = maxPage;
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("endPage", endPage);
		
		if(listOrder.isEmpty()||listOrder==null){
			listOrder = null;
		}
		model.addAttribute("orderList", listOrder);
		System.out.println(listOrder);
		
		
		
		return "order/order_list";
	}

	
	@RequestMapping(value = "order/order_detail", method = RequestMethod.GET)
	public String orderDeitailView(@RequestParam("orderNo") String orderNo,Model model) {
		
		return "order/order_detail";
	}
	
	
	@RequestMapping(value = "/reorder", method = RequestMethod.GET)
	public String searchReorder(Model model) {
		
		return null;
	}

	

}
