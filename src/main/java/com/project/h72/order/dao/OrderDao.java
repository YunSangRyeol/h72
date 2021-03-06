package com.project.h72.order.dao;

import java.sql.Date;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.cart.vo.Cart;
import com.project.h72.order.vo.Order;
import com.project.h72.order.vo.OrderContents;
import com.project.h72.order.vo.Vbank;

@Repository
public class OrderDao {
	private static final String NAMESPACE="orderMapper.";

	@Autowired
	private SqlSession sqlSession;
	
	public Cart getCartOrder(String cartAll) {
		
		return sqlSession.selectOne(NAMESPACE+"getCartOrder", cartAll);
	}

	public int inserBankInfo(Vbank bank) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"insertBankInfo", bank);
	}

	public int insertOrderInfo(Order order) {
		return sqlSession.insert(NAMESPACE+"insertOrderInfo", order);
	}

	public int insertOrderContents(OrderContents orderContents) {
		return sqlSession.insert(NAMESPACE+"insertOrderContents", orderContents);
	}

	public int deleteFinishCart(String cartId) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"deleteFinishCart", cartId);
	}

	public List<Order> selectOrderList(String userId, Date currentDate, Date preDate, int currentPage, int limit, String tab) {
		int startRow = (currentPage - 1) * 5 + 1; // 읽기 시작할 row 번호.
		int endRow = startRow + limit - 1; // 읽을 마지막 row 번호.

		Map<String, Comparable> paramMap = new HashMap();
		paramMap.put("keyword", "취소요청|교환요청|반품요청|입금전취소");
		paramMap.put("userId", userId);
		paramMap.put("currentDate", currentDate);
		paramMap.put("preDate", preDate);
		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		return sqlSession.selectList(NAMESPACE+"selectOrderList", paramMap);
	}
	
	public int getListCount(String userId, Date currentDate, Date preDate, String tab) {
		Map<String, Comparable> map = new HashMap();
		map.put("keyword", "취소요청|교환요청|반품요청|입금전취소");
		map.put("userId", userId);
		map.put("currentDate", currentDate);
		map.put("preDate", preDate);
		return sqlSession.selectOne(NAMESPACE+"getListCount", map);
	}

	public int updateStatusCancle(String orderNo, String status) {
		System.out.println("dao===="+orderNo+", "+status);
		Map<String, Comparable> map2 = new HashMap();
		map2.put("orderNo", orderNo);
		map2.put("status", status);
		return sqlSession.update(NAMESPACE+"updateStatusCancle", map2);
	}

	public int getClistCount(String userId, Date currentDate, Date preDate, String tab) {
		Map<String, Comparable> map = new HashMap();
		
		map.put("keyword", "취소요청|교환요청|반품요청|입금전취소");
		System.out.println("orderCategory"+map.toString());
		map.put("userId", userId);
		map.put("currentDate", currentDate);
		map.put("preThreeMonth", preDate);
		return sqlSession.selectOne(NAMESPACE+"getClistCount", map);
	}

	public List<Order> selectOrderClist(String userId, Date currentDate, Date preDate, int currentPage, int limit,
			String tab) {
		int startRow = (currentPage - 1) * 5 + 1; // 읽기 시작할 row 번호.
		int endRow = startRow + limit - 1; // 읽을 마지막 row 번호.

		Map<String, Comparable> paramMap = new HashMap();
	
		paramMap.put("keyword", "취소요청|교환요청|반품요청|입금전취소");
		System.out.println("orderCategory"+paramMap.toString());
		paramMap.put("userId", userId);
		paramMap.put("currentDate", currentDate);
		paramMap.put("preThreeMonth", preDate);
		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		return sqlSession.selectList(NAMESPACE+"selectOrderClist", paramMap);
	}

	public int updateCartUserId(String sessionId, String userId) {
		Map<String, Comparable> map = new HashMap();
		map.put("sessionId", sessionId);
		map.put("userId", userId);
		return sqlSession.update(NAMESPACE+"updateCartUserId", map);
	}

	public Order selectOrderDetail(String orderNo) {
		return sqlSession.selectOne(NAMESPACE+"selectOrderDetail",orderNo);
	}

	public List<OrderContents> selectOrderContents(String orderNo) {
		return sqlSession.selectList(NAMESPACE+"selectOrderContents", orderNo);
	}

	public Vbank selectVbank(String orderNo) {
		return sqlSession.selectOne(NAMESPACE+"selectVbank",orderNo);
	}

	public int updateOrderConfirm(String orderNo) {
	
		return sqlSession.update(NAMESPACE+"updateOrderConfirm", orderNo);
	}

	public int updateUserPoint(String userId, int addPoint) {
		Map<String, Comparable> map = new HashMap();
		map.put("userId", userId);
		map.put("addPoint", addPoint);
		return sqlSession.update(NAMESPACE+"updateUserPoint", map);
	}

	public int updateOrderPoint(String userId, int usePoint) {
		Map<String, Comparable> map = new HashMap();
		map.put("userId", userId);
		map.put("usePoint", usePoint);
		return sqlSession.update(NAMESPACE+"updateOrderPoint", map);
	}

}
