package com.project.h72.admin.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.admin.vo.Paging;
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
	
	public List<Member> getMemberList(Paging paging) {		
		return sqlSession.selectList(NAMESPACE + "getMemberList", paging);
	}

	public List<Member> getMemberListWIDnName(Paging paging) {	
		return sqlSession.selectList(NAMESPACE + "getMemberListWID", paging);
	}


	public List<Member> getMemberListWDATE(Paging paging) {
		return sqlSession.selectList(NAMESPACE + "getMemberListWDATE", paging);
	}
	
	
	
	
	
	
	public int getMemberCount() {
		System.out.println("조건없이 실행");
		return sqlSession.selectOne(NAMESPACE + "getMemberCount");
	}
	
	public int getMemberCountWIDnName(String what, String how) {
		System.out.println( what + " 검색 실행" + how);
		
		Map<String, String> whatNhow = new HashMap<String, String>();
		whatNhow.put( "what", what);
		whatNhow.put( "how", how );
		
		return sqlSession.selectOne(NAMESPACE + "getMemberCountWIDnName", whatNhow);
	}


	public int getMemberCountWDATE(String start, String end) {
		System.out.println("날짜 검색 실행" + start + "부터 " + end);
		
		Map<String, String> dates = new HashMap<String, String>();
		dates.put( "start", start);
		dates.put( "end", end );
		
		return sqlSession.selectOne(NAMESPACE + "getMemberCountWDATE", dates);
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
		
		//취소/반품/교환시 '접수중'변경
		if(selectStatus.equals("취소요청") || selectStatus.equals("반품요청") || selectStatus.equals("교환요청")){
			System.out.println("반품/교환/취소");
			
			for(int i = 0; i <orderNos.length; i++){
				Map<String, String> noNstatus = new HashMap<String, String>();
				noNstatus.put( "orderNo", orderNos[i]);
				noNstatus.put( "status", selectStatus );
				
				result += sqlSession.update(NAMESPACE +"updateOrderStatusPlus", noNstatus);
			}
			
		}else{
			System.out.println("일반변경");
			
			for(int i = 0; i <orderNos.length; i++){
				Map<String, String> noNstatus = new HashMap<String, String>();
				noNstatus.put( "orderNo", orderNos[i]);
				noNstatus.put( "status", selectStatus );
				
				result += sqlSession.update(NAMESPACE +"updateOrderStatus", noNstatus);
			}
			
			
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

	public Member whoUser(String id) {
		return sqlSession.selectOne(NAMESPACE + "whoUser", id);
	}

	public Order orderNoDetail(String orderNo) {
		return sqlSession.selectOne(NAMESPACE + "orderNoDetail", orderNo);
	}

	public int updateStatusOneTransportNo(String orderNo, String status, String transportNo) {
		Map<String, String> map = new HashMap<String, String>();
		map.put( "orderNo", orderNo);
		map.put( "transportNo", transportNo );
		
		int result = sqlSession.update(NAMESPACE + "updateStatusOneTransportNo", map);
		return result;
	}

	public int updateTransportNumber(String[] orderNos, String selectStatus, String[] transportNumberPaid) {
		int result = 0;
		
		for(int i = 0; i< orderNos.length; i++){
			Map<String, String> map = new HashMap<String, String>();
			map.put( "orderNo", orderNos[i]);
			map.put( "transportNo", transportNumberPaid[i] );
			
			result += sqlSession.update(NAMESPACE + "updateStatusOneTransportNo", map);
		}
		return result;
	}

	public int updateOrderChangeAll(String[] orderNos, String selectStatus) {
		int result= 0;
		Map<String, String> map = new HashMap<String, String>();
		map.put( "change", selectStatus);
		
			for(int i = 0; i <orderNos.length; i++){
				map.put( "orderNo", orderNos[i] );
				result += sqlSession.update(NAMESPACE + "updateOrderChange", map);
			}
		return result;
	}

	public int getEnd() {
		return sqlSession.update(NAMESPACE + "getEnd");
	}












	

}
