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
import com.project.h72.order.vo.Vbank;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService os;
	
	@RequestMapping(value = "/orderAll", method = RequestMethod.GET)
	public String orderForm(@RequestParam("cartAll") String[] cartAll, HttpSession session, Model model,HttpServletRequest request) {
		Member login = (Member) session.getAttribute("loginUser");
		if(!(login==null)){
			List<Cart> orderlist = os.getCartOrder(cartAll);
			model.addAttribute("olist", orderlist);
			
			int result = os.updateCartUserId(session.getId(), login.getUserid());
			
		}else{
			String[] url = request.getRequestURI().split("/"); // /root/test.jsp 까지 얻어온다.
			String forPage = url[url.length-1]; // root빼고 원하는 페이지까지만 선택
			String forQueryString = request.getQueryString(); 
		    request.getSession().setAttribute("forPage", forPage);
		    request.getSession().setAttribute("forQueryString", forQueryString);


		    return "redirect:member/loginPage"; 
		}
		return "order/order";
	}
	
	
	@RequestMapping(value = "/directOrder", method = RequestMethod.GET)
	public String directOrderForm(@RequestParam("cartAll") String[] cartAll, HttpSession session, Model model,HttpServletRequest request) {
		Member login = (Member) session.getAttribute("loginUser");
		if(!(login==null)){
			List<Cart> orderlist = os.getCartOrder(cartAll);
			model.addAttribute("olist", orderlist);
			
		}else{
			String[] url = request.getRequestURI().split("/");
			String forPage = url[url.length-1];
			String forQueryString = request.getQueryString();
		    request.getSession().setAttribute("forPage", forPage);
		    request.getSession().setAttribute("forQueryString", forQueryString);

			System.out.println("controller1: "+forPage+" : "+ forQueryString);

			System.out.println(session.getAttribute("forPage")+"= session1");

		    return "redirect:member/loginPage"; 
			
		}
		
		return "order/order";
	}
	
	
	@RequestMapping(value = "/insertOrder", method = RequestMethod.POST)
	public String insertOrderFinish(HttpServletRequest request,HttpServletResponse response, HttpSession session, Model model) {
		
		Member login = (Member) session.getAttribute("loginUser");
		
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
		String orderStatus = "결제완료";
		System.out.println("deliveryMessage : "+deliveryMessage);
		if(paymethod.equals("가상계좌 입금")){
			orderStatus = "주문접수";
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
		Vbank bankInfo = new Vbank(orderNO, vbank_name, vbank_num, buyer_name);
		
		/*Map<String, String> bankMap = new HashMap<String, String>();
		bankMap.put("orderNo", orderNO);
		bankMap.put("vbankNum", vbank_num);
		bankMap.put("vbankName", vbank_name);
		bankMap.put("vName", buyer_name);*/
		
		
		int resultOrderContents =0;
		for(int i=0; i<itemId.length; i++){
			OrderContents orderContents = new OrderContents(orderNO,itemId[i],itemName[i],itemOption[i],
				itemDetailId[i], itemImg[i], Integer.valueOf(itemQuantity[i]) ,Double.valueOf(itemMileage[i]).intValue(), 
				Integer.valueOf(itemCost[i]), deliveryMessage, kitNY[i].charAt(0));
			System.out.println("orderControllder:"+orderContents);
			
			resultOrderContents = os.insertOrderContents(orderContents);
		}
		
		int resultPoint =0; 
		int usePoint = login.getPoint() - Integer.valueOf(inputMile);
		resultPoint = os.updateOrderPoint(usePoint, userId);
		
		int bankResult = 0;
		bankResult = os.insertBankInfo(bankInfo);
		
		int resultOrder = 0;
		resultOrder = os.insertOrderInfo(order);
		
		if(bankResult>0 && resultOrder>0 && resultOrderContents>0 && resultPoint>0){
			
			int resultCart = os.deleteFinishCart(cartId);
			
			if(resultCart>0){
				model.addAttribute("order", order);
				model.addAttribute("bankInfo", bankInfo);
			}
		}
		
		return "order/order_finish";
	}
	
	
	@RequestMapping(value = "order/order_list", method = RequestMethod.GET)
	public String orderListView(HttpSession session,HttpServletRequest request, Model model) {
		
		Member login = (Member) session.getAttribute("loginUser");
		List<Order> listOrder = new ArrayList<Order>();
		List<Order> clistOrder = new ArrayList<Order>();
		
		if(login==null){
			String[] url = request.getRequestURI().split("/");
			String forPage = "/"+url[url.length-2]+"/"+url[url.length-1];
		    request.getSession().setAttribute("forPage", forPage);
		    
		    return "member/loginPage"; 
		    
		}else{
			
			String userId = login.getUserid();
			Date currentDate = new Date(new java.util.Date().getTime());
			Calendar cal = Calendar.getInstance ( );//오늘 날짜
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
			int listCount =0;
			int clistCount =0;
			String tab = "orderlist";
			if(request.getParameter("tab") != null){
				tab = request.getParameter("tab");
				System.out.println(tab+"-------------------------");
			}
				
			//총 페이지수 계산 : 목록이 최소 1개일 때, 1 page 로 처리하기 위해 0.9 더함
			int maxPage =0;
				
			if(tab.equals("orderCategory")){
				clistCount = os.getClistCount(userId, currentDate, preDate, tab);
				//페이지 단위로 게시글 목록 조회용
				clistOrder = os.selectOrderClist(userId, currentDate, preDate,currentPage,limit,tab);
				maxPage = (int)((double)clistCount / limit + 0.9);
				
			}else{
				listCount = os.getListCount(userId, currentDate, preDate, tab);
				//페이지 단위로 게시글 목록 조회용
				listOrder = os.selectOrderList(userId, currentDate, preDate,currentPage,limit, tab);
				 maxPage = (int)((double)listCount / limit + 0.9);
			}
			
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
			model.addAttribute("tab",tab);
			model.addAttribute("startDate", preDate);
			model.addAttribute("endDate", currentDate);
			
			if(listOrder.isEmpty()||listOrder==null){
				listOrder = null;
			}
			
			if(clistOrder.isEmpty()||clistOrder==null){
				clistOrder = null;
			}
			
		}
		
		model.addAttribute("orderList", listOrder);
		model.addAttribute("reOrderList", clistOrder);
		
		System.out.println("orderList"+clistOrder);
		System.out.println("reOrderList"+listOrder);
		
		return "order/order_list";
	}
	
	
	
	@RequestMapping(value = "/searchOrder", method = RequestMethod.GET)
	public String searchOrder(@RequestParam("page") int page, @RequestParam("start_date") Date startDate, 
			@RequestParam("end_date") Date endDate, @RequestParam("tab") String tab, Model model,HttpSession session,HttpServletRequest request) {
		Member login = (Member) session.getAttribute("loginUser");
		List<Order> listOrder = new ArrayList<Order>();
		List<Order> clistOrder = new ArrayList<Order>();
		
		
		String userId = login.getUserid();
		Date currentDate = new Date(new java.util.Date().getTime());
		Calendar cal = Calendar.getInstance ( );//오늘 날짜를 기준으루..
		cal.add ( cal.MONTH, -3 );
		Date preDate = new Date(cal.getTime().getTime());
	
		
		//페이지 수 처리용 변수 
		int currentPage = 1;
		int limit = 5;	//한 페이지에 5개씩 출력
		
		//전달받은 페이지 값 추출
		if(page >0)
			currentPage = page;
		if(startDate != null)
			preDate = startDate;
		if(endDate!= null)
			currentDate = endDate;
		
		System.out.println("controller:"+currentPage+","+preDate+","+currentDate);
		
		//전체리스트
		int listCount =0;
		int clistCount =0;
		
		//총 페이지수 계산 : 목록이 최소 1개일 때, 1 page 로 처리하기 위해 0.9 더함
		int maxPage =0;
			
		if(tab.equals("orderCategory")){
			clistCount = os.getClistCount(userId, currentDate, preDate, tab);
			//페이지 단위로 게시글 목록 조회용
			clistOrder = os.selectOrderClist(userId, currentDate, preDate,currentPage,limit,tab);
			maxPage = (int)((double)clistCount / limit + 0.9);
			
		}else{
			listCount = os.getListCount(userId, currentDate, preDate, tab);
			//페이지 단위로 게시글 목록 조회용
			listOrder = os.selectOrderList(userId, currentDate, preDate,currentPage,limit, tab);
			 maxPage = (int)((double)listCount / limit + 0.9);
		}
		
		//현재 페이지에 보여줄 시작 페이지 수 (1, 6, 11, .....)
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		//현재 페이지에 보여줄 마지막 페이지 수 (5, 10, 15, .....)
		int endPage = startPage + limit - 1;
		if(maxPage < endPage)
			endPage = maxPage;
		
		model.addAttribute("startPage", startPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		
		System.out.println("controller page:"+startPage+", "+endPage+", "+maxPage);
		if(listOrder.isEmpty()||listOrder==null){
			listOrder = null;
		}
		
		if(clistOrder.isEmpty()||clistOrder==null){
			clistOrder = null;
		}
		
	
	
		model.addAttribute("orderList", listOrder);
		model.addAttribute("reOrderList", clistOrder);
		model.addAttribute("tab",tab);
		
		System.out.println("orderList"+listOrder);
		System.out.println("reOrderList"+clistOrder);
	
		return "order/order_list";
	}

	
	@RequestMapping(value = "order/order_detail", method = RequestMethod.GET)
	public String orderDeitailView(@RequestParam("orderNo") String orderNo,Model model) {
		Order order = os.selectOrderDetail(orderNo);
		List<OrderContents> oclist = new ArrayList<OrderContents>();
		oclist = os.selectOrderContens(orderNo);
		Vbank bank = os.selectVbank(orderNo);
		
		model.addAttribute("detailOrder", order);
		model.addAttribute("orderContents", oclist);
		model.addAttribute("bank", bank);
		System.out.println("orderContents: "+oclist);
		
		return "order/order_detail";
	}
	
	
	@RequestMapping(value = "/updateStatusCancle", method = RequestMethod.GET)
	public String updateStatusCancle(@RequestParam("orderNo") String orderNo, @RequestParam("status") String status, @RequestParam("page") String page,Model model) {
		
		System.out.println("===="+orderNo+"====="+status);
		int result =0;
		if(status.equals("결제완료")){
			status = "취소요청";
			result=os.updateStatusCancle(orderNo, status);
		}else{
			status="입금전취소";
			result=os.updateStatusCancle(orderNo, status);
		}
		
		System.out.println("updateCancle:"+result);
		
		if(page.equals("detail")){
			return "redirect:order/order_detail?orderNo="+orderNo;
		}
		
		
		
		return "redirect:order/order_list";
	}
	
	
	@RequestMapping(value = "/orderConfirm", method = RequestMethod.GET)
	public String updateOrderConfirm(@RequestParam("point") int point,@RequestParam("orderNo") String orderNo, @RequestParam("page") String page,HttpSession session, Model model) {
		
		Member login = (Member) session.getAttribute("loginUser");
		String userId = login.getUserid();
		int resultStatus =0;
		int resultUser =0;
		int addPoint = login.getPoint() + point;
		resultStatus=os.updateOrderConfirm(orderNo);
		resultUser=os.updateUserPoint(userId, addPoint);	
	
		if(resultStatus>0 && resultUser>0){
			System.out.println("구매확정 성공!, 적립금 얻기 성공!");
		}
		if(page.equals("detail")){
			return "redirect:order/order_detail?orderNo="+orderNo;
		}
		
		return "redirect:order/order_list";
	}
	
	
	
	@RequestMapping(value = "/payments/cancel", method = RequestMethod.GET)
	public String getMessage(Model model) {
		
		String test_already_cancelled_imp_uid = "imp_448280090638";
		/*CancelData cancel_data = new CancelData(test_already_cancelled_imp_uid, true); //imp_uid를 통한 전액취소
		IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
		
		assertNull(payment_response.getResponse());*/ // 이미 취소된 거래는 response가 null이다
		
		return "redirect:order/order_list";
	}

}
