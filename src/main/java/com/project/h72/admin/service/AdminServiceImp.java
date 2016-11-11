package com.project.h72.admin.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.admin.dao.AdminDao;
import com.project.h72.admin.vo.Paging;
import com.project.h72.admin.vo.TotalOrder;
import com.project.h72.member.vo.Member;
import com.project.h72.order.vo.Order;
import com.project.h72.order.vo.OrderContents;

@Service
public class AdminServiceImp implements AdminService{
	@Autowired
	private AdminDao dao;

	@Override
	public List<Member> getMemberList(Paging paging) {
		return dao.getMemberList(paging);
	}


	@Override
	public List<Member> getMemberListWIDnName(Paging paging) {
		return dao.getMemberListWIDnName(paging);
	}

	@Override
	public List<Member> getMemberListWDATE(Paging paging) {
		return dao.getMemberListWDATE(paging);
	}

	
	
	
	//수 확인
	@Override
	public int getMemberCount() {
		return dao.getMemberCount();
	}
	
	@Override
	public int getMemberCountWIDnName(String what, String how) {
		return dao.getMemberCountWIDnName(what, how);
	}




	@Override
	public int getMemberCountWDATE(String start, String end) {
		return dao.getMemberCountWDATE(start, end);
	}
	
	
	
	
	
	
	
	

	
	//orderList
	public List<Order> getOrderList(){
		return dao.getOrderList();		
	}
	
	@Override
	public List<OrderContents> getOrderContentsList() {
		return dao.getOderContentsList();
	}
	
	public int updateOrderStatus(String[] orderNos, String selectStatus) {
		return dao.updateOrderStatus(orderNos, selectStatus);
	}

	
	public int updateStatusOne(String orderNo, String status) {
		return dao.updateStatusOne(orderNo, status);
	}
	
	@Override
	public int updateChangeOne(String orderNo, String change) {
		return dao.updateChangeOne(orderNo, change);
	}

	@Override
	public List<Order> orderASearchDate(Date start, Date end) {
		return dao.orderASearchDate(start, end);
	}

	@Override
	public List<Order> orderASearchUserID(String id) {
		return dao.orderASearchUserID(id);
	}

	@Override
	public int memberModify(Map<String, String> newInfo) {
		return dao.memberModify(newInfo);
	}

	@Override
	public Member memberUPage(String userid) {
		return dao.memberUPage(userid);
	}

	@Override
	public int deleteMe(String userid) {
		return dao.deleteMe(userid);
	}

	
	//Chart
	@Override
	public TotalOrder chartToday(String now) {
		return dao.chartToday(now);
	}

	@Override
	public List nowYears(String now) {
		return dao.nowYears(now);
	}

	@Override
	public List lastYears(String now) {
		return dao.lastYears(now);
	}

	@Override
	public List thisWeek(String now) {
		return dao.thisWeek(now);
	}

	@Override
	public List LastWeek(String now) {
		return dao.LastWeek(now);
	}

	@Override
	public TotalOrder category(String now) {
		return dao.category(now);
	}

	@Override
	public TotalOrder kit(String now) {
		return dao.kit(now);
	}


	@Override
	public Member whoUser(String id) {
		return dao.whoUser(id);
	}


	@Override
	public Order orderNoDetail(String orderNo) {
		return dao.orderNoDetail(orderNo);
	}










	

	
	
}
