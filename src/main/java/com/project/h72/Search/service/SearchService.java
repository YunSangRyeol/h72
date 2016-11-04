package com.project.h72.Search.service;

import java.util.List;

import com.project.h72.Search.vo.Search;

public interface SearchService {
	public List<Search> getBagList() throws Exception;

	public List<Search> getProtectList()throws Exception;

	public List<Search> getFoodList()throws Exception;

	public List<Search> getToolList()throws Exception;

	public List<Search> getEtcList()throws Exception;

	public List<Search> getSearchList(String keyword)throws Exception;



}
