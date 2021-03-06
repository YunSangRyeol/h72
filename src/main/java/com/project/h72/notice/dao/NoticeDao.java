package com.project.h72.notice.dao;

import java.util.HashMap;
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

	public Notice getNoticeContent(String noticeNo) {
		return sqlSession.selectOne(NAMESPACE + "getNoticeContent", noticeNo);
	}

	
	public List<Notice> getNoticeList() {
//		String asd = sqlSession.selectOne(NAMESPACE + "AAA");
//		System.out.println("DAO List" + asd);
		System.out.println("ASDFALSKDJFLHQ34KWJHF[PO");
		return sqlSession.selectList(NAMESPACE + "getNoticeList");
	}

	public int NoticeInsert(String insertNoticeTitle, String insertNoticeContent) {
		Map<String, String> notice = new HashMap<String, String>();
		notice.put("insertNoticeTitle", insertNoticeTitle);
		notice.put("insertNoticeContent", insertNoticeContent);
		return sqlSession.insert(NAMESPACE + "NoticeInsert", notice);
	}

	/*
	 * public int NoticeUp(String upNoticeTitle, String upNoticeContent) { //
	 * TODO Auto-generated method stub Map<String, String> notice = new
	 * HashMap<String, String>(); notice.put( "upNoticeTitle", upNoticeTitle);
	 * notice.put( "upNoticeContent", upNoticeContent ); return
	 * sqlSession.update(NAMESPACE+"NoticeUp",notice); }
	 */

	public int NoticeUp(String noticeNo, String upNoticeTitle, String upNoticeContent) {
		// TODO Auto-generated method stub
		Map<String, String> notice = new HashMap<String, String>();
		notice.put("noticeNo", noticeNo);
		notice.put("upNoticeTitle", upNoticeTitle);
		notice.put("upNoticeContent", upNoticeContent);
		return sqlSession.update(NAMESPACE + "NoticeUp", notice);
	}

	public Notice updatenotice(String noticeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + "updatenotice", noticeNo);
	}

	public int deletenotice(String noticeNo, String noticeTitle, String noticeContent) {
		// TODO Auto-generated method stub
		Map<String, String> notice = new HashMap<String, String>();
		notice.put("noticeNo", noticeNo);
		notice.put("noticeTitle", noticeTitle);
		notice.put("noticeContent", noticeContent);
		return sqlSession.update(NAMESPACE + "deletenotice", notice);
	}

	public List<Notice> getNoticeList2(int page, int count) {
		// TODO Auto-generated method stub
		Map<String, Integer> pag = new HashMap<String, Integer>();
		pag.put("page", page);
		pag.put("count", count);

		List<Notice> list = sqlSession.selectList(NAMESPACE + "getNoticeList2", pag);
		System.out.println("DAO List" + list);
		return list;

	}

	public int getNoticeCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + "getNoticeCount");
	}

}
