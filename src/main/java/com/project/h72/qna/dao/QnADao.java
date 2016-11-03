package com.project.h72.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.notice.vo.Notice;
import com.project.h72.qna.vo.QnA;

@Repository
public class QnADao {
	private static final String NAMESPACE = "qnaMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<QnA> getQnAList() {
		// TODO Auto-generated method stub
		List<QnA> list =sqlSession.selectList(NAMESPACE +"getQnAList");
		return sqlSession.selectList(NAMESPACE +"getQnAList");
	}

}
