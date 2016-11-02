package com.project.h72.order.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.cart.vo.Cart;
import com.project.h72.order.dao.OrderDao;

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

}
