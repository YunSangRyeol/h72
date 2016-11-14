package com.project.h72.qna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public QnA getQnAContent(String qNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + "getQnAContent", qNo);
	}

	public int QnAInsert(String insertqTitle, String insertqContent) {
		// TODO Auto-generated method stub
		Map<String, String> qna = new HashMap<String, String>();
		qna.put( "insertqTitle", insertqTitle);
		qna.put( "insertqContent", insertqContent );
		return sqlSession.insert(NAMESPACE+"QnAInsert",qna);

	}

	public QnA updateqna(String qNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE +"updateqna",qNo);
	}


/*	public int QnAUp(String qNo, String upqTitle, String upqContent, String answerContent) {
		// TODO Auto-generated method stub
		Map<String, String> qna = new HashMap<String, String>();
		qna.put( "qNo", qNo);
		qna.put( "upNoticeTitle", upqTitle);
		qna.put( "upNoticeContent", upqContent );
		qna.put( "answerContent", answerContent );
		return sqlSession.update(NAMESPACE+"QnAUp",qna);
	}*/

	public int deleteqna(String qNo, String qTitle, String qContent) {
		// TODO Auto-generated method stub
		Map<String, String> notice = new HashMap<String, String>();
		notice.put( "qNo", qNo);
		notice.put( "qTitle", qTitle);
		notice.put( "qContent", qContent );
		return sqlSession.update(NAMESPACE+"deleteqna",notice);
	}

	public int upqna(String qNo, String answerContent) {
		System.out.println("디에이오 진입");
		
		Map<String, String> nc = new HashMap<String, String>();
		nc.put( "qNo", qNo);
		nc.put( "answerContent", answerContent);
		
		return sqlSession.update(NAMESPACE+"upqna", nc);
	}

	public List<QnA> getQnAList2(int page, int count) {
		// TODO Auto-generated method stub
		Map<String, Integer> pag = new HashMap<String, Integer>();
		pag.put( "page", page);
		pag.put( "count", count);
		
		List<QnA> list =sqlSession.selectList(NAMESPACE +"getQnAList2" , pag);
		System.out.println("DAO List"+list);
		return list;
	}

	public int getQnACount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + "getQnACount");
	}


}
