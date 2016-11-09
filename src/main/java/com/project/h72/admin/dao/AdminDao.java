package com.project.h72.admin.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.admin.vo.TotalOrder;
import com.project.h72.member.vo.Member;
import com.project.h72.order.vo.Order;
import com.project.h72.order.vo.OrderContents;

@Repository
public class AdminDao {
	
	private static final String NAMESPACE = "adminMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	//Member
	public List<Member> getMemberList(int page, int count, String order) {	
		Map<String, String> paging = new HashMap<String, String>();
		paging.put( "page",  String.valueOf(page));
		paging.put( "count",  String.valueOf(count) );
		paging.put( "order", order );
		
		return sqlSession.selectList(NAMESPACE + "getMemberList", paging);
	}
	
	public int getMemberCount() {
		return sqlSession.selectOne(NAMESPACE + "getMemberCount");
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
	
	public List<OrderContents> getOderContentsList() {
		return sqlSession.selectList(NAMESPACE + "getOrderContentsList");
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

	public int updateStatusOne(String orderNo, String status) {				
		Map<String, String> noNstatus = new HashMap<String, String>();
		noNstatus.put( "orderNo", orderNo);
		noNstatus.put( "status", status);
		
		int result = 0;
		if(status.equals("취소요청") || status.equals("반품요청") || status.equals("교환요청")){
			System.out.println("반품/교환/취소");
			result = sqlSession.update(NAMESPACE + "updateOrderStatusPlus", noNstatus);
		}else{
			System.out.println("일반변경");
			result =  sqlSession.update(NAMESPACE +"updateOrderStatus", noNstatus);
		}
		
		
		return result;
	}
	
	public int updateChangeOne(String orderNo, String change) {
		Map<String, String> noNstatus = new HashMap<String, String>();
		noNstatus.put( "orderNo", orderNo);
		noNstatus.put( "change", change);
		
		return sqlSession.update(NAMESPACE +"updateOrderChange", noNstatus);
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

	public int deleteMe(String userid) {
		int result = 0;
		result = sqlSession.delete(NAMESPACE + "deleteMe", userid); 
		return result;
	}

	public TotalOrder chartToday(String now) {
		return sqlSession.selectOne(NAMESPACE + "chartToday", now);
	}

	public List nowYears(String now) {
		List nowYears = sqlSession.selectList(NAMESPACE + "nowYears", now);
		return nowYears;
	}

	public List lastYears(String now) {
		return sqlSession.selectList(NAMESPACE + "lastYears", now);
	}

	public List thisWeek(String now) {
		return sqlSession.selectList(NAMESPACE + "thisWeek", now);
	}

	public List LastWeek(String now) {
		return sqlSession.selectList(NAMESPACE + "LastWeek", now);
	}

	public TotalOrder category(String now) {
		return sqlSession.selectOne(NAMESPACE + "category", now);
	}

	public TotalOrder kit(String now) {
		return sqlSession.selectOne(NAMESPACE + "kit", now);
	}





	

}
