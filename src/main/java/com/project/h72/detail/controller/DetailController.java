package com.project.h72.detail.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

//import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.h72.cart.vo.Cart;
import com.project.h72.detail.service.DetailServiceImpl;
import com.project.h72.detail.vo.DetailDIVO;
import com.project.h72.detail.vo.DetailVO;
import com.project.h72.detail.vo.ManageForm;
import com.project.h72.detail.vo.PageForm;
import com.project.h72.detail.vo.Review;
import com.project.h72.detail.vo.FileUpload;
import com.project.h72.member.controller.MemberController;

@Controller
@RequestMapping(value="/detail", method = RequestMethod.GET)
public class DetailController {
	//private static final Logger logger = LoggerFactory.getLogger(DetailController.class);
	@Autowired DetailServiceImpl ds;
	//@Autowired DetailVO dvo;
	
	@RequestMapping(value = "/selectDetailItem", method = RequestMethod.POST)
	public String selectDetailItem(String ItemDetailId, Model model){
		List<DetailVO> itemList = ds.selectItemList();
		model.addAttribute("itemList", itemList);
		return "detail/item";//item_detail_id 로 1범주 조회(ex.방한용품/장갑/보온포)
	}
	
	@RequestMapping(value = "/selectItem", method = RequestMethod.POST)
	public String selectItem(String ItemDetailId, Model model, HttpServletRequest request){
		//System.out.println("ItemDetailId(request) : " + request.getParameter("ItemDetailIddd"));
		
		//클릭했을 때 Item_detail_id 필수
		System.out.println("ItemDetailId : " + ItemDetailId);
		List<DetailDIVO> itemDetailList = ds.selectDetailItem(ItemDetailId);
		System.out.println("왜???????????????????????????????????/ : " + itemDetailList.get(0).getITEM_NAME());
		model.addAttribute("itemDetailList", itemDetailList);
		model.addAttribute("itemDetailId", ItemDetailId);
		
		return "detail/detail";//item_id 로 2범주 조회(ex.방한용품옵션/장갑옵션/보온포옵션)
	}
	
	
	@RequestMapping(value="/ajaxPage", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> transPage(@RequestBody PageForm form, HttpServletRequest request, Model model){
		System.out.println("wowowowowowowowowowowowowowo");
		System.out.println("form : " + form);
		///////////////////////////////////////////////////////////////////////
		//페이지 수 처리용 변수 
		String itemDetailId = form.getItemDetailId();
		int pageNo = form.getPageNo();
		int currentPage = 1;
		int limit = 5;	//한 페이지에 5개씩 출력
		
		
		if(pageNo != 0){
			currentPage = pageNo;
			System.out.println("page가 null이 아니면 currentPage 출력값 : " + currentPage);
		}else{
			System.out.println("page가 null이면 currentPage 출력값 : " + currentPage);
		}
		
		//페이징 처리된 리스트를 가져오는 데 필요한 데이터
		Map<String, String> needPageData = new HashMap<String, String>();
		needPageData.put("itemDetailId", itemDetailId);
		needPageData.put("currentPage", String.valueOf(currentPage));
		needPageData.put("limit", String.valueOf(limit));
		
		
		//전체 목록 갯수와 목록 전체를 리턴받음
		
		//1. 전체리뷰 갯수
		int reviewListCount = ds.selectReviewListCount(itemDetailId);
		System.out.println("reviewCount : " + reviewListCount); 
		//2. rownum으로 해당 페이지 수만큼의 review list 받음
		List<Review> reviewList = ds.selectReview(needPageData);
		
		//총 페이지수 계산 : 목록이 최소 1개일 때, 1 page 로 처리하기 위해 0.9 더함
		int maxPage = (int)((double)reviewListCount / limit + 0.9);
		//현재 페이지에 보여줄 시작 페이지 수 (1, 10, 20, .....)
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		System.out.println("11111111111 : " + startPage);
		//현재 페이지에 보여줄 마지막 페이지 수 (9, 19, 29, .....)
		int endPage = startPage + limit - 1;
		if(maxPage < endPage)
			endPage = maxPage;
		
		System.out.println("maxPage : " + maxPage + ", startPage : " + startPage + ", endPage : " + endPage);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("maxPage", maxPage);
		result.put("startPage", startPage);
		result.put("endPage", endPage);
		result.put("currentPage", currentPage);
		
		//페이징 처리 데이터
		if(reviewListCount == 0){
			System.out.println("list가 null일 경우");
			System.out.println(reviewList);
		}else{
			result.put("reviewList", reviewList);
			System.out.println("list가 null이 아닐 경우");
			System.out.println(reviewList);
		}
		result.put("reviewListCount", reviewListCount);
		
		System.out.println("ajax list : " + reviewList);
		
		///////////////////////////////////////////////////////////////////////
		
		
		int reviewListSize = reviewList.size();
		result.put("reviewListSize", reviewListSize);
		
		return result;
	}
	
	
	
	@RequestMapping(value = "/insertCart", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> insertCart(
				HttpServletRequest request, HttpServletResponse response, 
				String ItemId, Model model)
				throws Exception{
		
		
		String quantity = request.getParameter("quantity"); //int 로 바꿔야 함*******************
		String cost = request.getParameter("cost"); // int 로 바꿔야 함 //*******************
		String itemOptionName = request.getParameter("itemOptionName"); //*******************
		String[] arrQuantity = quantity.split(";");
		String[] arrCost = cost.split(";");
		String[] arrItemOptionName = itemOptionName.split(";");
		
		int op_count = Integer.parseInt(request.getParameter("op_count")); // 객체생성시 제외
		String userid = request.getParameter("userid");
		String itemFullName = request.getParameter("itemFullName");
		String itemDetailid = request.getParameter("itemDetailid");
		String mainImg = request.getParameter("mainImg");
		String message = request.getParameter("message");
		char KitYN = request.getParameter("KitYN").charAt(0);
		String kinds = request.getParameter("kinds");
		
		int result = 0;
		
		System.out.println("-----------------------------------------------");
		System.out.println("quantity : " + quantity + ", arrQuantity : " + arrQuantity.length +"개, "+arrQuantity.toString());
		System.out.println("cost : " + cost);
		System.out.println("itemOptionName : " + itemOptionName);
		System.out.println("op_count(선택된 옵션 갯수) : " + op_count);
		System.out.println("userid : " + userid);
		System.out.println("itemFullName : " + itemFullName);
		System.out.println("itemDetailid : " + itemDetailid);
		System.out.println("mainImg : " + mainImg);
		System.out.println("message : " + message);
		System.out.println("KitYN : " + KitYN);
		System.out.println("kinds : " + kinds);
		System.out.println("-----------------------------------------------");
		
		ArrayList<Cart> cartList = new ArrayList<Cart>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		//선택된 옵션이 있는 경우
		if ( op_count != 0 ){
			for(int i = 0; i < op_count; i++){
				Cart cart = new Cart(userid, itemFullName, itemDetailid, mainImg, 
							Integer.parseInt(arrQuantity[i]), Integer.parseInt(arrCost[i]), 
							KitYN, arrItemOptionName[i]);
				cartList.add(cart);				
			}
			for(Cart c : cartList)
				System.out.println(c.toString());
			System.out.println("-----------------------------------------------");
			
			//item_id는 view페이지에서 가져오기 힘드니까. item_name이랑, item_option_name 2개를 가져오고 db query 문에서 연결시켜 가져와서 카트로 넘겨주자. 
			
			//System.out.println("data from ajax : " + name);
			int tOf = 0;
			tOf = ds.selectCart(cartList);//장바구니에 추가하려는 상품이 장바구니에 들어있는지 확인//0이면 카트에 이미 있다는 말이고, 0 보다 크면 카트에 그 수만큼 상품 등록됐다는 의미
			int count = tOf;
			System.out.println("count : " + count);
			//System.out.println("sssssssssssssssssssssssssssssssss " + tOf.get(0));
			
			if(count == 0){//카트에 상품이 추가된 수가 0이라는 의미. 이미 있다!
				result = -1;
			}else{
				result = tOf;
			}
			map.put("result", result);
			
				
			//카트에 담긴 카트아이디[]를 가져옴
			List<String> cartId = ds.selectCartId(cartList);
			System.out.println("carId 시퀀스");
			for(String s : cartId)
				System.out.println(s);
			map.put("cartId", cartId);
			map.put("count", count);
		}
		//선택된 옵션이 없는 경우
		
		return map;
	}
	/*
 	public ModelAndView insertReview(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
 	*/
	
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
 	public ModelAndView insertReview(MultipartRequest multipartRequest,HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
 	
  		request.getParameter("reviewList");
  		System.out.println("insertReview run...");
  		
		//R_WRITER ITEM_DETAIL_ID R_CONTENTS ItemDetailName ItemPrice
		String rWriter = request.getParameter("R_WRITER");
		String itemDetailId = request.getParameter("ITEM_DETAIL_ID");
		String rContents = request.getParameter("R_CONTENTS");
		String itemDetailName = request.getParameter("ItemDetailName");
		String itemPrice = request.getParameter("ItemPrice");
		
		System.out.println("writer : " + rWriter);
		System.out.println("id : " + itemDetailId);
		System.out.println("R_CONTENTS : " + rContents);
		System.out.println("ItemDetailName : " + itemDetailName);
		System.out.println("itemPrice : " + itemPrice);
		
		//전송 파일에 용량 제한을 두고 싶으면 정함 : 10 메가바이트로 할 경우
		int sizeLimit = 1024 * 1024 * 10;
	
		ArrayList<String> originalFileNames = new ArrayList<String>();
		ArrayList<String> renameFileNames = new ArrayList<String>();
		ArrayList<MultipartFile> newFlist = new ArrayList<MultipartFile>();
		
		String savePath = "C:\\Users\\0MyeongJun\\git\\h72\\src\\main\\webapp\\resources\\uploadFiles";
		//"C:\\h72\\workspace\\h72_local\\src\\main\\webapp\\resources\\uploadFiles";
		
		MultipartFile mpf1 = multipartRequest.getFile("reviewPhoto1");
		MultipartFile mpf2 = multipartRequest.getFile("reviewPhoto2");
		MultipartFile mpf3 = multipartRequest.getFile("reviewPhoto3");
		MultipartFile mpf4 = multipartRequest.getFile("reviewPhoto4");
		MultipartFile mpf5 = multipartRequest.getFile("reviewPhoto5");
		
		if(!mpf1.getOriginalFilename().equals("") && mpf1.getOriginalFilename() != null){
			originalFileNames.add(mpf1.getOriginalFilename());
			newFlist.add(mpf1);
		}
		if(!mpf2.getOriginalFilename().equals("") && mpf2.getOriginalFilename() != null){
			originalFileNames.add(mpf2.getOriginalFilename());
			newFlist.add(mpf2);
		}
		if(!mpf3.getOriginalFilename().equals("") && mpf3.getOriginalFilename() != null){
			originalFileNames.add(mpf3.getOriginalFilename());
			newFlist.add(mpf3);
		}
		if(!mpf4.getOriginalFilename().equals("") && mpf4.getOriginalFilename() != null){
			originalFileNames.add(mpf4.getOriginalFilename());
			newFlist.add(mpf4);
		}
		if(!mpf5.getOriginalFilename().equals("") && mpf5.getOriginalFilename() != null){
			originalFileNames.add(mpf5.getOriginalFilename());
			newFlist.add(mpf5);
		}
		
		System.out.println(originalFileNames.size() + "개");
		int result = 0;
		int listNo = 0;
		
		if(originalFileNames.size() > 0){
			Collections.reverse(originalFileNames);
			
			listNo = ds.selectListNo();
			
			System.out.println("listNo : " + listNo);
		
			//바꿀 파일명 만들기
			int index = 1;
			System.out.println("index : " + index);
			
			for(int i = 0; i < originalFileNames.size(); i++){
				System.out.println("자.... 리네임을 시작합니다. 먼저!!!!!!!!! \noriginalFileNames.size() : " + originalFileNames.size());
				if(originalFileNames != null){
					StringBuilder sb = new StringBuilder();
					System.out.println("originalFileNames.get(i) : " + originalFileNames.get(i));
					
					String renameFileName = sb.append(itemDetailId + "_review-" + listNo + "_" + String.valueOf(index) + "."
								+ originalFileNames.get(i).substring(originalFileNames.get(i).lastIndexOf(".") + 1)).toString();
					System.out.println("after");
					System.out.println("리네임 :");
					System.out.println(renameFileName);
					System.out.println("------------------------------------");
					
					renameFileNames.add(renameFileName);
					index++;
				}
			}
		}
		
		for(int i = 0; i < originalFileNames.size(); i++){
			FileUpload.fileUpload(newFlist.get(i), savePath, renameFileNames.get(i));
		}
		
		
		
			Review review = null;
			
			if(renameFileNames.size() == 0){
				review = new Review(itemDetailId, rWriter, rContents);
			}else if(renameFileNames.size() == 1){ // 사진 1장 업로드
				review = new Review(itemDetailId, rWriter, rContents, renameFileNames.get(0));
			}else if(renameFileNames.size() == 2){ // 사진 2장 업로드
				review = new Review(itemDetailId, rWriter, rContents, renameFileNames.get(0), renameFileNames.get(1));
			}else if(renameFileNames.size() == 3){ // 사진 3장 업로드
				review = new Review(itemDetailId, rWriter, rContents, renameFileNames.get(0), renameFileNames.get(1), renameFileNames.get(2));
			}else if(renameFileNames.size() == 4){ // 사진 4장 업로드
				review = new Review(itemDetailId, rWriter, rContents, renameFileNames.get(0), renameFileNames.get(1), renameFileNames.get(2), renameFileNames.get(3));
			}else if(renameFileNames.size() == 5){ // 사진 5장 업로드
				review = new Review(itemDetailId, rWriter, rContents, renameFileNames.get(0), renameFileNames.get(1), renameFileNames.get(2), renameFileNames.get(3), renameFileNames.get(4));
			}
			
			System.out.println("11111111111111111");
			System.out.println(review);
			result = ds.insertReview(review);
		
		
			String url = "selectItem?ItemDetailId=" + itemDetailId;
			ModelAndView mav = new ModelAndView();
			
			
			if(result > 0){
				//mav.addObject(url);
				mav.setView(new RedirectView(url));
			}
			System.out.println("result !!!!!!!!\n" + result);
		
 				
 		return mav;//ajax사용 출력
 	}
	
	
	@RequestMapping(value = "/selectReview", method = RequestMethod.POST)
	@ResponseBody
	public String selectReview(HttpServletRequest request, String ItemId, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		
		return "detail/review";
	}
	
	
	@RequestMapping(value="/deleteReview", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReview(@RequestBody ManageForm form, HttpServletRequest request, Model model){
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("deleteReview run...");
		System.out.println(form);
		
		//1. 디렉토리에 저장된 이미지파일 지워주기 위해 지워주려고하는 리뷰를 가져옴
		Review review = ds.selectSingleReview(form);
		System.out.println("delete review info : " + review);
		
		ArrayList<String> arr = new ArrayList<String>();
		
		String img01 = null;
		String img02 = null;
		String img03 = null;
		String img04 = null;
		String img05 = null;
		
		if(review.getR_IMG01() != null){
			img01 = review.getR_IMG01();
			arr.add(img01);
		}
		if(review.getR_IMG02() != null){
			img02 = review.getR_IMG02();
			arr.add(img02);
		}
		if(review.getR_IMG03() != null){
			img03 = review.getR_IMG03();
			arr.add(img03);
		}
		if(review.getR_IMG04() != null){
			img04 = review.getR_IMG04();
			arr.add(img04);
		}
		if(review.getR_IMG05() != null){
			img05 = review.getR_IMG05();
			arr.add(img05);
		}
		
		System.out.println(img01 + ", " + img02 + ", " + img03 + ", " + img04 + ", " + img05 + ", arr size : " + arr.size());
		
		String savePath = "C:\\Users\\0MyeongJun\\git\\h72\\src\\main\\webapp\\resources\\uploadFiles";
		//"C:\\h72\\workspace\\h72_local\\src\\main\\webapp\\resources\\uploadFiles";
		
		for(int i = 0; i < arr.size(); i++){
			File imgFile = new File(savePath + "\\" + arr.get(i));
			imgFile.delete();
		}
		
		
		
		//2. 전달 받은 review번호(reviewNo) 와 userid(user)를 가지고 delete 
		int result = ds.deleteReview(form);
		
		map.put("result", result);
		
		if(result > 0){
			System.out.println(form.getReviewNo() + "번 리뷰가 삭제되었습니다.");
			int reviewListCount = ds.selectReviewListCount(form.getItemDetailId());
			map.put("reviewListCount", reviewListCount);
		}else{
			System.out.println(form.getReviewNo() + "번 리뷰 삭제 실패");
		}
		System.out.println("result : " + result);
		
		return map;
	}
	
	/*	@RequestMapping(value="/maskModify", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> maskModify(@RequestBody ArrayList<String> totalImageArr, 
										  HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{*/
	
	
	@RequestMapping(value = "/maskModify", method = RequestMethod.POST)
	public ModelAndView maskModify(@RequestParam("fileId[]") String[] fileId, 
									MultipartRequest multipartRequest,HttpSession session,HttpServletRequest request, 
									HttpServletResponse response) throws Exception {
		
		System.out.println("maskModify run...");
		List<MultipartFile> newFlist = new ArrayList<MultipartFile>();
		List<MultipartFile> flist = multipartRequest.getFiles("reviewPhoto");
		
		String reviewText = request.getParameter("reviewText");
		String itemDetailId = request.getParameter("ITEM_DETAIL_ID");
		String reviewId = request.getParameter("reviewId");
		String reviewUser = request.getParameter("reviewUser");
		
		System.out.println("***********************");
		System.out.println("reviewText : " + reviewText);
		System.out.println("itemDetailId : " + itemDetailId);
		System.out.println("reviewId : " + reviewId + "번");
		System.out.println("reviewUser : " + reviewUser);
		ManageForm form = new ManageForm(reviewId, reviewUser, itemDetailId);
		System.out.println("***********************");
		//System.out.println("fileId : " + fileId);
	
		String renameFileName = null;
		ArrayList<String> originalFileNames = new ArrayList<String>();
		ArrayList<String> renameFileNames = new ArrayList<String>();
		System.out.println("들어온 file 총 갯수(공백포함) : " + flist.size() + " 개");
		System.out.println("--------------------");
		
		int index = 1;
		
		String maxIndex = ds.selectMaxIndex(form);
		if(maxIndex != null){
			index = Integer.parseInt(maxIndex) + 1;
		}
		
		String savePath = "C:\\Users\\0MyeongJun\\git\\h72\\src\\main\\webapp\\resources\\uploadFiles";
		//"C:\\h72\\workspace\\h72_local\\src\\main\\webapp\\resources\\uploadFiles";
		
		
		//들어온 파일(공백 포함) 이름
		for(int i = 0; i < flist.size(); i++){
			System.out.println("reviewPhoto : " + flist.get(i).getOriginalFilename());
			System.out.println("------------------------------");
		}
		
		for(int i = 0; i < flist.size(); i++){
			if(flist.get(i).getOriginalFilename().equals("")){
				//System.out.println("공백");
			}else{
				String originalFileName = flist.get(i).getOriginalFilename(); 
				//System.out.println(originalFileName);
				originalFileNames.add(originalFileName);
				newFlist.add(flist.get(i));
			}
		}
		for(int i = 0; i < originalFileNames.size(); i++){
			StringBuilder sb = new StringBuilder();
			renameFileName = sb.append(itemDetailId + "_review_" + reviewId + "_" + String.valueOf(index) + "."
					+ originalFileNames.get(i).substring(originalFileNames.get(i).lastIndexOf(".") + 1)).toString();
			renameFileNames.add(renameFileName);
			index++;
		}
		System.out.println("***********************");
		System.out.println("들어온 file 갯수(공백 제거): " + originalFileNames.size() + "개");
		
		for(String s : originalFileNames){
			System.out.println(s);
		}
		System.out.println("***********************");
		System.out.println("리네임 후");
		for(String s : renameFileNames){
			System.out.println("reviewPhoto : " + s);
		}
		System.out.println("***********************");
		
		
		
		
		//기존 리뷰 이미지 불러와서 고유 번호 문자열만 뽑아내서 list에 저장
		Review review = ds.selectSingleReview(form);
		
		ArrayList<String> isHaved = new ArrayList<String>();
		
		
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
			isHaved.add(img01);
		}
		if(review.getR_IMG02() != null){
			img02 = review.getR_IMG02();
			img02 = img02.substring(img02.lastIndexOf("-") + 1, img02.length() - 4);
			isHaved.add(img02);
		}
		if(review.getR_IMG03() != null){
			img03 = review.getR_IMG03();
			img03 = img03.substring(img03.lastIndexOf("-") + 1, img03.length() - 4);
			isHaved.add(img03);
		}
		if(review.getR_IMG04() != null){
			img04 = review.getR_IMG04();
			img04 = img04.substring(img04.lastIndexOf("-") + 1, img04.length() - 4);
			isHaved.add(img04);
		}
		if(review.getR_IMG05() != null){
			img05 = review.getR_IMG05();
			img05 = img05.substring(img05.lastIndexOf("-") + 1, img05.length() - 4);
			isHaved.add(img05);
		}
		System.out.println("***********************");
		System.out.println("저장되어 있던 이미지 고유번호 추출 isHaved");
		System.out.println("isHaved 갯수 : " + isHaved.size() + "개");
		for(int i = 0; i < isHaved.size(); i++){
			System.out.println("isHaved : " + isHaved.get(i));
		}
		System.out.println("***********************");
		
		//input file 아래에 있는 input hidden 에 입력된 val(기존에 있던 image 고유번호 추출하여 put해준 값)을 고유번호로 식별하여 가져옴
		List<String> isNew = new ArrayList<String>();
		
		System.out.println("fileId 갯수(마지막 빈값 포함): " + fileId.length + "개");
		System.out.println("fileId 갯수(마지막 빈값 제거): " + (fileId.length - 1) + "개");
		
		for(int i = 0; i < fileId.length - 1; i++){
			isNew.add(fileId[i]);
		}
		
		for(String s : isNew)
			System.out.println("isNew : " + s);
		
		//String fileId = request.getParameter("fileId");
		System.out.println("***********************");
		
		List<String> insertList = new ArrayList(isNew);
		List<String> deleteList = new ArrayList(isHaved);
		
		System.out.println("들어온 file 총 갯수(공백포함) : " + flist.size() + " 개");
		System.out.println("들어온 file 총 갯수(공백포함, 마지막에 딸려온 빈 요소 제거) : " + (flist.size() - 1) + " 개");
		
		
		/*deleteList*/
		//들어온 file 총 갯수(공백포함, 마지막에 딸려온 빈 요소 제거){flist.size() - 1} 갯수만큼 반복하면서 각요소들이 isHaved 에 포함되는지 검사 후 포함되면 해당 요소 제거
		//원래있던 list에서 새로 들어온 list와 중복되는 요소를 제거해주면 제거해줘야하는 요소만 남게 된다.
		
		deleteList.removeAll(isNew);
		
		System.out.println("****** 제거 리스트 ******");
		for(String s : deleteList)
			System.out.println(s);
		
		List<String> delFile = new ArrayList<String>();//삭제할 파일
		String savePath1 = "C:\\Users\\0MyeongJun\\git\\h72\\src\\main\\webapp\\resources\\uploadFiles";
		//"C:\\h72\\workspace\\h72_local\\src\\main\\webapp\\resources\\uploadFiles";
		
		
		for(String s : deleteList){
			delFile.add(itemDetailId + "_review-" + s + ".jpg");
			delFile.add(itemDetailId + "_review-" + s + ".png");
			delFile.add(itemDetailId + "_review-" + s + ".gif");
		}
		//BAG0001_review_2_2.gif
		System.out.println("delFile : " + delFile);
		for(int i = 0; i < delFile.size(); i++){
			File imgFile = new File(savePath + "\\" + delFile.get(i));
			imgFile.delete();
		}
		
		
		System.out.println("*****************");
		
		
		if(deleteList != null){
			//DB 제거 코드
			int result = ds.updateReviewImage(deleteList, reviewId);
			System.out.println("이미지 " + result + "개 수정 완료");
		}
		
		
		
		/*insertList*/
		//들어온 file 총 갯수(공백포함, 마지막에 딸려온 빈 요소 제거){flist.size() - 1} 갯수만큼 반복하면서 isHaved 각요소들이 isNew 에 포함되는지 검사 후 포함되면 해당 요소 제거
		//isNew list에서 원래 있던 list와 중복되는 요소를 제거해주면 추가해줘야하는 요소만 남게 된다.
		
		insertList.removeAll(isHaved);
		
		ArrayList<String> insertReviewImage = new ArrayList<String>();
		
		for(int i = 0; i < insertList.size(); i++){
			for(int j = 0; j < renameFileNames.size(); j++){
				if(renameFileNames.get(j).indexOf(insertList.get(i)) >= 0){
					insertReviewImage.add(renameFileNames.get(j));
				}
			}
		}
		
		System.out.println("****** 추가 리스트 ******");
		for(String s : insertList)
			System.out.println(s);
		System.out.println("------------------");
		for(String s : insertReviewImage)
			System.out.println(s);
		System.out.println("*****************");
		
		if(insertList != null){
			//DB insert 코드
			int result = ds.insertReviewImage(insertReviewImage, reviewId);
			System.out.println("이미지 " + result + "개 insert 수정 완료");
		}
		
		
		System.out.println("파일 저장 중");
		for(int i = 0; i < originalFileNames.size(); i++){
			FileUpload.fileUpload(newFlist.get(i), savePath, renameFileNames.get(i));
		}
		System.out.println("파일 저장 성공");
		
		String url = "selectItem?ItemDetailId=" + itemDetailId;
		ModelAndView mav = new ModelAndView();
		/*if(result > 0){
			//mav.addObject(url);
			mav.setView(new RedirectView(url));
		}*/
		mav.setView(new RedirectView(url));
		
		return mav;
	}
	
	@RequestMapping(value = "/maxIndex", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> maxIndex(@RequestBody ManageForm form, MultipartRequest multipartRequest,HttpSession session,HttpServletRequest request, HttpServletResponse response){
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("maxIndex run...");
		System.out.println(form);
		
		//int maxIndex = Integer.parseInt(ds.selectMaxIndex(form));
		
		
		//int reviewId = Integer.parseInt(request.getParameter("focus_review_div_id"));
		//ManageForm form = new ManageForm(reviewId, reviewUser, itemDetailId);
		
		return null;
	}
	
	
	
	
	
	
	
	
	
}
