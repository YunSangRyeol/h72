package com.project.h72.detail.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.cart.vo.Cart;
import com.project.h72.detail.vo.DetailDIVO;
import com.project.h72.detail.vo.DetailVO;

@Repository
public class DetailDao {
	
	private static final String NAMESPACE = "detailMapper.";
	
	@Autowired SqlSession sqlSession;
	
	public List<DetailVO> selectItemList() {
		//ArrayList<DetailVO> itemList = sqlSession.selectOne("selectItemList");
		List<DetailVO> itemList =  sqlSession.selectList(NAMESPACE + "selectItemList");
		return itemList;
	}

	public List<DetailDIVO> selectDetailItem(String ItemDetailId) {
		System.out.println("dao : " + ItemDetailId);
		List<DetailDIVO> itemDetailList = sqlSession.selectList(NAMESPACE + "selectDetailItem", ItemDetailId);
		return itemDetailList;
	}

	public int insertCart(ArrayList<Cart> cartList) {
		int result = 0;
		for(int i = 0; i < cartList.size(); i++){
			System.out.println("cartList.size : " + cartList.size());
			System.out.println("cartList : " + cartList.get(i).toString());
			result += sqlSession.insert(NAMESPACE + "insertCart", cartList.get(i));
		}
		//result = sqlSession.insert(NAMESPACE + "insertCart", cartList);
		return result;
	}
	//카트에 있는지 확인(먼저, 들어온 cart 객체에 item_id 고유의 값을 db로 가져와서 set하고 selectCart 진행
	public List<Integer> selectCart(ArrayList<Cart> cartList) {
		List<Integer> tOf  = new ArrayList<Integer>();
		for(int i = 0; i < cartList.size(); i++){
			cartList.get(i).setItemid(sqlSession.selectOne(NAMESPACE + "selectItemId", cartList.get(i)));
			System.out.println(cartList.get(i).toString());
		}
		for(int i = 0; i < cartList.size(); i++){
			tOf = sqlSession.selectList(NAMESPACE + "selectCart", cartList.get(i));//카트에서 유저아이디와, 아이템디테일아이디, 아이템아이디 모두 일치하는 count(*) 꺼내옴
		}
		return tOf;
	}

}
