package com.project.h72.order.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.project.h72.cart.vo.Cart;
import com.project.h72.order.vo.Order;
import com.project.h72.order.vo.OrderContents;
import com.project.h72.order.vo.Vbank;

public interface OrderService {

	List<Cart> getCartOrder(String[] cartAll);

	int insertBankInfo(Vbank bankInfo);

	int insertOrderInfo(Order order);

	int insertOrderContents(OrderContents orderContents);

	int deleteFinishCart(String[] cartId);

	List<Order> selectOrderList(String userId, Date currentDate, Date preDate, int currentPage, int limit, String tab);

	int getListCount(String userId, Date currentDate, Date preDate, String tab);

	int updateStatusCancle(String orderNo, String status);

	int getClistCount(String userId, Date currentDate, Date preDate, String tab);

	List<Order> selectOrderClist(String userId, Date currentDate, Date preDate, int currentPage, int limit, String tab);

	int updateCartUserId(String sessionId, String userId);

	Order selectOrderDetail(String orderNo);

	List<OrderContents> selectOrderContens(String orderNo);

	Vbank selectVbank(String orderNo);

	int updateOrderConfirm(String orderNo);

	int updateUserPoint(String userId, int addPoint);

	int updateOrderPoint(int usePoint, String userId);

}
