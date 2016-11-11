package com.project.h72.detail.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.h72.cart.vo.Cart;
import com.project.h72.detail.service.DetailServiceImpl;
import com.project.h72.detail.vo.DetailDIVO;
import com.project.h72.detail.vo.DetailVO;
import com.project.h72.detail.vo.ManageForm;
import com.project.h72.detail.vo.PageForm;
import com.project.h72.detail.vo.Review;
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
		System.out.println("ItemDetailId(param name) : " + ItemDetailId);
		List<DetailDIVO> itemDetailList = ds.selectDetailItem(ItemDetailId);
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
				/*@RequestParam("itemid") String itemid,*/
				//@RequestParam("userid") String userid,
				//@RequestParam("itemFullName") String itemFullName,
				//@RequestParam("itemDetailid") String itemDetailid,
				//@RequestParam("mainImg") String mainImg,
				//@RequestParam(value = "quantity[]") String[] quantity)
				//@RequestParam("cost") String[] cost,
				//@RequestParam("message") String message,
				//@RequestParam("KitYN") String KitYN,
				//@RequestParam("itemOptionName") String[] itemOptionName) 
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
							message, KitYN, arrItemOptionName[i]);
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
	
	
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
	public ModelAndView insertReview(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		request.getParameter("reviewList");
		System.out.println("insertReview run...");
		
		//전송 파일에 용량 제한을 두고 싶으면 정함 : 10 메가바이트로 할 경우
				int sizeLimit = 1024 * 1024 * 10;
				
				//전송 방식에 multipart 설정을 했는지 검사
				boolean isMultipart = ServletFileUpload.isMultipartContent(request);
				if(!isMultipart){
					RequestDispatcher errorPage = request.getRequestDispatcher("notice/noticeError.jsp");
					request.setAttribute("code", "nomulti");
					errorPage.forward(request, response);
				}
				
				//업로드된 파일의 저장 위치 지정
				//1. 웹 컨테이너 내에 저장 위치를 지정할 경우
				//String savePath = request.getSession().getServletContext().getRealPath("/uploadFiles/");
				//2. 임의로 파일 저장 폴더를 만들고, 위치를 지정할 경우
				String savePath = "C:\\Users\\0MyeongJun\\git\\h72\\src\\main\\webapp\\resources\\uploadFiles";
				//"C:\\h72\\workspace\\h72_local\\src\\main\\webapp\\resources\\uploadFiles";
				
				/*"D:\\SEARCHSTUDY\\forgit\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\searchStudy\\uploadFiles";*/
				
				//전송받을 파일명 저장용 변수
				//String originalFileName1 = null;
				ArrayList<String> originalFileNames = new ArrayList<String>();
				
				//실제 저장할 때 사용할 파일명 저장용 변수
				//String renameFileName1 = null;
				ArrayList<String> renameFileNames = new ArrayList<String>();

				//업로드한 날짜와 시간을 파일명으로 사용할 경우
				//시스템으로부터 현재 날짜와 시간 정보를 얻어옴
				long currentTime = System.currentTimeMillis();
				
				//파일명으로 사용할 날짜/시간에 대한 포맷 설정
				MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());		
				String rWriter = multi.getParameter("R_WRITER");
				String itemDetailId = multi.getParameter("ITEM_DETAIL_ID");
				String rContents = multi.getParameter("R_CONTENTS");
				String itemDetailName = multi.getParameter("ItemDetailName");
				String itemPrice = multi.getParameter("ItemPrice");
				
				
				System.out.println("writer : " + rWriter);
				System.out.println("id : " + itemDetailId);
				System.out.println("R_CONTENTS : " + rContents);
				System.out.println("ItemDetailName : " + itemDetailName);
				System.out.println("itemPrice : " + itemPrice);
		
				
				//////////////////////////////////////////////////////////
				
				Enumeration<String> files = multi.getFileNames();
				
				while(files.hasMoreElements()){
				//for(int i = 0; files.hasMoreElements(); i++){
					String name = files.nextElement();
					String originalFileName = multi.getFilesystemName(name);
					if(originalFileName != null){
						originalFileNames.add(originalFileName);
					}
				}
				
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
							
							String renameFileName = sb.append(itemDetailId + "_review_" + listNo + "_" + String.valueOf(index) + "."
										+ originalFileNames.get(i).substring(originalFileNames.get(i).lastIndexOf(".") + 1)).toString();
							System.out.println("after");
							System.out.println("리네임 :");
							System.out.println(renameFileName);
							System.out.println("------------------------------------");
							
							renameFileNames.add(renameFileName);
							
							File saveFile = new File(savePath + "\\" + originalFileNames.get(i));
							File newFile = new File(savePath + "\\" + renameFileNames.get(i));
							//java.lang.IndexOutOfBoundsException: Index: 3, Size: 1
							if(!saveFile.renameTo(newFile)){
								//파일 읽기용 변수
								int read = 0;
								//한번에 읽을 크기와 값 담을 배열 지정
								byte[] buf = new byte[1024];
								
								//파일 입력용 스트림
								FileInputStream fin = new FileInputStream(saveFile);
								FileOutputStream fout = new FileOutputStream(newFile);
								
								while((read = fin.read(buf, 0, buf.length)) != -1){
									fout.write(buf);
								}
								
								fin.close();
								fout.close();
								saveFile.delete();  //원본 삭제함
							}
							index++;
						}
					}
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
				
				/*String rWriter = multi.getParameter("R_WRITER");
				String itemDetailId = multi.getParameter("ITEM_DETAIL_ID");
				String rContents = multi.getParameter("R_CONTENTS");
				String itemDetailName = multi.getParameter("ItemDetailName");
				String itemPrice = multi.getParameter("ItemPrice");*/
				
				//String url = "redirect:http://localhost:8888/h72/detail/selectItem?ItemDetailId="+itemDetailId+"&ItemDetailName="+itemDetailName+"&ItemPrice="+itemDetailName;
				//String url = "selectItem?ItemDetailId=" + itemDetailId + "&ItemDetailName=" + itemDetailName + "&ItemPrice=" + itemPrice;
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
	
	
	
	
}
