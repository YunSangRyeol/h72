package com.project.h72.detail.service;

import java.util.*;

import com.project.h72.detail.vo.DetailVO;
import com.project.h72.detail.vo.ManageForm;
import com.project.h72.detail.vo.Review;
import com.project.h72.cart.vo.Cart;
import com.project.h72.detail.vo.DetailDIVO;

public interface DetailService {
	public List<DetailVO> selectItemList();
	public List<DetailDIVO> selectDetailItem(String itemDetailId);
	public int insertCart(ArrayList<Cart> cartList);
	public int selectCart(ArrayList<Cart> cartList);
	public int selectReviewListCount(String itemDetailId);
	public List<Review> selectReview(Map<String, String> needPageData);
	public int selectListNo();
	public int insertReview(Review review);
	public int deleteReview(ManageForm form);
	public Review selectSingleReview(ManageForm form);
	public List<String> selectCartId(ArrayList<Cart> cartList);

	public int updateReviewImage(List<String> deleteList, String reviewId);
	public int insertReviewImage(List<String> renameFileNames, String reviewId);
	public String selectMaxIndex(ManageForm form);
	public int selectImageNullCount(String reviewId);
	public int updateReviewContent(Map<String, String> map);

}
