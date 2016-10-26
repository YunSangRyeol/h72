package com.project.h72.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {
	
	@RequestMapping(value = "order/order", method = RequestMethod.GET)
	public String orderForm(Model model) {
		
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
