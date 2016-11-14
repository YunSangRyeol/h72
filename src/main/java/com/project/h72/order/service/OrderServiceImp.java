package com.project.h72.order.service;

import java.sql.Date;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.cart.vo.Cart;
import com.project.h72.order.dao.OrderDao;
import com.project.h72.order.vo.Order;
import com.project.h72.order.vo.OrderContents;
import com.project.h72.order.vo.Vbank;

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
	public int insertBankInfo(Vbank bank) {
		// TODO Auto-generated method stub
		return oDao.inserBankInfo(bank);
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
	public int getListCount(String userId, Date currentDate, Date preThreeMonth) {
	
		return oDao.getListCount(userId, currentDate, preThreeMonth);
	}

	@Override
	public List<Order> selectOrderList(String userId, Date currentDate, Date preDate, int currentPage,
			int limit) {
		return oDao.selectOrderList(userId,currentDate,preDate, currentPage, limit);
	}

	@Override
	public int updateStatusCancle(String orderNo, String status) {
		return oDao.updateStatusCancle(orderNo, status);
	}

	@Override
	public int getClistCount(String userId, Date currentDate, Date preDate, String tab) {
		return oDao.getClistCount(userId, currentDate, preDate, tab);
	}

	@Override
	public List<Order> selectOrderClist(String userId, Date currentDate, Date preDate, int currentPage, int limit,
			String tab) {
		return oDao.selectOrderClist(userId, currentDate, preDate, currentPage, limit,tab);
	}

	@Override
	public int updateCartUserId(String sessionId, String userId) {
		return oDao.updateCartUserId(sessionId, userId);
	}

	@Override
	public Order selectOrderDetail(String orderNo) {
		return oDao.selectOrderDetail(orderNo);
	}

	@Override
	public List<OrderContents> selectOrderContens(String orderNo) {
		return oDao.selectOrderContents(orderNo);
	}

	@Override
	public Vbank selectVbank(String orderNo) {
		return oDao.selectVbank(orderNo);
	}


}
