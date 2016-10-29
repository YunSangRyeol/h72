package com.project.h72.admin.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.member.vo.Member;

@Repository
public class AdminDao {
	
	private static final String NAMESPACE = "memberAMapper.";
	
	@Autowired
	private SqlSession sqlSession;

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

}
