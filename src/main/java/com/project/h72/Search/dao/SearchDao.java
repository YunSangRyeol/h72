package com.project.h72.Search.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.Search.vo.Search;

@Repository
public class SearchDao {
	private static final String NAMESPACE = "searchMapper.";

	@Autowired
	private SqlSession sqlSession;

	public List<Search> getBagList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBagList");
	}
	

}
