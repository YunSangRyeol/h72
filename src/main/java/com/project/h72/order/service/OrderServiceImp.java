package com.project.h72.order.service;

import java.sql.Date;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.cart.vo.Cart;
import com.project.h72.order.dao.OrderDao;
import com.project.h72.order.vo.Order;
import com.project.h72.order.vo.OrderContents;

@Service
public class OrderServiceImp implements OrderService {

	@Autowired
	private OrderDao oDao;
	
	@Override
	public List<Cart> getCartOrder(String[] cartAll) {
		List<Cart> list = new ArrayList<Cart>();
		for(int i=0; i<cartAll.length; i++){
			list.add((Cart) oDao.getCartOrder(cartAll[i]));
		}
		
		return list;
	}

	@Override
	public int insertBankInfo(Map<String, String> bankMap) {
		// TODO Auto-generated method stub
		return oDao.inserBankInfo(bankMap);
	}

	@Override
	public int insertOrderInfo(Order order) {
		// TODO Auto-generated method stub
		return oDao.insertOrderInfo(order);
	}

	@Override
	public int insertOrderContents(OrderContents orderContents) {
		// TODO Auto-generated method stub
		return oDao.insertOrderContents(orderContents);
	}

	@Override
	public int deleteFinishCart(String[] cartId) {
		int result =0; 
		for(int i=0; i<cartId.length; i++){
			result = oDao.deleteFinishCart(cartId[i]);
		}
		return result;
	}


	@Override
	public List<Order> selectOrderList(String userId, Date currentDate, Date preThreeMonth) {
		// TODO Auto-generated method stub
		return oDao.selectOrderList(userId,currentDate,preThreeMonth);
	}

}
