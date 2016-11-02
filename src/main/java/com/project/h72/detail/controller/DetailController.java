package com.project.h72.detail.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.h72.cart.vo.Cart;
import com.project.h72.detail.service.DetailServiceImpl;
import com.project.h72.detail.vo.DetailDIVO;
import com.project.h72.detail.vo.DetailVO;
import com.project.h72.member.controller.MemberController;

@Controller
@RequestMapping(value="/detail", method = RequestMethod.GET)
public class DetailController {
	//private static final Logger logger = LoggerFactory.getLogger(DetailController.class);
	@Autowired DetailServiceImpl ds;
	//@Autowired DetailVO dvo;
	
	@RequestMapping(value = "/selectDetailItem", method = RequestMethod.GET)
	public String selectDetailItem(String ItemDetailId, Model model){
		List<DetailVO> itemList = ds.selectItemList();
		model.addAttribute("itemList", itemList);
		return "detail/item";//item_detail_id 로 1범주 조회(ex.방한용품/장갑/보온포)
	}
	
	@RequestMapping(value = "/selectItem", method = RequestMethod.GET)
	public String selectItem(String ItemDetailId, Model model, HttpServletRequest request){
		//System.out.println("ItemDetailId(request) : " + request.getParameter("ItemDetailIddd"));
		System.out.println("ItemDetailId(param name) : " + ItemDetailId);
		List<DetailDIVO> itemDetailList = ds.selectDetailItem(ItemDetailId);
		model.addAttribute("itemDetailList", itemDetailList);
		return "detail/detail";//item_id 로 2범주 조회(ex.방한용품옵션/장갑옵션/보온포옵션)
	}
	
	@RequestMapping(value = "/insertCart", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> insertCart(
				HttpServletRequest request, HttpServletResponse response, 
				String ItemId, Model model)
				/*@RequestParam("itemid") String itemid,*/
				//@RequestParam("userid") String userid,
				//@RequestParam("itemFullName") String itemFullName,
				//@RequestParam("itemDetailid") String itemDetailid,
				//@RequestParam("mainImg") String mainImg,
				//@RequestParam(value = "quantity[]") String[] quantity)
				//@RequestParam("cost") String[] cost,
				//@RequestParam("message") String message,
				//@RequestParam("KitYN") String KitYN,
				//@RequestParam("itemOptionName") String[] itemOptionName) 
				throws Exception{
		
		/*
		 * 타입 확인
		Object obj = quantity;
		System.out.println("quantity type : " + obj.getClass().getName());
		*/
		
		/*
		String[] strArray = (String[])quantity;
		System.out.println("aaaaaaaaaa : " + strArray.toString() );
		*/
		
		String quantity = request.getParameter("quantity"); //int 로 바꿔야 함*******************
		String cost = request.getParameter("cost"); // int 로 바꿔야 함 //*******************
		String itemOptionName = request.getParameter("itemOptionName"); //*******************
		String[] arrQuantity = quantity.split(";");
		String[] arrCost = cost.split(";");
		String[] arrItemOptionName = itemOptionName.split(";");
		
		int op_count = Integer.parseInt(request.getParameter("op_count")); // 객체생성시 제외
		String userid = request.getParameter("userid");
		String itemFullName = request.getParameter("itemFullName");
		String itemDetailid = request.getParameter("itemDetailid");
		String mainImg = request.getParameter("mainImg");
		String message = request.getParameter("message");
		char KitYN = request.getParameter("KitYN").charAt(0);
		
		int result = 0;
		
		System.out.println("-----------------------------------------------");
		System.out.println("quantity : " + quantity + ", arrQuantity : " + arrQuantity.length +"개, "+arrQuantity.toString());
		System.out.println("cost : " + cost);
		System.out.println("itemOptionName : " + itemOptionName);
		System.out.println("op_count(선택된 옵션 갯수) : " + op_count);
		System.out.println("userid : " + userid);
		System.out.println("itemFullName : " + itemFullName);
		System.out.println("itemDetailid : " + itemDetailid);
		System.out.println("mainImg : " + mainImg);
		System.out.println("message : " + message);
		System.out.println("KitYN : " + KitYN);
		System.out.println("-----------------------------------------------");
		//String arrayQuantity = null;
		/*String arrayQuantitya = request.getParameter("quantity");
		System.out.println(arrayQuantitya);*/
		ArrayList<Cart> cartList = new ArrayList<Cart>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		//선택된 옵션이 있는 경우
		if ( op_count != 0 ){
			//int quantiArr[] = new int[op_count]; //**********************
			for(int i = 0; i < op_count; i++){
				//System.out.println(i + " : " + arrQuantity[i]);
				Cart cart = new Cart(userid, itemFullName, itemDetailid, mainImg, 
							Integer.parseInt(arrQuantity[i]), Integer.parseInt(arrCost[i]), 
							message, KitYN, arrItemOptionName[i]);
				cartList.add(cart);				
			}
			for(Cart c : cartList)
				System.out.println(c.toString());
			System.out.println("-----------------------------------------------");
			
			//item_id는 view페이지에서 가져오기 힘드니까. item_name이랑, item_option_name 2개를 가져오고 db query 문에서 연결시켜 가져와서 카트로 넘겨주자. 
			
			//System.out.println("data from ajax : " + name);
			List<Integer> tOf = new ArrayList<Integer>();
			tOf = ds.selectCart(cartList);//장바구니에 추가하려는 상품이 장바구니에 들어있는지 확인
			int count = tOf.get(0);
			
			System.out.println("sssssssssssssssssssssssssssssssss " + tOf.get(0));
			
			if(count > 0){//카트에 이미 상품이 등록되어있을 때
				result = -1;//카트에 이미 있는 경우
				map.put("result", result);
			}else{//카트에 없을 때 
				result = ds.insertCart(cartList);
				map.put("result", result);
				/*
				if(result > 0)	map.put("result", result);//카트에 등록된 경우
				if(result == 0) map.put("result", result);//카트등록 실패한 경우
				*/				
				//result = -1 : 카트에 이미 있는 경우
				//result > 0  : 카트에 등록된 경우
				//result = 0  : 카트 등록 실패한 경우
			}
			map.put("count", count);
		}
		//선택된 옵션이 없는 경우
		
		
		
		
		return map;
	}
	
	
	@RequestMapping(value = "/insertReview", method = RequestMethod.GET)
	public String insertReview(String ItemDetailId, Model model){
		
		return null;//ajax사용 출력
	}
	
	
	@RequestMapping(value = "/selectReview", method = RequestMethod.GET)
	public String selectReview(String ItemId, Model model){
		
		return "detail/review";
	}
	
	
}
