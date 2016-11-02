package com.project.h72.detail.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.cart.vo.Cart;
import com.project.h72.detail.dao.DetailDao;
import com.project.h72.detail.vo.DetailVO;
import com.project.h72.detail.vo.DetailDIVO;

@Service
public class DetailServiceImpl implements DetailService {
	@Autowired DetailDao dd; 
	@Override
	public List<DetailVO> selectItemList() {
		List<DetailVO> itemList = dd.selectItemList();
		return itemList;
	}
	@Override
	public List<DetailDIVO> selectDetailItem(String ItemDetailId) {
		List<DetailDIVO> itemDetailList = dd.selectDetailItem(ItemDetailId);
		return itemDetailList;
	}
	@Override
	public int insertCart(ArrayList<Cart> cartList) {
		int result = dd.insertCart(cartList);
		return result;
	}
	@Override
	public List<Integer> selectCart(ArrayList<Cart> cartList) {
		List<Integer> tOf = dd.selectCart(cartList);
		return tOf;
	}
	
	
	

}
