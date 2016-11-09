package com.project.h72.qna.service;

import java.util.*;

import org.springframework.stereotype.Service;

import com.project.h72.notice.vo.Notice;
import com.project.h72.qna.vo.QnA;
@Service
public interface QnAService {

	List<QnA> getQnAList();

	QnA getQnAContent(String qNo);

	int insertq(String insertqTitle, String insertqContent);

	QnA updateqna(String qNo);

	int upqna(String qNo, String upqTitle, String upqContent);



}
