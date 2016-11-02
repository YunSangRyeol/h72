package com.project.h72.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.notice.vo.Notice;

@Repository
public class NoticeDao {
	private static final String NAMESPACE = "noticeMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	public List<Notice> getNoticeList(){
		List<Notice> list =sqlSession.selectList(NAMESPACE +"getNoticeList");
		System.out.println("ujjujj"+list);
	return sqlSession.selectList(NAMESPACE +"getNoticeList");
	}
}
