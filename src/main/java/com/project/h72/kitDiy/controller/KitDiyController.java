package com.project.h72.kitDiy.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.h72.kitDiy.service.KitDiyService;
import com.project.h72.kitDiy.vo.Cart;
import com.project.h72.kitDiy.vo.KitDiy;
@Controller

@RequestMapping("/kitDiy")
public class KitDiyController {
	@Autowired private KitDiyService service;
	
	@RequestMapping(value = "/kitDiyView", method = RequestMethod.GET)
	public String kitDiyView(Locale locale, Model model) {
		/*모든 상품 정보 가져오기 */
		List<KitDiy> itemAllView = service.itemAllViewSelect();
		List<KitDiy> itemDetailView = service.itemDetailViewSelect();
		model.addAttribute("itemAllView",itemAllView);
		model.addAttribute("itemDetailView",itemDetailView);
		return "detail/kitDiy";
	}
	
	@RequestMapping(value = "/kitDiyOrder", method = RequestMethod.GET)
	public String kitDiyOrder(Locale locale, Model model) {
		
		return "kityDiy";
	}
	
	@RequestMapping(value = "/kitDiyCart", method = RequestMethod.POST)
	public void kitDiyCart(HttpServletRequest request,HttpServletResponse response, Locale locale, Model model) throws IOException {
		JSONObject json = new JSONObject();
		String[] itemId = request.getParameterValues("itemId");
		String[] itemFullName = request.getParameterValues("itemFullName");
		String[] itemDetailId = request.getParameterValues("itemDetailId");
		String[] mainImg = request.getParameterValues("mainImg");
		String[] quantity = request.getParameterValues("quantity");
		String[] cost = request.getParameterValues("cost");
		String userId = request.getParameter("userId");
		int checkCart=0;
 		int result =0;
 		int preItemNum = 1;
		for (int i = 0; i < itemId.length; i++) {
			System.out.println("itemId : " + itemId[i]);
				Cart cart = new Cart(itemId[i],userId,itemFullName[i].trim(),
					itemDetailId[i],mainImg[i],Integer.parseInt(quantity[i]),
					Integer.parseInt(cost[i]),"","Y");
			System.out.println(cart);
			checkCart = service.kitDiyCartCheck(cart);
			//카트에 없는 경우
			if (checkCart <1) {
				result = service.kitDiyCart(cart);
							
			}else{
				//카트에 이미 있는 경우
				String itemNum = "preItem"+preItemNum;
				String preItemName =  itemFullName[i];
				json.put(itemNum,preItemName);
				System.out.println(itemFullName[i]+"은 이미 장바구니에 있는 상품입니다");
				preItemNum++;
			}
		}
		System.out.println("result" + result);
		if(result ==1) {
			json.put("result", result);
		}
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(json);
	
	}
	

}
