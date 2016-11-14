package com.project.h72.Search.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.Search.dao.SearchDao;
import com.project.h72.Search.vo.Search;
import com.project.h72.detail.vo.Review;

@Service
public class SearchServiceImp implements SearchService {
	@Autowired
	private SearchDao dao;

	@Override
	public List<Search> getBagList(int currentPage, int limit) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("서비스넘어왔다");

		return dao.getBagList(currentPage, limit);
	}

	@Override
	public List<Search> getProtectList(int currentPage, int limit) throws Exception {
		// TODO Auto-generated method stub
		return dao.getProtectList(currentPage, limit);
	}

	@Override
	public List<Search> getFoodList(int currentPage, int limit) throws Exception {
		// TODO Auto-generated method stub
		return dao.getFoodList(currentPage, limit);
	}

	@Override
	public List<Search> getToolList(int currentPage, int limit) throws Exception {
		// TODO Auto-generated method stub
		return dao.getToolList(currentPage, limit);
	}

	@Override
	public List<Search> getEtcList(int currentPage, int limit) throws Exception {
		// TODO Auto-generated method stub
		return dao.getEtcList(currentPage, limit);
	}

	@Override
	public List<Search> getSearchList(String itemName, int currentPage, int limit) throws Exception {

		return dao.getSearchList(itemName, currentPage, limit);
	}

	@Override
	public int getListCount(int currentPage, int limit, String cate) {
		// TODO Auto-generated method stub
		return dao.getSearchList(currentPage, limit, cate);
	}
	@Override
	public int getListCount(int currentPage, int limit, String cate, String itemName) {
		// TODO Auto-generated method stub
		System.out.println("서비스 카운트 + " + dao.getSearchList(currentPage, limit, cate, itemName));

		return dao.getSearchList(currentPage, limit, cate, itemName);
	}


}
