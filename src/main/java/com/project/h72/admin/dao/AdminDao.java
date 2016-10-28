package com.project.h72.admin.dao;

import java.util.List;

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
		System.out.println("실행");
		List<Member> list = sqlSession.selectList(NAMESPACE + "getMemberList");
		System.out.println("실행완료");
		System.out.println("list : " + list);
		return list;
	}

}
