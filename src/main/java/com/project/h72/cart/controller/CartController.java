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
		userCartList(session,model);
		
		return "order/shopping_cart";
	}
		

	@RequestMapping(value = "/updateQuantity", method = RequestMethod.GET)
	public String updateQuantity(@RequestParam("itemId") String itemid, @RequestParam("quantity") String quantity, HttpSession session,Model model) throws Exception {
		
		int result = cs.updateQuantity(itemid, Integer.parseInt(quantity));
		
		if(result>0){
			userCartList(session,model);
		}
		
		return "order/shopping_cart";
	}
	
	
	@RequestMapping(value = "/emptyBasket", method = RequestMethod.GET)
	public String deleteEmptyBasket(HttpSession session, Model model) throws Exception {
		
		Member login = (Member) session.getAttribute("loginUser");
		String userid = login.getUserid();
		int result = cs.deleteEmptyBasket(userid);
		
		if(result>0){
			if(!(login==null)){
				
				List<Cart> clist = cs.getCartList(userid);
				if(clist.isEmpty()||clist==null){
					clist = null;
				}
				
				model.addAttribute("clist", clist);
				
			}
			
		}
		
		
		return "order/shopping_cart";
	}
	
	
	@RequestMapping(value = "/deleteBasketItem", method = RequestMethod.GET)
	public String deleteBasketItem(@RequestParam("cartId") String cartid, HttpSession session, Model model) throws Exception {
		
		int result = cs.deleteBasketItem(cartid);
		if(result>0){
			userCartList(session,model);
		}
		
		return "order/shopping_cart";
	}
	
	@RequestMapping(value = "/deleteBasketChk", method = RequestMethod.GET)
	public String deleteBasketChk(@RequestParam("cartid") String[] cartid, HttpSession session, Model model) throws Exception {
		
		int result = cs.deleteBasketChk(cartid);
		if(result>0){
			userCartList(session,model);
			
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
	
	
	//사용자 장바구니 조회
	public void userCartList(HttpSession session,  Model model) throws Exception {
		Member login = (Member) session.getAttribute("loginUser");
		if(!(login==null)){
			String userid = login.getUserid();
			List<Cart> clist = cs.getCartList(userid);
			if(clist.isEmpty()||clist==null){
				clist = null;
			}
			
			model.addAttribute("clist", clist);
			
		}else{
			String nonUserId = session.getId();
			System.out.println("sessionId : "+nonUserId);
			List<Cart> clist = cs.getCartList(nonUserId);
			if(clist.isEmpty()||clist==null){
				clist = null;
			}
			
			model.addAttribute("clist", clist);
		}
	}
	
	
	
}
