package com.project.h72.Search.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.Search.dao.SearchDao;
import com.project.h72.Search.vo.Search;
@Service
public class SearchService {
	@Autowired
	SearchDao dao;
/*	public Search categoryBag() {
		// TODO Auto-generated method stub
		return dao.categoryBag();
	}
*/
}
