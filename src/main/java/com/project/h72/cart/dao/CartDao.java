package com.project.h72.cart.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.cart.vo.Cart;

@Repository
public class CartDao {
	private static final String NAMESPACE="cartMapper.";

	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Cart> getCartList(String userid) throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getCartList", userid);
	}

	public int updateQuantity(String itemid, int quantity) {
		Map<String, Comparable> paramMap = new HashMap();
		paramMap.put("itemid", itemid);
		paramMap.put("quantity", quantity);
		
		return sqlSession.update(NAMESPACE+"updateQuantity", paramMap);
	}

	
	
	public int deleteBasketItem(String cartid) {
		int result =0;
		result =sqlSession.delete(NAMESPACE +"deleteBasketItem", cartid);
		return result;
	}

	public int deleteBasketChk(String[] cart) {
		int result=0;
		for(int i=0; i<cart.length; i++){
			Map<String, String> cartmap = new HashMap<String, String>();
			cartmap.put("cart", cart[i]);
			result += sqlSession.update(NAMESPACE +"deleteBasketChk", cartmap);
		}
		return result;
	}

	public int updateCartUserId(String nonUserId, String userId) {
		Map<String, Comparable> paramMap = new HashMap();
		paramMap.put("nonUserId", nonUserId);
		paramMap.put("userId", userId);
		
		return sqlSession.update(NAMESPACE+"updateCartUserId", paramMap);
	}

	public int deleteOverItem(String itemId, String nonUserId) {
		Map<String, Comparable> paramMap = new HashMap();
		paramMap.put("itemId", itemId);
		paramMap.put("nonUserId", nonUserId);
		
		return sqlSession.delete(NAMESPACE+"deleteOverItem", paramMap);
	}

}
