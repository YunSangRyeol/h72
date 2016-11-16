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
	public String cartViewForm(HttpSession session,  Model model) throws Exception {
		userCartList(session, model);
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
	public String deleteEmptyBasket(@RequestParam("cartAll") String[] cartAll, HttpSession session, Model model) throws Exception {
		
		int result = cs.deleteBasketChk(cartAll);
		if(result>0){
			userCartList(session,model);
			
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
	
	
	//사용자 장바구니 조회
	public void userCartList(HttpSession session,  Model model) throws Exception {
		Member login = null;
		if(session.getAttribute("loginUser") != null){
			login = (Member) session.getAttribute("loginUser");
		}
		if(login==null){
			String nonUserId = session.getId();
			System.out.println("sessionId 1: "+nonUserId);
			List<Cart> clist = cs.getCartList(nonUserId);
			if(clist.isEmpty()||clist==null){
				clist = null;
			}
			
			model.addAttribute("clist", clist);
		}else{
			String userid = login.getUserid();
			List<Cart> clist = cs.getCartList(userid);
			String nonUserId = session.getId();
			System.out.println("sessionId 2: "+nonUserId);
			List<Cart> slist = cs.getCartList(nonUserId);
			
			int delResult =0;
			if(!(slist.isEmpty())||slist!=null){
				for(int i=0; i<slist.size(); i++){
					for(int j=0; j<clist.size(); j++){
						if(slist.get(i).getItemid().equals(clist.get(j).getItemid())){
							String itemId = slist.get(i).getItemid();
							delResult = cs.deleteOverItem(itemId,nonUserId);
							//비회원일때 담았던 상품 로그인해서 중복되면 카트에서 중복된거 하나삭제 결과
							System.out.println(delResult+"중복 카트 삭제");
						}
					}
				}
				int result = cs.updateCartUserId(nonUserId, userid);
				System.out.println("reseult session change1: "+result);
				if(result>0){
					clist = cs.getCartList(userid);
					System.out.println("reseult session change2: "+result);
					if(clist.isEmpty()||clist==null){
						clist = null;
					}
				}
				
			}
			
			if(clist.isEmpty()||clist==null){
				clist = null;
			}
			model.addAttribute("clist", clist);
			
		}
		
	}
	
	
	
}
