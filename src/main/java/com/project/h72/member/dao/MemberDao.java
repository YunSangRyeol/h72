package com.project.h72.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.member.vo.Member;
@Repository

public class MemberDao {

private static final String NAMESPACE = "memberMapper.";

@Autowired
private SqlSession sqlSession;

public Member getMemberInfo(Member login) throws Exception{
	return sqlSession.selectOne(NAMESPACE + "getUserInfo", login);
}

public int insertMember(Member member) {
	// TODO Auto-generated method stub
	return sqlSession.insert(NAMESPACE+"insertMember", member);
}

}
