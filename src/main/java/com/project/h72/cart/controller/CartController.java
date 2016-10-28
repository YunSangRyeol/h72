package com.project.h72.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.h72.cart.service.CartService;
import com.project.h72.cart.vo.Cart;
import com.project.h72.member.vo.Member;


@Controller
public class CartController {
	
	@Autowired
	private CartService cs;
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@RequestMapping(value = "order/shopping_cart", method = RequestMethod.GET)
	public String cartView(HttpSession session,  Model model) throws Exception {
		Member login = (Member) session.getAttribute("loginUser");
		if(!(login==null)){
			String userid = login.getUserid();
			System.out.println("cartcontroller:"+userid+"============================================================");
			List<Cart> clist = cs.getCartList(userid);
			System.out.println("cartcontroller"+clist+"==========================================================");
			if(clist.isEmpty()){
				clist = null;
			}
			
			model.addAttribute("clist", clist);
			
			
		}else{
			
		}
		
		
		return "order/shopping_cart";
	}
	

	
	@RequestMapping(value = "/updateCart", method = RequestMethod.GET)
	public String updateCart(Model model) {
		
		return null;
	}
	
	@RequestMapping(value = "/deletCart", method = RequestMethod.GET)
	public String deletCart(Model model) {
		
		return null;
	}
	
	
	
	
	
}
