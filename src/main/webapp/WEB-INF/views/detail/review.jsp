<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰</title>
<link rel="stylesheet" href="<c:url value='/resources/css/review.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/review_custom.css'/>" />

<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="/h72/resources/js/jquery.form.js"></script>
<script src="<c:url value='/resources/js/review.js'/>"></script>
<script>
	var focus_review_div = null;
	var focus_review_div_id = null;
	var reviewText = null;
	var reviewUser = null;
	var reviewDate = null;
	var imageLength = null;
	var imageFormOrigin = null;
	var delAndModiBtn_1 = null;
	var delAndModiBtn_2 = null;
	var textarea = null;
	var imageForm = null;
	var n = 1;
	var num = 1;
	var prefix = null;
	var tempArray = new Array();//mask 이미지 추가 삭제시 input file에 입력되는 파일명 저장하는 변수
	var tempItemDetailId = '${itemDetailId}';
	var superNum = 1;//input file
	var superNumFlow = 1;//thumnail
	var sum = 0;
	var maskThumnailId = null;
	var nextVal = null;
	var identity = null;
    $(document).ready(function(){
    	//console.log("11111111111");
    	
    	init(1);
    	bindEvent();
    });
</script>
</head>
  	
<body id="reviewBody" class="chrome chrome-53 windows_os products reviews ko-KR" lang="ko-KR" data-controller="products" data-action="reviews" data-username="null" data-login-alert="로그인이 필요한 서비스입니다. 로그인 하시겠습니까?" data-brand-code="10world.co.kr" data-mall-login-url="http://www.10world.co.kr/member/login.html" data-gaq-account="UA-45818307-7" data-iframe-id="crema-product-reviews-1"  data-scroll-to="null" data-scroll-top="null" data-loader-url="//assets2.cre.ma/m/widgets/loader.gif" data-target-id="null" data-has-message-handler="true" data-shop-builder="cafe24" data-rails-env="production" data-popup-height="null" data-fixed-top-menu-height="0" data-no-popstate="false">

    <div id="i18n" style="display: none" data-close="닫기" data-error-403="접근 권한이 없습니다." data-error-404="요청하신 페이지를 찾을 수 없습니다." data-error-422="요청이 거부되었습니다." data-error-etc="요청을 처리하던 중 오류가 발생했습니다. 조속히 해결하겠습니다." data-image-field-cant-add-photo-without-file-input="파일 선택창이 없어 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-without-file-reader="파일 미리 보기가 지원되는 브라우저가 아니어서 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-without-file="선택된 파일이 없어 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-with-file-type="선택된 파일이 이미지 형식이 아닙니다. (선택된 형식:%{file_type})" data-image-field-cant-add-photo-with-file-name="이미지 형식의 파일만 첨부할 수 있습니다. (선택된 파일명:%{file_name})" data-image-size-too-large="첨부한 이미지 파일이 너무 큽니다. 더 작은 이미지를 첨부해주세요." data-app-restrict-image-upload="파일 업로드를 하려면 모바일 기본브라우저에서 쇼핑몰 모바일웹(%{url})으로 접속해주세요." data-review-already-posted="이미 리뷰를 작성한 상품입니다." data-review-already-largest-image="현재 이미지가 원본 크기입니다." data-require-update-app="원활한 사진첨부를 위해서 앱 업데이트가 필요합니다. 업데이트 하시겠습니까?" data-social-media-already-sharing="공유 중입니다. 잠시 후 다시 시도해주세요." data-social-media-share-failed="공유에 실패했습니다. 잠시 후 다시 시도해주세요." data-social-media-share-success="공유했습니다. 창을 닫아 주세요." data-social-media-sharing="공유중 .." data-social-media-twitter-message-length="트위터 공유는 %{length}자 이내로 작성해 주세요"></div>

    <div id="content">


    <div class="product_reviews_list">
    
    <c:if test="${loginUser ne null}">
		<div class="widget new-review first ">
			<div class="widget-heading">
				<div class="widget-title">
					<strong>REVIEW</strong><span class="divider">|</span><span class="weak">문의글 혹은 악의적인 비방글은 무통보 삭제된다는 점 유의해주세요^^</span>
				</div>
				<!-- <div class="rfloat btn show-reviews-index" data-reviews-index-url="http://www.10world.co.kr/board/product/list.html?board_no=4">
					후기게시판
				</div> -->
			</div>
			
			
			<div class="widget-body">
      			<div class="reviews-form">
      			
  					<div id="data" data-allow-multiple-reviews-per-product="true"></div>
  				<%--<form action="radd?storeId=<%=s.getStoreId()%>&nickname=<%= nickname %>" method="post" enctype="multipart/form-data" style="margin:0;" > --%>
  					<form action="insertReview" autocomplete="off" id="form-new-product-review" class="form-review form-product-review new_review" data-login-required="true" enctype="multipart/form-data" accept-charset="UTF-8" data-remote="true" method="post">
  						<input name="utf8" type="hidden" value="✓">
    					<input type="hidden" name="thumbnail_summary" id="thumbnail_summary">
    					<input type="hidden" name="R_WRITER" id="loginUserId" value="${loginUser.userid}" />
    					<input type="hidden" name="ITEM_DETAIL_ID" value="${itemDetailId }" />
    					<input type="hidden" name="ItemDetailName" value="${itemDetailList[0].ITEM_NAME}" />
    					<input type="hidden" name="ItemPrice" value="${itemDetailList[0].PRICE}" />
    					<%-- <input type="hidden" name="loginUser" " value="${loginUser.levelcode}" /> --%>
    					
    					<div class="field-box message-field limit-count-container">

      						<textarea name="R_CONTENTS" class="input-block autogrow count-limit new-review-form" placeholder="so EASY! 리뷰 남기고 적립금 받아가세요 x )" maxlength="2000" col="5" cols="5000" data-login-required="true" data-up-counter="true" data-minimum-message-length="20" data-minimum-message-length-warning="글자수를 20자 이상 작성하셔야만 적립금이 지급됩니다. 그래도 작성하시겠습니까?" data-minimum-message-length-error="20자 보다 길게 써야 합니다."  id="review_message" data-validate="true" data-error-message="리뷰 메시지를 입력해주세요." style="height: 100px;"></textarea>
     	 					<div class="limit-counter">0</div>
		      				<div class="review-input-photos">
						        <div class="input-button review-photos">
						          <ul class="image-fields-container" data-max-images-count="4" data-images-count="0" data-limit-images-count-warning="사진은 최대 %{max_count}개까지 선택할 수 있으므로 선택한 사진 중 %{count}개만 첨부합니다" data-max-images-count-warning="리뷰 사진은 최대 4장까지 첨부가능합니다.">
						          
						    		<li class="image-field">
						    		
						  				<div class="wrap">
						        			<div class="fileWrap">
						        			<input type="file" name="reviewPhoto1" id="upBtn1" class="input-file hidden" accept="image/*" multiple="multiple" />
					        				<input type="file" name="reviewPhoto2" id="upBtn2" class="input-file hidden" accept="image/*" multiple="multiple" />
					        				<input type="file" name="reviewPhoto3" id="upBtn3" class="input-file hidden" accept="image/*" multiple="multiple" />
					        				<input type="file" name="reviewPhoto4" id="upBtn4" class="input-file hidden" accept="image/*" multiple="multiple" />
					        				<input type="file" name="reviewPhoto5" id="upBtn5" class="input-file hidden" accept="image/*" multiple="multiple" />
					        				</div>
					        				
										      	<div class="preview-container ">
										          <div class="hidden preview_div_1">
										          	<img class="preview" id="preview1" alt="preview" >
										          	<div class="image_field__remove_preview remove-preview hoverable"><div class="remove">삭제</div></div>
										          </div>
										          
										          <div class="hidden preview_div_2">
										          	<img class="preview" id="preview2" alt="preview" >
										          	<div class="image_field__remove_preview remove-preview hoverable"><div class="remove">삭제</div></div>
										          </div>
										          
										          <div class="hidden preview_div_3">
											          <img class="preview" id="preview3" alt="preview" >
											      	  <div class="image_field__remove_preview remove-preview hoverable"><div class="remove">삭제</div></div>
											      </div>
											      
											      <div class="hidden preview_div_4">
											          <img class="preview" id="preview4" alt="preview" >
											          <div class="image_field__remove_preview remove-preview hoverable"><div class="remove">삭제</div></div>
											      </div>
											      
											      <div class="hidden preview_div_5">
											          <img class="preview" id="preview5" alt="preview" >
											          <div class="image_field__remove_preview remove-preview hoverable"><div class="remove">삭제</div></div>
											      </div>
											      
											      <div class="image-inline-photo-add" style="display: none">
											      	  <img class="size-support hidden" src="//assets2.cre.ma/m/widgets/transparent.png" alt="Transparent">
							    					  <div class="input-image-container on-list">
								      					<span class="sprites-icon-camera inline"></span>
								      					<div class="add-image-caption">사진추가</div>
								    				  </div>
											      </div>
												</div> 
												
										</div>
									</li>
								  </ul>
						        </div>
		      				</div>
    					</div>
    			
    					<div class="input-area-container">
		      				<div class="field-box add-image-container" style="cursor: pointer;">
		        				<span class="sprites-icon-camera-black inline"></span>
		        				<div class="description review_form__add_first_photo" data-org-text="+ 사진추가">+ 사진추가</div>
		      				</div>
      
      <!------------------------------------------------------------------------------------------------------------------------------------------------------------>
							<div class="body first">
								<ul class="list">
									<li class="item text">
										<script>
											if($("input[name=star-input]").is(":checked")){
												$("#review_text_state").css("background", "green");
											}
										</script>
									</li>
								</ul>
							</div>
					
								<!-- <div class="body review write" id="review_modify" style="display:none;">
									<button type="button" class="border_radius soft" id="modifyGo">
										리뷰 수정하기
									</button>
								</div> -->
								
<%-- 							
/h72/resources${itemDetailList.get(0).DETAIL_IMG01 }
<ul class="images">
	<li>
		<a data-photo-review-popup-url="" class="photo-review-popup">
			<img class="review-image loaded" src="">
		</a>
	</li>
	<li>
		<a data-photo-review-popup-url="" class="photo-review-popup">
			<img class="review-image loaded" src="">
		</a>
	</li>
	<li>
		<a data-photo-review-popup-url="" class="photo-review-popup">
			<img class="review-image loaded" src="">
		</a>
	</li>
</ul>
			 --%>				
							
							
							
							
								
<!-- <div class="panel-footer no-border">
	<div class="actions-container">
		<div class="inline like-action " data-url="/10world.co.kr/reviews/98328/like?secure_username=003100300077006f0072006c0064002e0063006f002e006b0072002f0064006c0066006b007a006800640031">
			<div class="inline edit-review-container">
            	<a data-method="delete">
					<span class="delete-review hoverable">삭제</span>
				</a>
				<a>
					<span class="edit-review hoverable">수정</span>
				</a>
				<div class="inline edit-review-container-line"></div>
			</div>
		</div>
	</div>
</div> -->

      <!------------------------------------------------------------------------------------------------------------------------------------------------------------>
      
				      <input type="hidden" value="9001" name="review[product_id]" id="review_product_id">
				      <input type="hidden" value="24" name="review[review_source]" id="review_review_source">
				      <input type="hidden" name="review[sub_order_id]" id="review_sub_order_id">
				      <input type="hidden" name="review[position]" id="review_position">
				      
				      <button class="submit hoverable" type="submit" data-disable-with="저장 중...">
				        <div class="title">
				          <span class="fa fa-check-circle-o"></span>
				          <span class="review_form__post_review_label">리뷰 등록하기</span>
				          <!-- <script>$(".review_form__post_review_label").hover(function(){});</script> -->
				        </div>
					  </button>    
					</div>
				</form>
				
					<script>
					//<![CDATA[
						if(window.ClientSideValidations===undefined)window.ClientSideValidations={};window.ClientSideValidations.disabled_validators=[];window.ClientSideValidations.number_format={"separator":".","delimiter":","};if(window.ClientSideValidations.patterns===undefined)window.ClientSideValidations.patterns = {};window.ClientSideValidations.patterns.numericality=/^(-|\+)?(?:\d+|\d{1,3}(?:\,\d{3})+)(?:\.\d*)?$/;if(window.ClientSideValidations.forms===undefined)window.ClientSideValidations.forms={};window.ClientSideValidations.forms['form-new-product-review'] = {"type":"ActionView::Helpers::FormBuilder","input_tag":"\u003cspan id=\"input_tag\" /\u003e\u003cdiv class=\"field_with_errors\"\u003e\u003clabel for=\"\" class=\"message\"\u003e\u003c/label\u003e\u003c/div\u003e","label_tag":"\u003clabel id=\"label_tag\" /\u003e\u003cdiv class=\"field_with_errors\"\u003e\u003clabel for=\"\" class=\"message\"\u003e\u003c/label\u003e\u003c/div\u003e","validators":{"review[message]":{"presence":[{"message":"리뷰 메시지를 입력해주세요."}],"length":[{"messages":{"minimum":"2000자 이하로 작성해주세요.","maximum":"2000자 이하로 작성해주세요."},"minimum":1,"maximum":2000}],"review_message":[{"message":"리뷰 메시지를 입력해주세요."}],"profanity":[{"message":"금지어가 포함됐습니다."}]},"review[score]":{"numericality":[{"messages":{"numericality":"평점을 선택해주세요.","greater_than_or_equal_to":"translation missing: ko-KR.reviews.errors.score_numericality","less_than_or_equal_to":"translation missing: ko-KR.reviews.errors.score_numericality"},"greater_than_or_equal_to":1,"less_than_or_equal_to":5}]}}};
					//]]>
					</script>
				</div>
			</div>
		</div>
	</c:if>
		
		
		<div class="widget widget-reviews pagination-list  ">
        	<div class="products_reviews_header">
				<div class="products_reviews_header__upper">
					<span class="sort-type selected">
						<strong>Review</strong>  (<span class="reviews-count">${reviewListCount}</span>)
					</span>
				</div>
  				<div class="products_reviews_header__separator"></div>
  				
			</div>
			
			<div>
				<div class="widget-body product_reviews_list__body">
					<div class="page">
						<ul class="reviews reviews-product">

						<%-- <% for(int i = 0; i < 3; i++){ %> --%>
<!-- ///////////////////////////////////리뷰 폼 시작///////////////////////////////////// -->
<!-- ///////////////////////////////////리뷰 폼 끝///////////////////////////////////// -->
						<%-- <% } %> --%>

						</ul>
					</div>
				</div>
          
				<div class="product_reviews__footer"></div>
			</div>
		</div>
	</div>
	
	</div>
	
	<!-- 기능 스크립트 -->
<!--     <script src="http://assets2.cre.ma/latte/assets/10world-co-kr/pc/application-cd4d246ae420a7dcd98cdc699064dc36.js"></script> -->
    <!--[if IE 7]>
      <script src="//assets2.cre.ma/m/widgets/javascripts/ie7.js"></script>
    <![endif]-->
    <script>
	//<![CDATA[
	
	      var ajax_setup_args = {cache: true, dataType: "script", accepts: {
	        script: "text/javascript, application/javascript"
	      }};
	      $.ajaxSetup(ajax_setup_args);
	
	//]]>
	</script>    
<script>
//<![CDATA[

//]]>
</script>


</body></html>
