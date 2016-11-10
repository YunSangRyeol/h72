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

	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return dao.insertMember(member);
	}

	public Member getSearchId(Member member) {
		// TODO Auto-generated method stub
		return dao.getSearchId(member);
	}

	public Member getSearchPw(Member member) {
		// TODO Auto-generated method stub
		return dao.getSearchPw(member);
	}

	public int chkDupId(String userid) {
		// TODO Auto-generated method stub
		return dao.chkDupId(userid);
	}

}
