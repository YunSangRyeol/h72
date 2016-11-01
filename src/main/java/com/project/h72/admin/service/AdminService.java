package com.project.h72.admin.service;

import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.h72.admin.dao.AdminDao;
import com.project.h72.member.vo.Member;
import com.project.h72.order.vo.Order;

@Service
public interface AdminService {

	List<Member> getMemberList();

	List<Member> adminSearchId(String id);

	List<Member> adminSearchName(String name);

	List<Member> adminSearchDate(Date start, Date end);

	List<Order> getOrderList();

	int updateOrderStatus(String[] orderNos, String selectStatus);

	int updateStatusOne(String orderNo, String selectStatusOne);

	List<Order> orderASearchDate(Date start, Date end);

	List<Order> orderASearchUserID(String id);


}
