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
	//카트에 있는지 확인(먼저, 들어온 cart 객체에 item_id 고유의 값을 db를 통해 가져와서 set하고 selectCart 진행
	public int selectCart(ArrayList<Cart> cartList) {
		int tOf  = 0;
		for(int i = 0; i < cartList.size(); i++){
			cartList.get(i).setItemid(String.valueOf(sqlSession.selectOne(NAMESPACE + "selectItemId", cartList.get(i))));
			System.out.println(cartList.get(i).toString());
		}
		for(int i = 0; i < cartList.size(); i++){
			int result = (Integer)sqlSession.selectOne(NAMESPACE + "selectCart", cartList.get(i));
			if(result == 0){//있는지 검사해서 count(result)가 0 나오면 카트 추가//tOf가 0이면 카트에 이미 존재합니다. 0보다 크면 카트가 추가되었습니다.
				tOf += sqlSession.insert(NAMESPACE + "insertCart", cartList.get(i));
			}
			//tOf += (Integer)sqlSession.selectOne(NAMESPACE + "selectCart", cartList.get(i));//카트에서 유저아이디와, 아이템디테일아이디, 아이템아이디 모두 일치하는 count(*) 꺼내옴
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

	public List<String> selectCartId(ArrayList<Cart> cartList) {
		List<String> cartId = new ArrayList<String>();
		
		for(int i = 0; i < cartList.size(); i++){
			cartId.add(String.valueOf(sqlSession.selectOne(NAMESPACE + "selectCartId", cartList.get(i))));
		}
		
		return cartId;
	}

	public int updateReviewImage(List<String> deleteList, String reviewId) {
		int result = 0;
		String[] rImageColum = {"R_IMG01", "R_IMG02", "R_IMG03", "R_IMG04", "R_IMG05"};
		
		Map<String, String> map = new HashMap<String, String>(); 
		
		map.put("reviewId", reviewId);
		//map.put("rImage", rImage);
	
		for(int i = 0; i < deleteList.size(); i++){
			for(int j = 0; j < rImageColum.length; j++){
				map.put("rImageColum", rImageColum[j]);
				map.put("deleteList", deleteList.get(i));
				result += sqlSession.update(NAMESPACE + "updateReviewImage", map);
			}
		}
		
		
		return result;
	}

	public String selectMaxIndex(ManageForm form) {
		Review review = sqlSession.selectOne(NAMESPACE + "selectSingleReview", form);
		
		ArrayList<String> indexList = new ArrayList<String>();
		
		String img01 = null;
		String img02 = null;
		String img03 = null;
		String img04 = null;
		String img05 = null;
		
		if(review.getR_IMG01() != null){
			img01 = review.getR_IMG01();
			/*System.out.println("before : " + img01);
			System.out.println("after : " + img01.substring(img01.lastIndexOf("-") + 1, img01.length() - 4));*/
			img01 = img01.substring(img01.lastIndexOf("-") + 1, img01.length() - 4);
			img01 = img01.substring(img01.length() - 1);
			indexList.add(img01);
		}
		if(review.getR_IMG02() != null){
			img02 = review.getR_IMG02();
			img02 = img02.substring(img02.lastIndexOf("-") + 1, img02.length() - 4);
			img02 = img02.substring(img02.length() - 1);
			indexList.add(img02);
		}
		if(review.getR_IMG03() != null){
			img03 = review.getR_IMG03();
			img03 = img03.substring(img03.lastIndexOf("-") + 1, img03.length() - 4);
			img03 = img03.substring(img03.length() - 1);
			indexList.add(img03);
		}
		if(review.getR_IMG04() != null){
			img04 = review.getR_IMG04();
			img04 = img04.substring(img04.lastIndexOf("-") + 1, img04.length() - 4);
			img04 = img04.substring(img04.length() - 1);
			indexList.add(img04);
		}
		if(review.getR_IMG05() != null){
			img05 = review.getR_IMG05();
			img05 = img05.substring(img05.lastIndexOf("-") + 1, img05.length() - 4);
			img05 = img05.substring(img05.length() - 1);
			indexList.add(img05);
		}
		
		String maxIndex = Collections.max(indexList);
		
		return maxIndex;
	}

	public int insertReviewImage(List<String> insertReviewImage, String reviewId) {
		int result = 0;
		
		String[] rImageColum = {"R_IMG01", "R_IMG02", "R_IMG03", "R_IMG04", "R_IMG05"};
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("reviewId", reviewId);
		
		for(int i = 0; i < insertReviewImage.size(); i++){
			for(int j = 0; j < rImageColum.length; j++){
				map.put("rImageColum", rImageColum[j]);
				map.put("insertReviewImage", insertReviewImage.get(i));
				int semiResult = sqlSession.update(NAMESPACE + "insertReviewImage", map);
				if(semiResult > 0){
					result += semiResult;
					break;
				}
			}
			System.out.println(i);
		}
		
		
		return result;
	}

}
