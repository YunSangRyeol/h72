package com.project.h72.admin.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.admin.dao.AdminDao;
import com.project.h72.member.vo.Member;
import com.project.h72.order.vo.Order;
import com.project.h72.order.vo.OrderContents;

@Service
public class AdminServiceImp implements AdminService{
	@Autowired
	private AdminDao dao;

	public List<Member> getMemberList() {
		System.out.println("dao 실행");
		return dao.getMemberList();
	}
	
	public List<Member> adminSearchId(String id){
		return dao.adminSearchId(id);
	}
	
	public List<Member> adminSearchName(String name){
		return dao.adminSearchName(name);
	}

	public List<Member> adminSearchDate(Date start, Date end){
		return dao.adminSearchDate(start, end);
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


	
	
}
