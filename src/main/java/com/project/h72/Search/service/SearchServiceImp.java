package com.project.h72.Search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.Search.dao.SearchDao;
import com.project.h72.Search.vo.Search;

@Service
public class SearchServiceImp implements SearchService {
	@Autowired
	private SearchDao dao;

	@Override
	public List<Search> getBagList() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("서비스넘어왔다");

		return dao.getBagList();
	}

	@Override
	public List<Search> getProtectList() throws Exception {
		// TODO Auto-generated method stub
		return dao.getProtectList();
	}

	@Override
	public List<Search> getFoodList() throws Exception {
		// TODO Auto-generated method stub
		return dao.getFoodList();
	}

	@Override
	public List<Search> getToolList() throws Exception {
		// TODO Auto-generated method stub
		return dao.getToolList();
	}

	@Override
	public List<Search> getEtcList() throws Exception {
		// TODO Auto-generated method stub
		return dao.getEtcList();
	}

	@Override
	public List<Search> getSearchList(String keyword) throws Exception {
		System.out.println(keyword);
		return dao.getSearchList(keyword);
	}
}
