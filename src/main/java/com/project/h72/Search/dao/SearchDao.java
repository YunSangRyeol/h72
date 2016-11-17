package com.project.h72.Search.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.Search.vo.Search;
import com.project.h72.detail.vo.Review;

@Repository
public class SearchDao {
	private static final String NAMESPACE = "searchMapper.";

	@Autowired
	private SqlSession sqlSession;

	public List<Search> getBagList(int currentPage, int limit) throws Exception {
		int startRow = (currentPage - 1) * 12 + 1; // 읽기 시작할 row 번호.
		int endRow = startRow + limit - 1; // 읽을 마지막 row 번호.

		Map<String, Comparable> paramMap = new HashMap();

		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);

		return sqlSession.selectList(NAMESPACE + "getBagList", paramMap);
	}

	public List<Search> getProtectList(int currentPage, int limit) throws Exception {
		int startRow = (currentPage - 1) * 12 + 1; // 읽기 시작할 row 번호.
		int endRow = startRow + limit - 1; // 읽을 마지막 row 번호.

		Map<String, Comparable> paramMap = new HashMap();

		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		return sqlSession.selectList(NAMESPACE + "getProtectList", paramMap);
	}

	public List<Search> getFoodList(int currentPage, int limit) throws Exception {
		int startRow = (currentPage - 1) * 12 + 1; // 읽기 시작할 row 번호.
		int endRow = startRow + limit - 1; // 읽을 마지막 row 번호.

		Map<String, Comparable> paramMap = new HashMap();

		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		return sqlSession.selectList(NAMESPACE + "getFoodList", paramMap);
	}

	public List<Search> getToolList(int currentPage, int limit) throws Exception {
		int startRow = (currentPage - 1) * 12 + 1; // 읽기 시작할 row 번호.
		int endRow = startRow + limit - 1; // 읽을 마지막 row 번호.

		Map<String, Comparable> paramMap = new HashMap();

		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		return sqlSession.selectList(NAMESPACE + "getToolList", paramMap);
	}

	public List<Search> getEtcList(int currentPage, int limit) throws Exception {
		int startRow = (currentPage - 1) * 12 + 1; // 읽기 시작할 row 번호.
		int endRow = startRow + limit - 1; // 읽을 마지막 row 번호.

		Map<String, Comparable> paramMap = new HashMap();

		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		return sqlSession.selectList(NAMESPACE + "getEtcList", paramMap);
	}

	public List<Search> getSearchList(String itemName, int currentPage, int limit) throws Exception {
		int startRow = (currentPage - 1) * 12 + 1; // 읽기 시작할 row 번호.
		int endRow = startRow + limit - 1; // 읽을 마지막 row 번호.

		Map<String, Comparable> paramMap = new HashMap<String, Comparable>();

		paramMap.put("startRow", startRow);
		paramMap.put("endRow", endRow);
		paramMap.put("itemName", itemName);
		System.out.println("dao 키워드 + "+itemName);
		System.out.println("dao 리스트 + "+sqlSession.selectList(NAMESPACE + "getSearchList", paramMap));
		return sqlSession.selectList(NAMESPACE + "getSearchList", paramMap);
	}

	public int getSearchList(int currentPage, int limit, String cate) {
		if (cate.equals("bag")) {
			return sqlSession.selectOne(NAMESPACE + "getListCount1");
		} else if (cate.equals("protect")) {
			return sqlSession.selectOne(NAMESPACE + "getListCount2");
		} else if (cate.equals("food")) {
			return sqlSession.selectOne(NAMESPACE + "getListCount3");
		} else if (cate.equals("tool")) {
			return sqlSession.selectOne(NAMESPACE + "getListCount4");
		} else if (cate.equals("etc")) {
			return sqlSession.selectOne(NAMESPACE + "getListCount5");
		}
		return 0;
	}

	public int getSearchList(int currentPage, int limit, String cate, String itemName) {
		return sqlSession.selectOne(NAMESPACE + "getListCount6", itemName);
	}

}