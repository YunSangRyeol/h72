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

	public List<Search> getBagList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getBagList");
	}

	public List<Search> getProtectList() throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getProtectList");
	}

	public List<Search> getFoodList() throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getFoodList");
	}

	public List<Search> getToolList() throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getToolList");
	}

	public List<Search> getEtcList() throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getEtcList");
	}

	public List<Search> getSearchList(String keyword) throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getSearchList", keyword);
	}
	

}
