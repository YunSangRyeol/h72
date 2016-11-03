package com.project.h72.qna.service;

import java.util.*;

import org.springframework.stereotype.Service;

import com.project.h72.qna.vo.QnA;
@Service
public interface QnAService {

	List<QnA> getQnAList();

}
