package com.project.h72.order.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.cart.vo.Cart;
import com.project.h72.order.vo.Order;

@Repository
public class OrderDao {
	private static final String NAMESPACE="orderMapper.";

	@Autowired
	private SqlSession sqlSession;
	
	public Cart getCartOrder(String cartAll) {
		
		return sqlSession.selectOne(NAMESPACE+"getCartOrder", cartAll);
	}

	public int inserBankInfo(Map<String, String> bankMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"insertBankInfo", bankMap);
	}

	public int insertOrderInfo(Order order) {
		return sqlSession.insert(NAMESPACE+"insertOrderInfo", order);
	}

}
