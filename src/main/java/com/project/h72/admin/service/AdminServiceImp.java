package com.project.h72.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.admin.dao.AdminDao;
import com.project.h72.member.vo.Member;

@Service
public class AdminServiceImp implements AdminService{
	@Autowired
	private AdminDao dao;

	public List<Member> getMemberList() {
		System.out.println("dao 실행");
		return dao.getMemberList();
	}
}
