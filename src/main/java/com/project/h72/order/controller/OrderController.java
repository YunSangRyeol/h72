package com.project.h72.order.controller;

import java.util.List;

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
	public String orderFinishForm(HttpServletRequest request,HttpServletResponse response, HttpSession session, Model model) {
		System.out.println("결제페이지 넘어옴!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		Member login = (Member) session.getAttribute("loginUser");
		String orderNO = request.getParameter("orderNo");
		String userId = login.getUserid();
		String[] itemImg= request.getParameterValues("item_img");
		String[] itemName = request.getParameterValues("item_name");
		String[] itemOption = request.getParameterValues("item_option");
		String[] itemQuantity = request.getParameterValues("item_quantity");
		String[] itemCost = request.getParameterValues("item_cost");
		String paymethod = request.getParameter("payMethodName");
		String[] inputMile = request.getParameterValues("input_mile");
		String totalPoint = request.getParameter("item_mileage_all");
		
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
