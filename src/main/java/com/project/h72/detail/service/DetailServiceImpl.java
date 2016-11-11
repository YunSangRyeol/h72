package com.project.h72.detail.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.cart.vo.Cart;
import com.project.h72.detail.dao.DetailDao;
import com.project.h72.detail.vo.DetailVO;
import com.project.h72.detail.vo.ManageForm;
import com.project.h72.detail.vo.Review;
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
	public int selectCart(ArrayList<Cart> cartList) {
		int tOf = dd.selectCart(cartList);
		return tOf;
	}
	@Override
	public int selectReviewListCount(String itemDetailId) {
		int reviewListCount = dd.selectReviewListCount(itemDetailId);
		return reviewListCount;
	}
	@Override
	public List<Review> selectReview(Map<String, String> needPageData) {
		List<Review> reviewList = dd.selectReview(needPageData);
		return reviewList;
	}
	@Override
	public int selectListNo() {
		int listNo = dd.selectListNo();
		return listNo;
	}
	@Override
	public int insertReview(Review review) {
		int result = dd.insertReview(review);
		return result;
	}
	@Override
	public int deleteReview(ManageForm form) {
		int result = dd.deleteReview(form);
		return result;
	}
	@Override
	public Review selectSingleReview(ManageForm form) {
		Review review = dd.selectSingleReview(form);
		return review;
	}
	@Override
	public List<String> selectCartId(ArrayList<Cart> cartList) {
		List<String> cartId = dd.selectCartId(cartList);
		return cartId;
	}
	
	
	

}
