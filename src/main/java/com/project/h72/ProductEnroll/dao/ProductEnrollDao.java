package com.project.h72.ProductEnroll.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.ProductEnroll.vo.Product;
import com.project.h72.ProductEnroll.vo.ProductItem;
import com.project.h72.ProductEnroll.vo.ProductProvider;

@Repository
public class ProductEnrollDao {

	private static final String NAMESPACE = "productEnrollMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	public int productEnrollCount(String categoryCode) {
		return sqlSession.selectOne(NAMESPACE + "productEnrollCount",categoryCode);
	}

	public int productEnrollDetailInsert(Product product) {
		System.out.println("****************"+product.getCategoryCode());
		return sqlSession.insert(NAMESPACE + "productEnrollDetailInsert",product);
	}

	public int productEnrollInsert(ProductItem item) {
		return sqlSession.insert(NAMESPACE + "productEnrollInsert",item);
	}

	public List<ProductProvider> productProviderSelect() {
		return sqlSession.selectList(NAMESPACE + "productProviderSelect");
	}

	public ProductItem itemSelect(String itemId) {
		System.out.println("itemId :" + itemId);
		return sqlSession.selectOne(NAMESPACE + "itemSelect", itemId);
	}

	public int productEnrollDetailUpdate(Product product) {
		/*return sqlSession.update(NAMESPACE + "productEnrollDetailUpdate",product);*/
		return 1;
	}

	
}