package com.project.h72.order.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.project.h72.cart.vo.Cart;
import com.project.h72.order.vo.Order;
import com.project.h72.order.vo.OrderContents;

public interface OrderService {

	List<Cart> getCartOrder(String[] cartAll);

	int insertBankInfo(Map<String, String> bankMap);

	int insertOrderInfo(Order order);

	int insertOrderContents(OrderContents orderContents);

	int deleteFinishCart(String[] cartId);

	List<Order> selectOrderList(String userId, Date currentDate, Date preThreeMonth);

}
