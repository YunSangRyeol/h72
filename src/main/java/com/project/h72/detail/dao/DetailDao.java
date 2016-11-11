package com.project.h72.detail.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.h72.cart.vo.Cart;
import com.project.h72.detail.vo.DetailDIVO;
import com.project.h72.detail.vo.DetailVO;
import com.project.h72.detail.vo.ManageForm;
import com.project.h72.detail.vo.Review;

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
			cartList.get(i).setItemid(String.valueOf(sqlSession.selectOne(NAMESPACE + "selectItemId", cartList.get(i))));
			System.out.println(cartList.get(i).toString());
		}
		for(int i = 0; i < cartList.size(); i++){
			tOf = sqlSession.selectList(NAMESPACE + "selectCart", cartList.get(i));//카트에서 유저아이디와, 아이템디테일아이디, 아이템아이디 모두 일치하는 count(*) 꺼내옴
		}
		return tOf;
	}

	public int selectReviewListCount(String itemDetailId) {
		int reviewListCount = sqlSession.selectOne(NAMESPACE + "selectReviewListCount", itemDetailId);
		return reviewListCount;
	}

	public List<Review> selectReview(Map<String, String> needPageData) {
		System.out.println("itemDetailId : " +needPageData.get("itemDetailId") + ", currentPage : " +needPageData.get("currentPage") + ", limit : " + needPageData.get("limit"));
		
		
		List<Review> reviewList = sqlSession.selectList(NAMESPACE + "selectReview", needPageData);
		/*System.out.println("페이징처리된 리뷰!!!!");
		for(Review r : reviewList){
			System.out.println("111111");
			System.out.println(r.toString());}*/
		return reviewList;
	}

	public int selectListNo() {
		int listNo = 0;
		String listNoCh = sqlSession.selectOne(NAMESPACE + "selectListNo");
		if(listNoCh == null){//리뷰가 없을 경우
			listNo = 1;
		}else{//리뷰가 있을 경우
			listNo = Integer.parseInt(listNoCh) + 1;
		}
		return listNo;
	}

	public int insertReview(Review review) {
		System.out.println(review.getITEM_DETAIL_ID());
		int listNo = selectListNo();
		System.out.println(listNo);
		int result = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("22222222222222222222222222222");
		if(listNo == 1){//처음 작성하는 리뷰라면
			map.put("review", review);
			map.put("listNo", listNo);
			
			result = sqlSession.insert(NAMESPACE + "insertFirstReview", map);
		}else{
			result = sqlSession.insert(NAMESPACE + "insertReview", review);
		}
		return result;
	}

	public int deleteReview(ManageForm form) {
		int result = sqlSession.delete(NAMESPACE + "deleteReview", form);
		return result;
	}

	public Review selectSingleReview(ManageForm form) {
		Review review = sqlSession.selectOne(NAMESPACE + "selectSingleReview", form);
		return review;
	}

}
