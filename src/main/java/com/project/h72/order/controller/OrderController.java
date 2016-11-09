package com.project.h72.order.controller;

import java.util.*;

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
		
		String postNum = request.getParameter("rpostnum");
		String address = request.getParameter("raddress");
		String addressDetail = request.getParameter("raddressDetail");
		String deliveryMessage = request.getParameter("omessage");
		if(deliveryMessage==null){
			deliveryMessage ="-";
		}
		String orderStatus = "주문접수";
		String orderChange = "-";
		
		Order order = new Order(orderNO, userId, deleveryName, itemImg[0], itemName[0],
				itemOption[0], totalQuantity, itemName.length, Integer.valueOf(totalPrice), paymethod,
				Integer.valueOf(inputMile), totalMileage, deliveryPee, phone, postNum, address,
				addressDetail, deliveryMessage, orderStatus, orderChange);
		
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
		
		int bankResult = 0;
		bankResult = os.insertBankInfo(bankMap);
		
		int result = 0;
		result = os.insertOrderInfo(order);
		
		if(bankResult>0 && result>0){
			model.addAttribute("orderList", order);
			model.addAttribute("bankInfo", bankMap);
		}
		
		
	
		
		
		
		return "order/order_finish";
	}
	
	
	@RequestMapping(value = "order/order_list", method = RequestMethod.GET)
	public String orderListView(Model model) {
		
		return "order/order_list";
	}
	
	@RequestMapping(value = "/orderdetail", method = RequestMethod.GET)
	public String orderDeitailView(Model model) {
		
		return null;
	}
	
	
	@RequestMapping(value = "/searchOrder", method = RequestMethod.GET)
	public String searchOrder(Model model) {
		
		return null;
	}

	@RequestMapping(value = "/reorder", method = RequestMethod.GET)
	public String searchReorder(Model model) {
		
		return null;
	}

	

}
