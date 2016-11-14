package com.project.h72.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.notice.vo.Notice;
import com.project.h72.qna.dao.QnADao;
import com.project.h72.qna.vo.QnA;


@Service
public class QnAServiceImp implements QnAService{
	@Autowired
	private QnADao dao;


	public List<QnA> getQnAList() {
		// TODO Auto-generated method stub
		return dao.getQnAList();
	}


	@Override
	public QnA getQnAContent(String qNo) {
		// TODO Auto-generated method stub
		return dao.getQnAContent(qNo);
	}


	@Override
	public int insertq(String insertqTitle, String insertqContent) {
		// TODO Auto-generated method stub
		return dao.QnAInsert(insertqTitle,insertqContent);
	}


	@Override
	public QnA updateqna(String qNo) {
		// TODO Auto-generated method stub
		return dao.updateqna(qNo);
	}


/*	@Override
	public int upqna(String qNo, String upqTitle, String upqContent) {
		// TODO Auto-generated method stub
		return dao.QnAUp( qNo,  upqTitle,  upqContent);
	}*/


	@Override
	public int deleteqna(String qNo, String qTitle, String qContent) {
		// TODO Auto-generated method stub
		return dao.deleteqna(qNo,qTitle,qContent);
	}


/*	@Override
	public int upqna(String qNo, String upqTitle, String upqContent, String answerContent) {
		// TODO Auto-generated method stub
		return dao.QnAUp( qNo,  upqTitle,  upqContent, answerContent);
	}
*/

	@Override
	public int upqna(String qNo, String answerContent) {
		// TODO Auto-generated method stub
		return dao.upqna(qNo, answerContent);
	}


	@Override
	public List<QnA> getQnAList2(int page, int count) {
		// TODO Auto-generated method stub
		System.out.println("asef;qli3wje;rsfdpihgbopdfil");
		List<QnA> list = dao.getQnAList2(page, count);
		System.out.println("list"+ list);
		return list;
	}


	@Override
	public int getQnACount() {
		// TODO Auto-generated method stub
		return dao.getQnACount();
	}
}
