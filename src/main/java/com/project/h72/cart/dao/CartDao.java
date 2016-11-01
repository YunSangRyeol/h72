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
	
	public int deleteEmptyBasket(String userid) {
		int result =0;
		result =sqlSession.delete(NAMESPACE +"deleteEmptyBasket", userid);
		System.out.println("Dao:"+result+"====================================================");
		return result;
	}

}
