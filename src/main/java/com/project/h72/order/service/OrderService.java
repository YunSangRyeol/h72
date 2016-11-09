package com.project.h72.order.service;

import java.util.List;
import java.util.Map;

import com.project.h72.cart.vo.Cart;
import com.project.h72.order.vo.Order;

public interface OrderService {

	List<Cart> getCartOrder(String[] cartAll);

	int insertBankInfo(Map<String, String> bankMap);

	int insertOrderInfo(Order order);

}
