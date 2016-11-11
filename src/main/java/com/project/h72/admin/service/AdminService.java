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
public interface AdminService {
	
	List<Member> getMemberList(Paging paging);

	List<Member> getMemberListWIDnName(Paging paging);

	List<Member> getMemberListWDATE(Paging paging);
	
	
	
	
	

	int getMemberCount();
	
	int getMemberCountWIDnName(String what, String how);

	int getMemberCountWDATE(String start, String end);
	
	
	
	
	
	
	
	
	
	List<Order> getOrderList();

	int updateOrderStatus(String[] orderNos, String selectStatus);

	int updateStatusOne(String orderNo, String selectStatusOne);

	List<Order> orderASearchDate(Date start, Date end);

	List<Order> orderASearchUserID(String id);

	int memberModify(Map<String, String> newInfo);

	Member memberUPage(String userid);

	int updateChangeOne(String orderNo, String change);

	int deleteMe(String userid);

	List<OrderContents> getOrderContentsList();

	TotalOrder chartToday(String now);

	List nowYears(String now);

	List lastYears(String now);

	List thisWeek(String now);

	List LastWeek(String now);

	TotalOrder category(String now);

	TotalOrder kit(String now);

	Member whoUser(String id);

	Order orderNoDetail(String orderNo);





	

	

}
