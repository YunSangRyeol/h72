package com.project.h72.Search.service;

import java.util.List;
import java.util.Map;

import com.project.h72.Search.vo.Search;
import com.project.h72.detail.vo.Review;

public interface SearchService {
	public List<Search> getBagList(int currentPage, int limit) throws Exception;

	public List<Search> getProtectList(int currentPage, int limit)throws Exception;

	public List<Search> getFoodList(int currentPage, int limit)throws Exception;

	public List<Search> getToolList(int currentPage, int limit)throws Exception;

	public List<Search> getEtcList(int currentPage, int limit)throws Exception;

	public List<Search> getSearchList(String itemName, int currentPage, int limit)throws Exception;

	public int getListCount(int currentPage, int limit, String cate);

	public int getListCount(int currentPage, int limit, String cate, String itemName);




}
