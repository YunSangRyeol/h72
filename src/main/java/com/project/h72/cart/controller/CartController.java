package com.project.h72.cart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@RequestMapping(value = "order/shopping_cart", method = RequestMethod.GET)
	public String cartView(Model model) {
		
		return "order/shopping_cart";
	}
	
	@RequestMapping(value = "order/shopping_cart", method = RequestMethod.GET)
	public String insertCart(Model model) {
		
		return "order/shopping_cart";
	}
	
	@RequestMapping(value = "order/shopping_cart", method = RequestMethod.GET)
	public String updateCart(Model model) {
		
		return "order/shopping_cart";
	}
	
	@RequestMapping(value = "order/shopping_cart", method = RequestMethod.GET)
	public String deletCart(Model model) {
		
		return "order/shopping_cart";
	}
	
	
	
	
	
}
