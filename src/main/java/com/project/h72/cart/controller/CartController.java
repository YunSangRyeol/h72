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
	public String shopping_cart(Model model) {
		
		String test = "test가 잘되는건가???????";
		model.addAttribute("test", test );
		
		return "order/shopping_cart";
	}
}
