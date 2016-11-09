package com.project.h72.notice.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.member.vo.Member;
import com.project.h72.notice.vo.Notice;

@Repository
public class NoticeDao {
	private static final String NAMESPACE = "noticeMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	public Notice getNoticeContent(String noticeNo){
	return sqlSession.selectOne(NAMESPACE + "getNoticeContent", noticeNo);
	}
	
	
	public List<Notice> getNoticeList(){
		List<Notice> list =sqlSession.selectList(NAMESPACE +"getNoticeList");
		System.out.println("DAO List"+list);
		return sqlSession.selectList(NAMESPACE +"getNoticeList");
	}


	public int NoticeInsert(String insertNoticeTitle, String insertNoticeContent) {
		Map<String, String> notice = new HashMap<String, String>();
		notice.put( "insertNoticeTitle", insertNoticeTitle);
		notice.put( "insertNoticeContent", insertNoticeContent );
		return sqlSession.insert(NAMESPACE+"NoticeInsert",notice);
	}

/*
	public int NoticeUp(String upNoticeTitle, String upNoticeContent) {
		// TODO Auto-generated method stub
		Map<String, String> notice = new HashMap<String, String>();
		notice.put( "upNoticeTitle", upNoticeTitle);
		notice.put( "upNoticeContent", upNoticeContent );
		return sqlSession.update(NAMESPACE+"NoticeUp",notice);
	}
*/


	public int NoticeUp(String noticeNo, String upNoticeTitle, String upNoticeContent) {
		// TODO Auto-generated method stub
		Map<String, String> notice = new HashMap<String, String>();
		notice.put( "noticeNo", noticeNo);
		notice.put( "upNoticeTitle", upNoticeTitle);
		notice.put( "upNoticeContent", upNoticeContent );
		return sqlSession.update(NAMESPACE+"NoticeUp",notice);
	}


	public Notice updatenotice(String noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE +"updatenotice",noticeNo);
	}
	
}


