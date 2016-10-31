package com.project.h72.Search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.Search.dao.SearchDao;
import com.project.h72.Search.vo.Search;
@Service
public interface SearchService {
	List<Search> getBagList() throws Exception;
}
