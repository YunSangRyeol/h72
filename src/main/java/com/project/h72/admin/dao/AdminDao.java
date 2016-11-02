package com.project.h72.admin.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.member.vo.Member;
import com.project.h72.order.vo.Order;

@Repository
public class AdminDao {
	
	private static final String NAMESPACE = "memberAMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	//Member
	public List<Member> getMemberList() {		
		return sqlSession.selectList(NAMESPACE + "getMemberList");
	}

	public List<Member> adminSearchId(String id) {
		return sqlSession.selectList(NAMESPACE + "adminSearchId", id);
	}

	public List<Member> adminSearchName(String name) {
		return sqlSession.selectList(NAMESPACE + "adminSearchName", name);
	}

	public List<Member> adminSearchDate(Date start, Date end) {
		Map<String, Date> dates = new HashMap<String, Date>();
		dates.put( "start", start);
		dates.put( "end", end );
		
		return sqlSession.selectList(NAMESPACE + "adminSearchDate", dates);
	}

	//Order
	public List<Order> getOrderList() {
		return sqlSession.selectList(NAMESPACE + "getOrderList");
	}

	public int updateOrderStatus(String[] orderNos, String selectStatus) {		
		int result = 0;
		
		for(int i = 0; i <orderNos.length; i++){
			Map<String, String> noNstatus = new HashMap<String, String>();
			noNstatus.put( "orderNo", orderNos[i]);
			noNstatus.put( "status", selectStatus );
			
			result += sqlSession.update(NAMESPACE +"updateOrderStatus", noNstatus);
		}
		
		return result;
	}

	public int updateStatusOne(String orderNo, String selectStatusOne) {
				
		Map<String, String> noNstatus = new HashMap<String, String>();
		noNstatus.put( "orderNo", orderNo);
		noNstatus.put( "status", selectStatusOne);
		
		return sqlSession.update(NAMESPACE +"updateOrderStatus", noNstatus);
	}

	public List<Order> orderASearchDate(Date start, Date end) {
		Map<String, Date> dates = new HashMap<String, Date>();
		dates.put( "start", start);
		dates.put( "end", end );
		
		return sqlSession.selectList(NAMESPACE + "orderASearchDate", dates);
	}

	public List<Order> orderASearchUserID(String id) {
		return sqlSession.selectList(NAMESPACE + "orderASearchUserID", id);
	}

	public int memberModify(Map<String, String> newInfo) {
		return sqlSession.update(NAMESPACE + "memberModify", newInfo);
	}

	public Member memberUPage(String userid) {
		return sqlSession.selectOne(NAMESPACE + "memberUPage", userid);
	}

}
