package com.project.h72.kitDiy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.kitDiy.vo.Cart;
import com.project.h72.kitDiy.vo.KitDiy;

@Repository
public class KitDiyDao {
	private static final String NAMESPACE = "kitDiyMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	public List<KitDiy> itemAllViewSelect() {
		return sqlSession.selectList(NAMESPACE + "itemAllViewSelect");
	}
	public List<KitDiy> itemDetailViewSelect() {
		return sqlSession.selectList(NAMESPACE + "itemDetailViewSelect");
	}
	public int kitDiyCart(Cart cart) {
		return sqlSession.insert(NAMESPACE + "kitDiyCart",cart);
	}
	public int kitDiyCartCheck(Cart cart) {
		return sqlSession.selectOne(NAMESPACE + "kitDiyCartCheck",cart);
	}

}
