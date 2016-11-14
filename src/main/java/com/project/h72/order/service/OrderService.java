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

	List<Order> selectOrderList(String userId, Date currentDate, Date preDate, int currentPage, int limit);

	int getListCount(String userId, Date currentDate, Date preDate);

	int updateStatusCancle(String orderNo, String status);

	int getClistCount(String userId, Date currentDate, Date preDate, String tab);

	List<Order> selectOrderClist(String userId, Date currentDate, Date preDate, int currentPage, int limit, String tab);

	int updateCartUserId(String sessionId, String userId);

}
