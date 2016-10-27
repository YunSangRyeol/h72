<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths placeholder cssfilters svgfilters">
	<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="csrf-param" content="authenticity_token">
	<meta name="csrf-token" content="cXMGgVE0tX68fDGwD1zWYVslkazLPhLlAfEFMkf6x3xNEMpcWGz7hZdHDRsl3OnlTN/hy/1EBPLx6g2p08DRqw==">
    <title>상품 리뷰</title>
    <!--[if lt IE 9]>
      <script src="//assets2.cre.ma/m/widgets/javascripts/html5shiv-printshiv.js"></script>
    <![endif]-->
    <!-- <link rel="stylesheet" media="all" href="http://assets2.cre.ma/latte/assets/10world-co-kr/pc/application-1f60e77d3e2264c404a4f00d7dc3b2d2.css"> -->
    <link rel="stylesheet" href="/h72/resources/css/review.css" />
    <style type="text/css">
	span.star, span.camera, .sprite_comment {
	  background-image: url(http://assets2.cre.ma/p/10world-co-kr/brand_settings/00/00/00/00/01/sprite/582cbe9cb5adad16.png);
	}
	
	.mall-link-color {
	  color: #6eb67e;
	}
	
	.review_comment_color {
	  color: #6db67e;
	}
    </style>
    
    <style type="text/css">
	.review-submit-button, .review-submit-button:hover, .review-submit-button:active  {
	  border: 1px solid #363636;
	  background: #363636;
	  background: linear-gradient(to bottom, #363636 0%,#363636 2%,#363636 3%,#363636 100%);
	  background: -ms-linear-gradient(top,  #363636 0%,#023E69 2%,#363636 3%,#363636 100%);
	  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=#363636, endColorstr=#363636,GradientType=0 );
	  text-shadow: 0 -1px 0 #363636;
	}

	body.products.reviews #review-photo-thumbnails .product-thumbnail-container .photo-review-thumbnail a img+img {display: none !important;}
	body.products.reviews #review-photo-thumbnails .product-thumbnail-container .photo-review-thumbnail a img {filter: none;}
	</style>
	
    <style type="text/css">
    /* .new-review.widget .widget-heading {display: none;} */
	body.products.reviews .widget.widget-reviews .widget-heading .review-options-search, #review-edit-form .widget.widget-reviews .widget-heading .review-options-search {width: 475px;}

	/* .new-review.widget .widget-heading {display: none;} */
	/* body.products.reviews .widget.widget-reviews .widget-heading .review-options-search, #review-edit-form .widget.widget-reviews .widget-heading .review-options-search {width: 475px;} */


	/* body.products.reviews .widget.new-review, 
	#review-edit-form .widget.new-review {padding: 44px 0;} */

	/* #form-new-product-review .add-image-container {width: 214px;} */
	/* #form-new-product-review .add-image-container .description {left: 59px;} */
	/* #form-new-product-review .field-box-container {margin: 0px 444px 0 230px;} */

	.review-options-search {padding: 0;}
	.review-options-search ul.review_option_types {top: -39px;}
	/* body.products.reviews ul.reviews li.review, body.products.reviews ul.header li.review, #review-edit-form ul.reviews li.review, #review-edit-form ul.header li.review {line-height: 15px; margin-top: 25px; font-family: '돋움',Dotum,AppleGothic,sans-serif; font-size: 11px;} */
	body.products.reviews ul.reviews, body.products.reviews ul.header, #review-edit-form ul.reviews, #review-edit-form ul.header {ont-family: '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', Sans-serif;}
62022645
	.widget .widget-body {border-bottom: 0;}
	body.products.reviews #review-photo-thumbnails .product-thumbnail-container, #review-edit-form #review-photo-thumbnails .product-thumbnail-container {width: 953px;}
	body.products.reviews #review-photo-thumbnails .product-thumbnail-container .photo-review-thumbnail a img, 
	#review-edit-form #review-photo-thumbnails .product-thumbnail-container .photo-review-thumbnail a img {
	width: 63px !important; height: 63px !important;}
	/* body.products.reviews ul.reviews .review-content-expanded, 
	body.products.reviews ul.header .review-content-expanded, 
	#review-edit-form ul.reviews .review-content-expanded, 
	#review-edit-form ul.header .review-content-expanded {
	padding: 0 !important; border-top: 0;
	} */
	ul.reviews.reviews-product li.review ul.images li {height: 125px;}
	/* .product_review__info_container {font-family: '돋움',Dotum,AppleGothic,sans-serif;} */

	li.review .l-contents .star-wrap .review-tags {margin-top: -4px;}

	.review_option__title {
	  width: 20%;
	}

	.review_option__content {
	  width: 80%;
	}
	</style>

    
    <!-- <script type="text/javascript" async="" src="//stats.g.doubleclick.net/dc.js"></script> -->
    <script>
      function fimg(id, w, h) {
        var img = document.getElementById(id);
        if(img && !img.complete) {
          var width = img.width || img.offsetWidth;
          img.style.height = Math.round(img.width / w * h) + "px";
          img.onload = function() {
            this.style.height = "";
          }
        }
      }
    </script>
  	</head>
  	
  	
<body class="chrome chrome-53 windows_os products reviews ko-KR" lang="ko-KR" data-controller="products" data-action="reviews" data-username="null" data-login-alert="로그인이 필요한 서비스입니다. 로그인 하시겠습니까?" data-brand-code="10world.co.kr" data-mall-login-url="http://www.10world.co.kr/member/login.html" data-gaq-account="UA-45818307-7" data-iframe-id="crema-product-reviews-1"  data-scroll-to="null" data-scroll-top="null" data-loader-url="//assets2.cre.ma/m/widgets/loader.gif" data-target-id="null" data-has-message-handler="true" data-shop-builder="cafe24" data-rails-env="production" data-popup-height="null" data-fixed-top-menu-height="0" data-no-popstate="false">
    
    <div id="i18n" style="display: none" data-close="닫기" data-error-403="접근 권한이 없습니다." data-error-404="요청하신 페이지를 찾을 수 없습니다." data-error-422="요청이 거부되었습니다." data-error-etc="요청을 처리하던 중 오류가 발생했습니다. 조속히 해결하겠습니다." data-image-field-cant-add-photo-without-file-input="파일 선택창이 없어 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-without-file-reader="파일 미리 보기가 지원되는 브라우저가 아니어서 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-without-file="선택된 파일이 없어 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-with-file-type="선택된 파일이 이미지 형식이 아닙니다. (선택된 형식:%{file_type})" data-image-field-cant-add-photo-with-file-name="이미지 형식의 파일만 첨부할 수 있습니다. (선택된 파일명:%{file_name})" data-image-size-too-large="첨부한 이미지 파일이 너무 큽니다. 더 작은 이미지를 첨부해주세요." data-app-restrict-image-upload="파일 업로드를 하려면 모바일 기본브라우저에서 쇼핑몰 모바일웹(%{url})으로 접속해주세요." data-review-already-posted="이미 리뷰를 작성한 상품입니다." data-review-already-largest-image="현재 이미지가 원본 크기입니다." data-require-update-app="원활한 사진첨부를 위해서 앱 업데이트가 필요합니다. 업데이트 하시겠습니까?" data-social-media-already-sharing="공유 중입니다. 잠시 후 다시 시도해주세요." data-social-media-share-failed="공유에 실패했습니다. 잠시 후 다시 시도해주세요." data-social-media-share-success="공유했습니다. 창을 닫아 주세요." data-social-media-sharing="공유중 .." data-social-media-twitter-message-length="트위터 공유는 %{length}자 이내로 작성해 주세요"></div>

    <div id="content">


    <div class="product_reviews_list">
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
  				<form data-validate="true" autocomplete="off" id="form-new-product-review" class="form-review form-product-review new_review" novalidate="novalidate" data-login-required="true" data-review-message-default="" data-already-posted="null" data-alert-requirement="true" data-disable-save-requirement="false" data-not-creatable-reason="null" enctype="multipart/form-data" action="/10world.co.kr/products/post?secure_username=MTB3b3JsZC5jby5rci9kbGZremhkMQ%3D%3D" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓">
    			<input type="hidden" name="thumbnail_summary" id="thumbnail_summary">
    			<div class="field-box message-field limit-count-container">

      				<textarea class="input-block autogrow count-limit new-review-form" placeholder="so EASY! 리뷰 남기고 적립금 받아가세요 x )" maxlength="2000" col="5" cols="5000" data-login-required="true" data-up-counter="true" data-minimum-message-length="20" data-minimum-message-length-warning="글자수를 20자 이상 작성하셔야만 적립금이 지급됩니다. 그래도 작성하시겠습니까?" data-minimum-message-length-error="20자 보다 길게 써야 합니다." name="review[message]" id="review_message" data-validate="true" data-error-message="리뷰 메시지를 입력해주세요." style="height: 100px;"></textarea>
     	 			<div class="limit-counter">0</div>
      				<div class="review-input-photos">
				        <div class="input-button review-photos">
				          <ul class="image-fields-container" data-max-images-count="4" data-images-count="0" data-limit-images-count-warning="사진은 최대 %{max_count}개까지 선택할 수 있으므로 선택한 사진 중 %{count}개만 첨부합니다" data-max-images-count-warning="리뷰 사진은 최대 4장까지 첨부가능합니다.">
				    		<li class="image-field">
				  				<div class="wrap">
				    				<img class="size-support" src="//assets2.cre.ma/m/widgets/transparent.png" alt="Transparent">
				    					<div class="input-image-container on-list">
				      					<span class="sprites-icon-camera inline"></span>
				      					<div class="add-image-caption">사진추가</div>
				    					</div>
				        				<input type="file" name="review[images][]" class="input-file" accept="image/*" multiple="multiple" data-upload-image-url="http://widgets2.cre.ma/10world.co.kr/preview_images/upload?secure_username=MTB3b3JsZC5jby5rci9kbGZremhkMQ%3D%3D">
				
								      	<div class="preview-container hidden">
								          <img class="preview" alt="preview">
								          <div class="image_field__remove_preview remove-preview hoverable"><div class="remove">삭제</div></div>
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
      
      <!-- <div class="field-box-container">
        <div class="field-box">
          <div class="select2-container select-rating" id="s2id_review_score">
	          <a href="javascript:void(0)" onclick="return false;" class="select2-choice" tabindex="-1">   
	          <div class="select2-chosen">
		          <div class="item">
			          <span class="star"></span>
			          <span class="star"></span>
			          <span class="star"></span>
			          <span class="star"></span><span class="star"></span>
			          <span class="text">아주 좋아요</span>
		          </div>
	          </div>
	          <abbr class="select2-search-choice-close"></abbr>   
	          <span class="select2-arrow"><b></b></span>
	          <span class="sprites-icon-drop-down"></span>
	          </a>
	          <input class="select2-focusser select2-offscreen" type="text" id="s2id_autogen4">
	          <div class="select2-drop select2-display-none">   
				  <div class="select2-search select2-search-hidden select2-offscreen">       
		          	<input type="text" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" class="select2-input">   
		          </div>   
		          <ul class="select2-results"></ul>
	          </div>
          </div>
          <select class="select-rating select2-offscreen" name="review[score]" id="review_score" tabindex="-1">
          	<option selected="selected" value="5">아주 좋아요</option>
			<option value="4">맘에 들어요</option>
			<option value="3">보통이에요</option>
			<option value="2">그냥 그래요</option>
			<option value="1">별로에요</option>
		  </select>
        </div>
      </div> -->
      <input type="hidden" value="9001" name="review[product_id]" id="review_product_id">
      <input type="hidden" value="24" name="review[review_source]" id="review_review_source">
      <input type="hidden" name="review[sub_order_id]" id="review_sub_order_id">
      <input type="hidden" name="review[position]" id="review_position">
      <button class="submit hoverable" type="submit" data-disable-with="저장 중...">
        <div class="title">
          <span class="fa fa-check-circle-o"></span>
          <span class="review_form__post_review_label">리뷰 등록하기</span>
        </div>
	  </button>    
</div>
<script type="text/x-jquery-tmpl" class="new-image-field">
<li class="image-field">
  <div class="wrap">
    <img class="size-support" src="//assets2.cre.ma/m/widgets/transparent.png" alt="Transparent" />
    <div class="input-image-container on-list">
      <span class="sprites-icon-camera inline"></span>
      <div class="add-image-caption">사진추가</div>
    </div>
      <input type="file" name="review[images][]" class="input-file" accept="image/*" multiple="multiple" data-upload-image-url="http://widgets2.cre.ma/10world.co.kr/preview_images/upload?secure_username=MTB3b3JsZC5jby5rci9kbGZremhkMQ%3D%3D" />
      <div class="preview-container hidden">
        <img class="preview" alt="preview">
        <div class="image_field__remove_preview remove-preview hoverable">
          <div>삭제</div>
        </div>
      </div>
  </div>
</li>
    </script>
				</form>
				
	<script>
	//<![CDATA[
	if(window.ClientSideValidations===undefined)window.ClientSideValidations={};window.ClientSideValidations.disabled_validators=[];window.ClientSideValidations.number_format={"separator":".","delimiter":","};if(window.ClientSideValidations.patterns===undefined)window.ClientSideValidations.patterns = {};window.ClientSideValidations.patterns.numericality=/^(-|\+)?(?:\d+|\d{1,3}(?:\,\d{3})+)(?:\.\d*)?$/;if(window.ClientSideValidations.forms===undefined)window.ClientSideValidations.forms={};window.ClientSideValidations.forms['form-new-product-review'] = {"type":"ActionView::Helpers::FormBuilder","input_tag":"\u003cspan id=\"input_tag\" /\u003e\u003cdiv class=\"field_with_errors\"\u003e\u003clabel for=\"\" class=\"message\"\u003e\u003c/label\u003e\u003c/div\u003e","label_tag":"\u003clabel id=\"label_tag\" /\u003e\u003cdiv class=\"field_with_errors\"\u003e\u003clabel for=\"\" class=\"message\"\u003e\u003c/label\u003e\u003c/div\u003e","validators":{"review[message]":{"presence":[{"message":"리뷰 메시지를 입력해주세요."}],"length":[{"messages":{"minimum":"2000자 이하로 작성해주세요.","maximum":"2000자 이하로 작성해주세요."},"minimum":1,"maximum":2000}],"review_message":[{"message":"리뷰 메시지를 입력해주세요."}],"profanity":[{"message":"금지어가 포함됐습니다."}]},"review[score]":{"numericality":[{"messages":{"numericality":"평점을 선택해주세요.","greater_than_or_equal_to":"translation missing: ko-KR.reviews.errors.score_numericality","less_than_or_equal_to":"translation missing: ko-KR.reviews.errors.score_numericality"},"greater_than_or_equal_to":1,"less_than_or_equal_to":5}]}}};
	//]]>
	</script>
				</div>

      <form id="upload-image" class="hidden" data-type="json" enctype="multipart/form-data" action="/10world.co.kr/preview_images/upload?secure_username=MTB3b3JsZC5jby5rci9kbGZremhkMQ%3D%3D" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="✓">
  <div class="fields_container"></div>
</form>
			</div>
			
			
			
			
			
			
		</div>
		<div class="widget widget-reviews pagination-list  ">
        	<div class="products_reviews_header">
				<div class="products_reviews_header__upper">
					<span class="sort-type selected">
						<strong>Review</strong>  (<span class="reviews-count">4</span>)
					</span>
					
					<!-- <span class="review-sort-type-column"> | </span>
					<a data-remote="true" href="/10world.co.kr/products/reviews?aloading=.page&amp;app=0&amp;iframe_id=crema-product-reviews-1&amp;order=10&amp;parent_url=http%3A%2F%2Fwww.10world.co.kr%2Fproduct%2Fdetail.html%3Fproduct_no%3D8826%26cate_no%3D25%26display_group%3D1&amp;product_code=8826">
						<span class="sort-type">추천순</span>
					</a>
					
					<span class="review-sort-type-column"> | </span>
					<a data-remote="true" href="/10world.co.kr/products/reviews?aloading=.page&amp;app=0&amp;iframe_id=crema-product-reviews-1&amp;order=30&amp;parent_url=http%3A%2F%2Fwww.10world.co.kr%2Fproduct%2Fdetail.html%3Fproduct_no%3D8826%26cate_no%3D25%26display_group%3D1&amp;product_code=8826">
						<span class="sort-type">평점순</span>
					</a> 
					
					<a class="review-options-search-toggle">
						<i class="sprites-search"></i>
							옵션별 검색 하기
					</a> -->
				</div>
  				<div class="products_reviews_header__separator"></div>
  				
			</div>

			<div>
				<div class="widget-body product_reviews_list__body">
  
					<div class="page">
						<ul class="reviews reviews-product">

						<% for(int i = 0; i < 3; i++){ %>
<!-- ///////////////////////////////////리뷰 폼 시작///////////////////////////////////// -->
							<li class="review product-review product_review__container " data-expand-url="/10world.co.kr/reviews/97795/expand?widget_id=2" id="review_97795">
								<div class="product_review__info_container">
								  <ul>
								    <li>
								      <div class="title">작성자</div>
								      <div class="value">양명준</div>
								    </li>
								      <li>
								        <div class="title">작성일</div>
								        <div class="value">2016. 10. 07</div>
								      </li>
								  </ul>
								</div>
								  
								<div class="l-contents panel product_review__contents_container ">
								    <div class="review-content">
										<div class="review-content-inner review-content-collapsed">
											<div class="panel-body no-border">
												<a class="message link-expand">
												        안녕하세요 리뷰올립니다.
												      <br>
												        생존키트 정말 유용합니다. 많이 파세요 ^^
												</a>
											</div>
											
										</div>
									
										<div class="review-content-inner review-content-expanded">
										
										</div>
									</div>
								</div>
							</li>
<!-- ///////////////////////////////////리뷰 폼 끝///////////////////////////////////// -->
						<% } %>
<!-- ///////////////////////////////////리뷰 폼 시작///////////////////////////////////// -->
<!-- ///////////////////////////////////리뷰 폼 끝///////////////////////////////////// -->

						</ul>
	
						<!-- <div class="no-data-message">리뷰가 없습니다.</div> -->
					</div>
				</div>
          
				<div class="product_reviews__footer"></div>
			</div>
		</div>
	</div>
	
	</div>
	
    <script src="http://assets2.cre.ma/latte/assets/10world-co-kr/pc/application-cd4d246ae420a7dcd98cdc699064dc36.js"></script>
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