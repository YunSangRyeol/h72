package com.project.h72.order.controller;

import java.util.List;

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
	
	@RequestMapping(value = "order/order_finish", method = RequestMethod.GET)
	public String orderFinishForm(Model model) {
		
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
