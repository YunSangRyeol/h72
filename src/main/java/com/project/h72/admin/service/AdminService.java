package com.project.h72.admin.service;

import java.sql.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.h72.admin.dao.AdminDao;
import com.project.h72.member.vo.Member;

@Service
public interface AdminService {

	List<Member> getMemberList();

	List<Member> adminSearchId(String id);

	List<Member> adminSearchName(String name);

	List<Member> adminSearchDate(Date start, Date end);


}
