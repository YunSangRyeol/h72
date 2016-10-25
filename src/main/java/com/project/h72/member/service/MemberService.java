package com.project.h72.member.service;

import com.project.h72.member.dao.MemberDao;
import com.project.h72.member.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	MemberDao dao;

	public Member getUserInfo(Member login) throws Exception {
		return dao.getMemberInfo(login);
	}

}
