/**
 * review.js
 */

function init(pageNo){
	//alert("init 실행");
	getReviewList(pageNo);//초기값으로 1 넘겨줌
}

function getReviewList(pageNo_pa){
		var params = {pageNo : pageNo_pa ,
					  itemDetailId : _itemDetailId}
		//alert("getReviewList function 실행");
		//alert("params : " + params.pageNo + ", " + params.itemDetailId);
		
	$.ajax({
		url : '/h72/detail/ajaxPage' ,
		type : 'post' ,
		contentType : "application/json" ,
		data : JSON.stringify(params) ,
		dataType : 'json' ,
		success : function(data){
			console.log("success");
			console.log("maxPage : " + data.maxPage + ", startPage : " + data.startPage + ", endPage : " + data.endPage + ", currentPage : " + data.currentPage + ", reviewListCount : " + data.reviewListCount + ", reviewListSize : " + data.reviewListSize);
			paging(data);
			reviewing(data.reviewList);
		} 
		,error : function(data){}
	});
}

function paging(data){
	//초기화
	//alert("paging run");
	$(".product_reviews__footer").html("");
	
	var startPage = data.startPage;
	var currentPage = parseInt(data.currentPage);
	var maxPage = data.maxPage;
	var endPage = data.endPage;
	var reviewListCount = data.reviewListCount;
	var page_div = "";
	
	$(".reviews-count").text(reviewListCount);
	
	if(reviewListCount != 0){
		
		page_div += "<div id='pager'>" +
					"	<div class='page-list'>" +
					"		<ul class='pagination'>";
		
		if(currentPage <= 1){
			page_div += "<li>&lt;&lt;</li>"; 
		}else{
			console.log("<< : " + Number(currentPage - 1));
			page_div += "<li><a href='#' onclick='javascript: getReviewList(" + currentPage + "- 1); return false'>&lt;&lt;</a></li>";
		}
	
		for(var p = startPage; p <= endPage; p++){
			if(p == currentPage){
				page_div += "<li class='ajaxPageC active'>" + p + "</li>";
			}else{
				page_div += "<li class='ajaxPageC'>" + p + "</li>";
			}
		}
		
		if(currentPage >= maxPage){
			page_div += "<li>&gt;&gt;</li>";
		}else{
			console.log(">> : " + Number(currentPage + 1));
			page_div += "<li><a href='#' onclick='javascript: getReviewList(" + currentPage + "+ 1); return false'>&gt;&gt;</a></li>"
		}
		page_div += "</ul></div></div>";
		
		$(".product_reviews__footer").append(page_div);
		
	}else{
		$(".product_reviews__footer").append(page_div);
	}
	
	//alert("startPage : " + startPage);
	
}

function reviewing(reviewList){
	//alert("reviewing run");
	$(".reviews.reviews-product").html("");
	if(reviewList != null){
		
		var listSize = reviewList.length;
		var loginUser = $("#loginUserId").val();
			//$("input[name='R_WRITER']").val();
		
		if(listSize != 0){
			for(var i = 0; i < listSize; i++){
				var list_div = "";
				/*
				   $(".reviews.reviews-product").append(
						"	<li class='review product-review product_review__container' id='" + reviewList[i].review_ID + "'>"+
						"		<div class='product_review__info_container'>" +
						"			<ul>" +
						"				<li>" +
						"					<div class='title'>작성자</div>" +
						"					<div class='value'>" + reviewList[i].r_WRITER + "</div>" +
						"				</li>" +
						"				<li>" +
						"					<div class='title'>작성일</div>" +
						"					<div class='value'>" + reviewList[i].r_DATE + "</div>" +
						"				</li>" +
						"			</ul>" +
						"		</div>" +
						"		<div class='l-contents panel product_review__contents_container'>" +
						"			<div class='review-content'>" +
						"				<div class='review-content-inner review-content-collapsed'>" +
						"					<div class='panel-body no-border'>" +
						"						<a class='message link-expand'>" +
													reviewList[i].r_CONTENTS +
						"						</a>" +
						"					</div>" +
						"				</div>" +
						"				<div class='review-content-inner review-content-expanded'>" +
						"				</div>" +
						"			</div>" +
						"		</div>" +
						"	</li>");
				*/
				
				list_div += 
				"	<li class='review product-review product_review__container' id='" + reviewList[i].review_ID + "'>"+
				"		<div class='product_review__info_container'>" +
				"			<ul>" +
				"				<li>" +
				"					<div class='title'>작성자</div>" +
				"					<div class='value'>" + reviewList[i].r_WRITER + "</div>" +
				"				</li>" +
				"				<li>" +
				"					<div class='title'>작성일</div>" +
				"					<div class='value'>" + reviewList[i].r_DATE + "</div>" +
				"				</li>" +
				"			</ul>" +
				"		</div>" +
				"		<div class='l-contents panel product_review__contents_container'>" +
				"			<div class='review-content'>" +
				"				<div class='review-content-inner review-content-collapsed'>" +
				"					<div class='panel-body no-border'>" +
				"						<a class='message link-expand'>" +
				"							<textarea disabled spellcheck='true' style='overflow:hidden;width:900px;height:100px;font-size:12px;font-weight:bold;'>"+reviewList[i].r_CONTENTS+"</textarea>" +
				"						</a>" +
				"					</div>" +
				"					<ul class='images'>";
				
									if(reviewList[i].r_IMG01 != null){
										list_div += 
				"						<li>" +
				"							<a data-photo-review-popup-url='' class='photo-review-popup'>" +
				"								<img class='review-image loaded' src='/h72/resources/uploadFiles/" + reviewList[i].r_IMG01 + "' style='width:74px; height:74px;'>" +
				"							</a>" +
				"						</li>";
									}
									if(reviewList[i].r_IMG02 != null){
										list_div +=
				"						<li>" +
				"							<a data-photo-review-popup-url='' class='photo-review-popup'>" +
				"								<img class='review-image loaded' src='/h72/resources/uploadFiles/" + reviewList[i].r_IMG02 + "' style='width:74px; height:74px;'>" +
				"							</a>" +
				"						</li>";
									}
									if(reviewList[i].r_IMG03 != null){
										list_div +=
				"						<li>" +
				"							<a data-photo-review-popup-url='' class='photo-review-popup'>" +
				"								<img class='review-image loaded' src='/h72/resources/uploadFiles/" + reviewList[i].r_IMG03 + "' style='width:74px; height:74px;'>" +
				"							</a>" +
				"						</li>";
									}
									if(reviewList[i].r_IMG04 != null){
										list_div +=
				"						<li>" +
				"							<a data-photo-review-popup-url='' class='photo-review-popup'>" +
				"								<img class='review-image loaded' src='/h72/resources/uploadFiles/" + reviewList[i].r_IMG04 + "' style='width:74px; height:74px;'>" +
				"							</a>" +
				"						</li>";
									}
									if(reviewList[i].r_IMG05 != null){
										list_div +=
				"						<li>" +
				"							<a data-photo-review-popup-url='' class='photo-review-popup'>" +
				"								<img class='review-image loaded' src='/h72/resources/uploadFiles/" + reviewList[i].r_IMG05 + "' style='width:74px; height:74px;'>" +
				"							</a>" +
				"						</li>";
									}
									
									list_div +=
				"					</ul>";
				
				
				//onclick='javascript: deleteReview(); return false'
				if(loginUser == reviewList[i].r_WRITER){
					//alert("동일!!!");
					list_div += 
					"<div class='panel-footer no-border'>" +
					"	<div class='actions-container'>" +
					"		<div class='inline like-action'>" +
					"			<div class='inline edit-review-container'>" +
					"				<a id='delete'>" +
					"					<span class='delete-review hoverable'>삭제</span>" +
					"				</a>" +
					"				<a id='modify'>" +
					"					<span class='edit-review hoverable'>수정</span>" +
					"				</a>" +
					"				<div class='inline edit-review-container-line'></div>" +
					"			</div>" +
					"		</div>" +
					"	</div>" +
					"</div>";
				}
				
				list_div +=
				"				</div>" +
				"				<div class='review-content-inner review-content-expanded'>" +
				"				</div>" +
				"			</div>" +
				"		</div>" +
				"	</li>";
				
				$(".reviews.reviews-product").append(list_div);
			}
		}
	}else{
		$(".reviews.reviews-product").append(
				"	<li class='review product-review product_review__container' id='review_no_none'>"+
				"		<div class='l-contents panel product_review__contents_container' style='margin-right:0;'>" +
				"			<div class='review-content'>" +
				"				<div class='review-content-inner review-content-collapsed'>" +
				"					<div class='panel-body no-border'>" +
				"						<a class='message link-expand'>" +
				"							<center><strong>리뷰가 없습니다</strong><center>" +
				"						</a>" +
				"					</div>" +
				"				</div>" +
				"			</div>" +
				"		</div>" +
				"	</li>");
	}
	
}



function bindEvent(){
	
	$("#subBtn").hover(function(){
		$("#subBtn").css({'background-color':'white', 'color':'#515151'});
	},function(){
			$("#subBtn").css({'background-color':'#515151', 'color':'white'});
	});
	
	$(document).on("submit", "#form-new-product-review", function(e){
		var review_text = $("#review_message").val();
		if(review_text == ""){
			alert("내용을 작성하세요.");
			return false;
		}
	});
	
	
	$(document).on("click", "#modify", function(e){
		console.log('수정 중');
		focus_review = $(this).parent().parent().parent().parent().parent().parent().parent().parent();
		focus_review_div = $(this).parent().parent().parent().parent().parent().parent().parent().parent().html();
		focus_review_div_id = $(this).parent().parent().parent().parent().parent().parent().parent().parent().attr("id");
		reviewText = $(this).parent().parent().parent().parent().parent().parent().parent().children().children().children().children().first().text().trim();
		reviewUser = $(this).parent().parent().parent().parent().parent().parent().parent().parent().children().children().children().first().children().last().text();
		reviewDate = $(this).parent().parent().parent().parent().parent().parent().parent().parent().children().children().first().children().last().children().last().text();
		imageLength = $(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().length;
		//var image = $(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children(); 
		//취소버튼 눌렀을 때 원래 html로 돌아오기 위한 작업
		imageFormOrigin = $(this).parent().parent().parent().parent().parent().children().eq(1).html();
		delAndModiBtn_1 = $(this).parent(); //삭제-수정 버튼 div
		delAndModiBtn_2 = $(this).parent().next(); //취소-수정완료 버튼 div
		textarea = $(this).parent().parent().parent().parent().parent().parent().parent().children().children().children().children().first().children();
		imageForm = $(this).parent().parent().parent().parent().parent().children().eq(1);
		prefix = 'mask';
		
		//이미지 소스
		var image = new Array();
		/*imageLength
		image[i]*/
		identity = new Array();
		if(imageLength == 0){
			image.push("/h72/resources/uploadFiles/" + tempItemDetailId + "_temp-" + focus_review_div_id + "_1.gif");
		}if(imageLength == 1){
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(0).children().children().attr('src'));
		}else if(imageLength == 2){
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(0).children().children().attr('src'));
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(1).children().children().attr('src'));
		}else if(imageLength == 3){
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(0).children().children().attr('src'));
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(1).children().children().attr('src'));
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(2).children().children().attr('src'));
		}else if(imageLength == 4){
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(0).children().children().attr('src'));
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(1).children().children().attr('src'));
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(2).children().children().attr('src'));
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(3).children().children().attr('src'));
		}else if(imageLength == 5){
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(0).children().children().attr('src'));
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(1).children().children().attr('src'));
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(2).children().children().attr('src'));
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(3).children().children().attr('src'));
			image.push($(this).parent().parent().parent().parent().parent().parent().parent().parent().children().last().children().children().children().eq(1).children().eq(4).children().children().attr('src'));
		}
		
		for(var i = 0; i < image.length; i++){
			var iden = image[i].substring(image[i].lastIndexOf('/') + 1, image[i].length - 4);
			//--> ex) iden : "BAG0001_review-1_1"
			identity.push(iden);
			//console.log(i + " : " + iden);
		}
		
		
		
		//textarea 변환
		active(textarea);
		
		//image 변환
		$("#maskInner").html(
			"<div class='mask page'>" +
				"<form id='ajaxModifyForm' action='maskModify' autocomplete='off' id='form-new-product-review' data-login-required='true' enctype='multipart/form-data' data-remote='true' method='post'>" +
				
				"<input type='hidden' name='ITEM_DETAIL_ID' value='" + tempItemDetailId + "' />" +
				"<input type='hidden' name='reviewId' value='" + focus_review_div_id + "' />" +
				"<input type='hidden' name='reviewUser' value='" + reviewUser + "' />" +
				
				
					"<ul class='reviews reviews-product'>" +
						"<li class='review product-review product_review__container' id='3'>" +
							"<div class='product_review__info_container'>" +
								"<ul>" +
									"<li>" +
										"<div class='title'>작성자</div>" +
										"<div class='value'>" + reviewUser + "</div>" +
									"</li>" +
									"<li>" +
										"<div class='title'>작성일</div>" +
										"<div class='value'>" + reviewDate + "</div>" +
									"</li>" +
								"</ul>" +
							"</div>" +
						
							"<div class='l-contents panel product_review__contents_container'>" +
								"<div class='review-content'>" +
									"<div class='review-content-inner review-content-collapsed'>" +
										"<div class='panel-body no-border'>" +
											"<a class='message link-expand'>" +
												"<textarea name='reviewText' style='overflow:hidden;width:900px;height:300px;font-size:12px;font-weight:bold;'>" + reviewText + "</textarea>" +
											"</a>" +
										"</div>" +
										
										"<ul class='mask image-fields-container'>" +
							    			"<li class='mask image-field'>" +
							  					"<div class='wrap'>" +
											
							  					"<div id='mask_wrap' style='display:inline-flex;'>" +
							  						/*
							  						"<div id='maskFile' class='mask fileWrap'>" +
							  							"<input type='file' name='reviewPhoto1' id='maskupBtn1' class='maskinput-file hidden' accept='image/*' multiple='multiple' />" +
							  							"<input type='file' name='reviewPhoto2' id='maskupBtn2' class='maskinput-file hidden' accept='image/*' multiple='multiple' />" +
							  							"<input type='file' name='reviewPhoto3' id='maskupBtn3' class='maskinput-file hidden' accept='image/*' multiple='multiple' />" +
							  							"<input type='file' name='reviewPhoto4' id='maskupBtn4' class='maskinput-file hidden' accept='image/*' multiple='multiple' />" +
							  							"<input type='file' name='reviewPhoto5' id='maskupBtn5' class='maskinput-file hidden' accept='image/*' multiple='multiple' />" +
							  						"</div>" +
							  						*/
							  					
							  						"<div id='maskPreview' class='maskpreview-container' style='display:inline-flex'>" +
							  							/*"<div class='hidden mask preview_div_1'>" +
							  								"<img class='preview' id='maskpreview1' alt='preview' src=''>" +
							  								"<div class='image_field__remove_preview mask remove-preview hoverable' style='width:74px;height:74px;'>" +
							  									"<div class='remove' style='margin-top:-20px;'>삭제</div>" +
							  								"</div>" +
							  							"</div>" +
								          
							  							"<div class='hidden mask preview_div_2'>" +
							  								"<img class='preview' id='maskpreview2' alt='preview' src=''>" +
						  									"<div class='image_field__remove_preview mask remove-preview hoverable' style='width:74px;height:74px;'>" +
						  										"<div class='remove' style='margin-top:-20px;'>삭제</div>" +
						  									"</div>" +
						  								"</div>" +
								          
						  								"<div class='hidden mask preview_div_3'>" +
						  									"<img class='preview' id='maskpreview3' alt='preview' src=''>" +
						  									"<div class='image_field__remove_preview mask remove-preview hoverable' style='width:74px;height:74px;'>" +
						  										"<div class='remove' style='margin-top:-20px;'>삭제</div>" +
						  									"</div>" +
						  								"</div>" +
									      
						  								"<div class='hidden mask preview_div_4'>" +
						  									"<img class='preview' id='maskpreview4' alt='preview' src=''>" +
						  									"<div class='image_field__remove_preview mask remove-preview hoverable' style='width:74px;height:74px;'>" +
						  										"<div class='remove' style='margin-top:-20px;'>삭제</div>" +
						  									"</div>" +
						  								"</div>" +
									      
						  								"<div class='hidden mask preview_div_5'>" +
						  									"<img class='preview' id='maskpreview5' alt='preview' src=''>" +
						  									"<div class='image_field__remove_preview mask remove-preview hoverable' style='width:74px;height:74px;'>" +
						  										"<div class='remove' style='margin-top:-20px;'>삭제</div>" +
						  									"</div>" +
						  								"</div>" +
									      
						  								"<div class='mask image-inline-photo-add' style='display: block'>" +
						  									"<img class='size-support hidden' src='//assets2.cre.ma/m/widgets/transparent.png' alt='Transparent'>" +
						  									"<div class='input-image-container on-list'>" +
						  										"<span class='sprites-icon-camera inline'></span>" +
						  										"<div class='add-image-caption' style='margin-top:-25px;'>사진추가</div>" +
						  									"</div>" +
						  								"</div>" +*/
							  						"</div>" +
						  							
							  						
						  							"<div class='mask image-inline-photo-add' style='display: block'>" +
					  									"<img class='size-support hidden' src='//assets2.cre.ma/m/widgets/transparent.png' alt='Transparent'>" +
					  									"<div class='input-image-container on-list'>" +
					  										"<span class='sprites-icon-camera inline'></span>" +
					  										"<div class='add-image-caption' style='margin-top:-25px;'>사진추가</div>" +
					  									"</div>" +
					  								"</div>" +
						  							
					  							"</div>" +
						  							
						  							
						  							
						  						"</div>" +
						  					"</li>" +
						  				"</ul>" +
									
										"<div class='panel-footer no-border' style='padding-bottom:0'>" +
											"<div class='actions-container'>" +
												"<div class='inline like-action'>" +
													"<div class='inline edit-review-container 2' id='reviewModify'>" +
														"<a id='cancle'>" +
															"<span class='delete-review hoverable'>취소</span>" +
														"</a>" +
														/*"<a id='modifyFine'>" +*/
															"<input type='submit' id='subBtn' value='수정완료' style='font-size:11px;'>" + 
															/*"<span class='edit-review hoverable'>수정완료</span>" +*/
														/*"</a>" +*/
													"</div>" +
												"</div>" +
											"</div>" +
										"</div>" +
									"</div>" +
									"<div class='review-content-inner review-content-expanded'></div>" +
								"</div>" +
							"</div>" +
						"</li>" +
					"</ul>" +
				"</form>" +
			"</div>");
		
		e.preventDefault();
		wrapWindowByMask();
		//console.log(image[0]);
		console.log("image[0] : " + image[0]);
		console.log("identity[0] : " + identity[0]);
		//console.log(identity[0].substring(identity[0].lastIndexOf('-') + 1));
		if(imageLength != 0){
				for(var i = 0; i < imageLength; i++){
					$("#maskPreview").append(
						"<div id='maskPreviewInner" + superNum + "' class='maskPreviewInner' style=''>" +
							"<div class='hidden mask preview_div_" + superNum + "'>" +
								"<img class='preview' id='maskpreview" + superNum + "' alt='preview' src=''>" +
								"<div class='image_field__remove_preview mask remove-preview hoverable' style='width:74px;height:74px;'>" +
									"<div class='remove' style='margin-top:-20px;'>삭제</div>" +
								"</div>" +
							"</div>" +
							"<input type='file' name='reviewPhoto' id='maskupBtn" + superNum + "' class='maskinput-file hidden' accept='image/*' multiple='multiple' />" +
							"<input type='hidden' name='fileId[]' value='" + identity[i].substring(identity[i].lastIndexOf('-') + 1) + "' />" +
						"</div>"																					/*	'_' --> '-' */
					);
					
					$("#maskpreview" + superNum ).attr("src", image[i]);
					$("#maskpreview" + superNum ).css("width", "74px");
					$("#maskpreview" + superNum ).css("height", "74px");
					$(".hidden.mask.preview_div_" + superNum ).css("display", "block");
					superNum++;
				}
																				/*	'_' --> '-' */
				
				console.log("identity[superNum - 2] : " + identity[superNum - 2]);
				
				nextVal = ""+identity[superNum - 2];
				nextVal = nextVal.substring(nextVal.indexOf('-') + 1); /*1_1 추출*/
				nextNum = Number(nextVal.substring(nextVal.lastIndexOf('_') + 1)); /*_ 다음의 번호 추출*/
				
				nextVal = nextVal.substring(0, nextVal.lastIndexOf('_') + 1);/*1_ 추출*/
				nextVal += nextNum + 1;
				
				console.log("nextVal : " + nextVal); /*'1_' + '2' = 1_2*/
					
				if(nextVal != null){
				}else{
					//nextVal = "temp_review_" + focus_review_div_id + "_" + superNum;
				}
				$("#maskPreview").append(
						"<div id='maskPreviewInner" + superNum + "' class='maskPreviewInner' style=''>" +
							"<div class='hidden mask preview_div_" + superNum + "'>" +
								"<img class='preview' id='maskpreview" + superNum + "' alt='preview' src=''>" +
								"<div class='image_field__remove_preview mask remove-preview hoverable' style='width:74px;height:74px;'>" +
									"<div class='remove' style='margin-top:-20px;'>삭제</div>" +
								"</div>" +
							"</div>" +
							"<input type='file' name='reviewPhoto' id='maskupBtn" + superNum + "' class='maskinput-file hidden' accept='image/*' multiple='multiple' />" +
							"<input type='hidden' name='fileId[]' value='" + nextVal + "' />" +
						"</div>"/*identity[superNum - 1].substring(temp.lastIndexOf('_') + 1)에다가 + 1 한 값을
						 		  identity[superNum - 1].substring(identity[superNum - 1].indexOf('-') + 1, identity[superNum - 1].lastIndexOf('_') + 1) 여기에 더해준 값을 다음 value값으로... */
							/*
							 * nextVal = identity[superNum - 1].substring(identity[superNum - 1].indexOf('-') + 1, identity[superNum - 1].lastIndexOf('_') + 1)
							 * + Number(identity[superNum - 1].substring(temp.lastIndexOf('_') + 1)) + 1
							 * */
					);
					
					$("#maskpreview" + superNum ).attr("src", "");
					$("#maskpreview" + superNum ).css("width", "74px");
					$("#maskpreview" + superNum ).css("height", "74px");
					//$(".hidden.mask.preview_div_" + superNum ).css("display", "block");
					superNum++;
					imageLength = $(".hidden.mask").length;
			}else{
				$("#maskPreview").append(
						"<div id='maskPreviewInner" + superNum + "' class='maskPreviewInner' style=''>" +
							"<div class='hidden mask preview_div_" + superNum + "'>" +
								"<img class='preview' id='maskpreview" + superNum + "' alt='preview' src=''>" +
								"<div class='image_field__remove_preview mask remove-preview hoverable' style='width:74px;height:74px;'>" +
									"<div class='remove' style='margin-top:-20px;'>삭제</div>" +
								"</div>" +
							"</div>" +
							"<input type='file' name='reviewPhoto' id='maskupBtn" + superNum + "' class='maskinput-file hidden' accept='image/*' multiple='multiple' />" +
							"<input type='hidden' name='fileId[]' value='" + focus_review_div_id + "_" + superNum + "' />" +
						"</div>"/*identity[superNum - 1].substring(temp.lastIndexOf('_') + 1)에다가 + 1 한 값을
						 		  identity[superNum - 1].substring(identity[superNum - 1].indexOf('-') + 1, identity[superNum - 1].lastIndexOf('_') + 1) 여기에 더해준 값을 다음 value값으로... */
							/*
							 * nextVal = identity[superNum - 1].substring(identity[superNum - 1].indexOf('-') + 1, identity[superNum - 1].lastIndexOf('_') + 1)
							 * + Number(identity[superNum - 1].substring(temp.lastIndexOf('_') + 1)) + 1
							 * */
					);
					
					$("#maskpreview" + superNum ).attr("src", "");
					$("#maskpreview" + superNum ).css("width", "74px");
					$("#maskpreview" + superNum ).css("height", "74px");
					//$(".hidden.mask.preview_div_" + superNum ).css("display", "block");
					superNum++;
					imageLength = $(".hidden.mask").length;
					
					console.log("identity[superNum - 2] : " + identity[superNum - 2]);
					
					nextVal = ""+identity[superNum - 2];
					nextVal = nextVal.substring(nextVal.indexOf('-') + 1); /*1_1 추출*/
					nextNum = Number(nextVal.substring(nextVal.lastIndexOf('_') + 1)); /*_ 다음의 번호 추출*/
					
					nextVal = nextVal.substring(0, nextVal.lastIndexOf('_') + 1);/*1_ 추출*/
					nextVal += nextNum + 1;
					
					console.log("nextVal : " + nextVal); /*'1_' + '2' = 1_2*/
			}

			/*for(var i = 0; i < 5 - imageLength; i++){
				$("#maskFile").append(
						"<input type='file' name='reviewPhoto" + superNum + "' id='maskupBtn" + superNum + "' class='maskinput-file hidden' accept='image/*' multiple='multiple' />"
				);
				superNum++;
			}*/
		
		
		
		/*for(var i = 0; i < imageLength; i++){
			$("#maskpreview" + ( i + 1 ) ).attr("src", image[i]);
			$("#maskpreview" + ( i + 1 ) ).css("width", "74px");
			$("#maskpreview" + ( i + 1 ) ).css("height", "74px");
			$(".hidden.mask.preview_div_" + ( i + 1 ) ).css("display", "block");
		}*/
		
		//취소, 수정완료 눌렀을 때는 1로 초기화.
		n = imageLength + 1;
		num = imageLength + 1;
		//console.log("modify n : " + n);
		
		
		
		
		//삭제, 수정 버튼 변환 (mask 창 띄우면서 필요 없어짐.?
		/*delAndModiBtn_1.css('display', 'none');
		delAndModiBtn_2.css('display', 'block');*/
		
		//$(this).parent().parent().parent().parent().parent().children().eq(1).html("");
		
		////////////////////////
		for(var i = 0; i < superNum; i++){
			console.log("$('#maskupBtn" + i + "') : " + $("#maskupBtn" + i).next().val());
		}
		for(var i = 0; i < imageLength; i++){
			console.log("image["+i+"] : " + image[i]); 
		}
		console.log("----------------------");
		console.log($("input[name='fileId[]']").val());
		for(var i = 0; i < $("input[name='fileId[]']").length; i++){
		}
	});
	
	$(document).on("click", "#cancle", function(){
		//alert("reviewText : " + $(this).parent().parent().parent().parent().parent().parent().parent().children().children().children().children().first().children().text());
		textarea.val(reviewText);
		console.log("수정취소");
		console.log(prefix);
		//var textareaFunc = $(this).parent().parent().parent().parent().parent().children().first().children().children();
		$(this).parent().css("display", "none"); //취소-수정완료 버튼 div
		$(this).parent().prev().css("display", "block"); //삭제-수정 버튼 div
		//$("#review_mask").remove();
		$("#mask").hide();
		$("#maskInner").html("");
		disable(textarea, imageForm);
		prefix = null;
		tempArray = new Array();
		n = 1;
		num = 1;
		superNum = 1;
		superNumFlow = 1;
		nextVal = null;
	});
	
	$(document).on("click", "#delete", function(){
		//console.log("rrrr");
		var yOn = window.confirm("정말 삭제하시겠습니까?");
		
		if( yOn == 1 ){
		
			var focus_review_div_id = $(this).parent().parent().parent().parent().parent().parent().parent().parent().attr("id");
			var focus_div_user = $(this).parent().parent().parent().parent().parent().parent().parent().parent().children().first().children().children().first().children().last().text();
			var currentPageNo = $(".product_reviews__footer > #pager > .page-list > .pagination > li.ajaxPageC.active").text();
			var itemDetailId = _itemDetailId;
			
			var params = {
				reviewNo : focus_review_div_id ,
				user : focus_div_user ,
				itemDetailId : itemDetailId ,
			};
			
			
			$.ajax({
				url : '/h72/detail/deleteReview' ,
				type : 'post' ,
				contentType : "application/json" ,
				data : JSON.stringify(params) ,
				dataType : 'json' ,
				success : function(data){
					var result = data.result;
					var reviewListCount = data.reviewListCount;
					var limit = 5;
					
					if(result > 0){
						//alert("result : " + data.result + ": 삭제 성공");
						
						//삭제 후 다시 뿌려주는 ajax 호출 
						if(reviewListCount%limit == 0){
							getReviewList(currentPageNo - 1);
						}else{
							getReviewList(currentPageNo);
						}
					}
					/*paging(data);
					reviewing(data.reviewList);*/
				} 
				,error : function(data){}
			});
		
		}
	});
	
	
	
	$(document).on("click", ".ajaxPageC", function(){
   		var pageNo = $(this).text();
   		//alert("pageNo : " + pageNo);
   		getReviewList(pageNo);
   	});
	
	//구매하기, 장바구니 버튼
	$(document).on("mouseenter", ".remove-preview.hoverable, .mask.remove-preview.hoverable", function(){
	//$(".remove-preview.hoverable, .mask.remove-preview.hoverable").mouseenter(function(){
		$(this).css("opacity", "0.8");
	});
	$(document).on("mouseleave", ".remove-preview.hoverable, .mask.remove-preview.hoverable", function(){
	//$(".remove-preview.hoverable, .mask.remove-preview.hoverable").mouseleave(function(){
		$(this).css("opacity", "0.4");
	});
		
	//검은 막을 눌렀을 때
	/*$(document).on("click", "#mask", function(){
		$(this).hide();  
	    $('.window').hide();
	});*/
	
	$(document).on("click", ".images > li", function () {
		imgArray = [];
		imgLength = $(this).parent().children().length;
		
		for(var i = 0; i < imgLength; i++){
			imgArray[i] = $(this).parent().children().children().children().eq(i).attr('src');
		}
		
		curIndex = imgArray.indexOf($(this).children().children().eq(0).attr('src'));
		
//		var tempImg = $(this).children().children().first().attr('src');
		//tempImage = tempImage.substring(tempImage.lastIndexOf('/') + 1 );
		wrapWindowByMask();
		$('#mask').append('<div id=layerWrapper>' +
							'<img id="cancel" src="/h72/resources/image/cancel.png">' +
							'<img class="arrow" id="leftArrow" src="/h72/resources/image/arrow-left.png"></img>' +
							'<img id="layerImage"></img>' +
							'<img class="arrow" id="rightArrow" src="/h72/resources/image/arrow-right.png"></img>' +
						  '</div>');
		$('#layerImage').attr('src', imgArray[curIndex]);
	});
	
	$(document).on("click", ".arrow", function () {
		if ( $(this).attr('id') == "leftArrow" ) {
			if ( curIndex-1 < 0 ) {
				curIndex = imgArray.length-1;
			} else {
				curIndex--;
			}
			//$(this).next().animate({opacity:"0.1", right: "+=400"},1000,{width:0});
			//$(this).next().animate({width:'toggle'},350);
		} else {
			if ( curIndex + 1 >= imgArray.length ) {
				curIndex = 0;
			} else {
				curIndex++;
			}
		}
		
		$('#layerImage').attr('src', imgArray[curIndex]);
		
	});
	
	$(document).on("click", "#cancel", function () {
		$('#mask').html("");
		$('#mask').hide();
	});
	
	uploadPhoto();
	
}

console.log(_itemDetailId);


function wrapWindowByMask(){
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#mask').css({'width':maskWidth,'height':maskHeight});  

    //애니메이션 효과
    $('#mask').fadeIn(1000);      
    //$('#mask').fadeTo("slow",0.8);    
}   

function active(textarea){
	textarea.removeAttr("disabled");
	textarea.focus();
}

function disable(textarea, imageForm){
	textarea.attr("disabled", "disabled");
	imageForm.html(imageFormOrigin);
}



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

function uploadPhoto(){
  	// 리뷰쓰기 사진 올리기 버튼
   	/*var n = 1;
  	var num = 1;*/
  	var baseSelector = null;
   	console.log("ok");
   	console.log(n);
     	
   	//사진올리기 버튼 클릭
	$(document).on("click", ".field-box.add-image-container, .image-inline-photo-add", function(){
   		//e.preventDefault();
		var tempClass = $(this).attr('class');
		
		if(tempClass.indexOf('mask') >= 0){
			prefix = 'mask';
		} else {
			prefix = '';
		}
		
		if(prefix == 'mask'){
			if(imageLength < 6){
				$("#maskupBtn" + (superNum - 1)).click();
				//$(baseSelector + n).click();
			}else{
				alert("사진은 최대 5장까지만 업로드할 수 있습니다.")
			}
		}else{
			baseSelector = "#" + prefix + "upBtn";
			
			if(n < 6){
				//버튼(input type=file)클릭 강제 이벤트
				$(baseSelector + n).click();
				//$(baseSelector + n).trigger("click")
				//$("input:file").val().toLowerCase();
			}else{
				alert("사진은 최대 5장까지만 업로드할 수 있습니다.")
			}
			
		}
		
		
		
		imageLength = $(".hidden.mask").length;
   	});
     	
   	//input file 선택했을 때
	$(document).on("change", "input[type='file']", function(){
		maskThumnailId = $(this).siblings().children().first().attr('id');
		var ext = null;
		
		if(prefix != "mask"){
			$(".image-inline-photo-add").css("display", "block");
			
			tempArray.push($(baseSelector + n).val());
			console.log("tempArray : " + tempArray);
			
			ext = $(baseSelector + n).val().split(".").pop();
			
		}else if(prefix == 'mask'){
			console.log("사진추가됨");													/* '_' -->	'-' */
			
			//nextVal = ""+identity[superNum - 1]; 지금의 nextVal은 위에서 저장돼있음 1_2. 즉 1_3 으로 다음에 저장되게 문자열 처리
			console.log("nextVal : " + nextVal);
			nextNum = Number(nextVal.substring(nextVal.lastIndexOf('_') + 1)); /*_ 다음의 번호 추출*/
			console.log("22 : " + nextNum);
			nextVal = nextVal.substring(0, nextVal.lastIndexOf('_') + 1);/*1_ 추출*/
			console.log("11 : " + nextVal);
			nextVal += nextNum + 1;
			console.log("nextVal : " + nextVal);
			
			if(nextVal != null){
			}else{
				//nextVal = "temp_review_" + focus_review_div_id + "_" + superNum;
			}
			/*nextVal = identity[superNum - 1];
			nextVal = nextVal.substring(nextVal.indexOf('-') + 1, nextVal.lastIndexOf('_') + 1)
			  + Number(nextVal.substring(nextVal.lastIndexOf('_') + 1)) + 1;*/
			
			$("#maskPreview").append(
				"<div id='maskPreviewInner" + superNum + "' class='maskPreviewInner' style=''>" +
					"<div class='hidden mask preview_div_" + superNum + "'>" +
						"<img class='preview' id='maskpreview" + superNum + "' alt='preview' src=''>" +
						"<div class='image_field__remove_preview mask remove-preview hoverable' style='width:74px;height:74px;'>" +
							"<div class='remove' style='margin-top:-20px;'>삭제</div>" +
						"</div>" +
					"</div>" +
					"<input type='file' name='reviewPhoto' id='maskupBtn" + superNum + "' class='maskinput-file hidden' accept='image/*' multiple='multiple' />" +
					"<input type='hidden' name='fileId[]' value='" + nextVal + "' />" +
				"</div>"
			);
				
			$("#maskpreview" + superNum ).attr("src", "");
			$("#maskpreview" + superNum ).css("width", "74px");
			$("#maskpreview" + superNum ).css("height", "74px");
			//$(".hidden.mask.preview_div_" + superNum ).css("display", "block");
			superNum++;
				
			ext = $(this).val().split(".").pop();
		}
		
		
		ext = ext.toLowerCase();
		
		
		if(ext.length > 0){
			if($.inArray(ext,['gif','png','jpg','jpeg']) == -1) { 
				alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
				this.value = "";
				return false;  
			} else {
				readURL(this);
				
				var thum = null;
				
				if(num != 6){	
					$(this).css("display", "none");
				}
				if(prefix == "mask"){
					thum = $(this).siblings().attr('class');
				}else if(prefix == ""){
					thum = $(".preview_div_" + n).attr("class");
				}
				
				thum = thum.replace( /\s/g, ".");
				$("." + thum).css("display", "block");//숨겨진 섬네일 show
			}
		}
		n++;
		//superNumFlow++;
		imageLength = $(".hidden.mask").length;
	});
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				
				var thumnailId = prefix + "preview"+ num;
				
				console.log(thumnailId);
				$('#'+thumnailId).css("width","74px");
				$('#'+thumnailId).css("height","74px");
				$('#'+thumnailId).attr("src", e.target.result);
				num++;
				
				if(prefix == 'mask'){
					console.log(maskThumnailId);
					$('#'+maskThumnailId).css("width","74px");
					$('#'+maskThumnailId).css("height","74px");
					$('#'+maskThumnailId).attr("src", e.target.result);
					
					maskThumnailId = null;//초기화
					imageLength = $(".hidden.mask").length;
					//파일 선택했을 때!!! mask input file 생성하니까... 여기서는 할 필요 없게씨
					
				}
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	
	
	//사진 삭제 눌렀을 때
	$( document ).on( "click", ".remove-preview.hoverable", function(){
		console.log("prefix: " + prefix);
		//선택한 사진의 번호
		var this_preview_class = $( this ).parent().attr( "class" );//클릭한 섬네일 div
		this_preview_class = this_preview_class.replace( /\s/g, "." );//공백 '.' 치환 
		var preview_num = this_preview_class.substring( this_preview_class.length - 1);

		
		if(prefix == 'mask'){
			$(this).parent().parent().remove();
			//$(this).parent().next().val("")
			//$(this).parent().parent().css("display", "none");
			
			/*pre_imageLength = $(".hidden.mask").length - 1;
			sum = pre_imageLength + $(".maskinput-file.hidden").length;
			myslefNum = $(this).parent().attr('class').substring($(this).parent().attr('class').length - 1);
			
			if(sum == 5){
				$("#maskupBtn" + myslefNum).remove();
				$("#maskFile").append(
						"<input type='file' name='reviewPhoto" + superNum + "' id='maskupBtn" + superNum + "' class='maskinput-file hidden' accept='image/*' multiple='multiple' />"
				);
			}else{
				var temp = 5 - sum;
				
			}
			
			$("#maskFile").append(
					"<input type='file' name='reviewPhoto" + superNum + "' id='maskupBtn" + superNum + "' class='maskinput-file hidden' accept='image/*' multiple='multiple' />"
			);
			
			superNum++;
			superNumFlow++;*/
			imageLength = $(".hidden.mask").length;
		}
		
		
		
		
		
		
		if(prefix != 'mask'){
		
			n--;	// 6 -> 5
			num--;	// 6 -> 5
	
	 		  	//alert( "선택된 사진 class(from parent)  : " + this_preview_class + "\n선택된 사진 번호 : " + preview_num + "\nn: " + n +"\nnum: " + num + "\n총 사진갯수 : " + num);
			if(num == 5){
				//사진 5장 선택됐을 때
				if(preview_num == 5){//5번 사진 삭제시
	  		  		//1. 5번사진 src 담기(5번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
	    			var preview_src_5 = $( "#" + prefix + "preview" + num ).attr( "src" );
	    			$( "#" + prefix + "preview" + num ).attr( "src", "" );
	    			
	    			//rename 처리하려면 기존에 있던 img src와 change 하면서 입력된 input file의 파일 이름이 필요. 
	    			//입력된 input file의 이름을 저장한 tempArray
	    			//img를 지워줄 때. tempArray 에 저장된 이름을 지워주는 코드****
	    			if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
	    				tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
	    			}
	    			$("#" + prefix + "upBtn" + preview_num).val('');
	    			console.log("삭제후 tempArray : " + tempArray);
	    			
	    			//2. 5번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none)
	    			var preview_src_parent_5 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
	    			preview_src_parent_5 = preview_src_parent_5.replace( /\s/g, ".");
	    			$( "." + preview_src_parent_5 ).css( "display", "none" );
	  		  	}
			  
				if(preview_num == 4){//4번 사진 삭제시( 4 <- 5 )
					//1. 5번사진 src 담기(5번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
					var preview_src_5 = $( "#" + prefix + "preview" + num ).attr( "src" );
					$( "#" + prefix + "preview" + num ).attr( "src", "" );
					if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
						tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
					}
					$("#" + prefix + "upBtn" + preview_num).val('');
					console.log("삭제후 tempArray : " + tempArray);
					
					//2. 5번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none)
					var preview_src_parent_5 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
					preview_src_parent_5 = preview_src_parent_5.replace( /\s/g, ".");
					$( "." + preview_src_parent_5 ).css( "display", "none" );
					
					//3. 5번사진 src 4번 사진 src 넣기
					$( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src", preview_src_5 );//5번사진 src --> 4번사진 src 넣기		  
		  		}
	  		  
				if(preview_num == 3){//3번 사진 삭제시( 3 <- 4 <- 5 )
		  			//1. 5번사진 src 담기(5번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 4번사진 src 담기(4번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
		  			var preview_src_4 = $( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src" );
		  			var preview_src_5 = $( "#" + prefix + "preview" + num ).attr( "src" );
		  			$( "#" + prefix + "preview" + num ).attr( "src", "" );
		  			
		  			if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
		  				tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
		  			}
		  			
		  			$("#" + prefix + "upBtn" + preview_num).val('');
		  			console.log("삭제후 tempArray : " + tempArray);
		  			
		  			//2. 5번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) 
		  			var preview_src_parent_5 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
		  			preview_src_parent_5 = preview_src_parent_5.replace( /\s/g, ".");
		  			$( "." + preview_src_parent_5 ).css( "display", "none" );
		  			
		  			//3. 5번사진 src 4번 사진 src으로 넣기 / 4번사진 src 3번 사진 src으로 넣기
					$( "#" + prefix + "preview" + ( num - 2 ) ).attr( "src", preview_src_4 );//4번사진 src --> 3번사진 src 넣기
					$( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src", preview_src_5 );//5번사진 src --> 4번사진 src 넣기		  
				}	
	  		  
				if(preview_num == 2){//2번 사진 삭제시( 2 <- 3 <- 4 <- 5 )
		  			//1. 5번사진 src 담기(5번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 4번사진 src 담기(4번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 3번사진 src 담기(3번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
		  			var preview_src_3 = $( "#" + prefix + "preview" + ( num - 2 ) ).attr( "src" );
		  			var preview_src_4 = $( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src" );
		  			var preview_src_5 = $( "#" + prefix + "preview" + num ).attr( "src" );
		  			$( "#" + prefix + "preview" + num ).attr( "src", "" );
		  			
		  			if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
		  				tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
		  			}
		  			
		  			$("#" + prefix + "upBtn" + preview_num).val('');
		  			console.log("삭제후 tempArray : " + tempArray);
		  			
		  			//2. 5번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 3번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) 
		  			var preview_src_parent_5 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
		  			preview_src_parent_5 = preview_src_parent_5.replace( /\s/g, ".");
		  			$( "." + preview_src_parent_5 ).css( "display", "none" );
		  			
		  			//3. 5번사진 src 4번 사진 src으로 넣기 / 4번사진 src 3번 사진 src으로 넣기
					$( "#" + prefix + "preview" + ( num - 3 ) ).attr( "src", preview_src_3 );//3번사진 src --> 2번사진 src 넣기
					$( "#" + prefix + "preview" + ( num - 2 ) ).attr( "src", preview_src_4 );//4번사진 src --> 3번사진 src 넣기
					$( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src", preview_src_5 );//5번사진 src --> 4번사진 src 넣기		  
				}
	  		  
				if(preview_num == 1){//1번 사진 삭제시( 1 <- 2 <- 3 <- 4 <- 5 )
		  			//1. 5번사진 src 담기(5번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 4번사진 src 담기(4번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 3번사진 src 담기(3번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
		  			var preview_src_2 = $( "#" + prefix + "preview" + ( num - 3 ) ).attr( "src" );
		  			var preview_src_3 = $( "#" + prefix + "preview" + ( num - 2 ) ).attr( "src" );
		  			var preview_src_4 = $( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src" );
		  			var preview_src_5 = $( "#" + prefix + "preview" + num ).attr( "src" );
		  			$( "#" + prefix + "preview" + num ).attr( "src", "" );
		  			
		  			if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
		  				tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
		  			}
		  			
		  			$("#" + prefix + "upBtn" + preview_num).val('');
		  			console.log("삭제후 tempArray : " + tempArray);
		  			
		  			//2. 5번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 3번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) 
		  			var preview_src_parent_5 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
		  			preview_src_parent_5 = preview_src_parent_5.replace( /\s/g, ".");
		  			$( "." + preview_src_parent_5 ).css( "display", "none" );
		  			
		  			//3. 5번사진 src 4번 사진 src으로 넣기 / 4번사진 src 3번 사진 src으로 넣기
					$( "#" + prefix + "preview" + ( num - 4 ) ).attr( "src", preview_src_2 );//2번사진 src --> 1번사진 src 넣기		  
					$( "#" + prefix + "preview" + ( num - 3 ) ).attr( "src", preview_src_3 );//3번사진 src --> 2번사진 src 넣기
					$( "#" + prefix + "preview" + ( num - 2 ) ).attr( "src", preview_src_4 );//4번사진 src --> 3번사진 src 넣기
					$( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src", preview_src_5 );//5번사진 src --> 4번사진 src 넣기		  
				}
		 	}
			
			if(num == 4){//사진 4장 선택됐을 때
				if(preview_num == 4){//4번 사진 삭제시
		    		//1. 4번사진 부모 class값 가져오고 display: none
		    		var preview_src_parent_4 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
		    		preview_src_parent_4 = preview_src_parent_4.replace( /\s/g, ".");
		    		$( "." + preview_src_parent_4 ).css( "display", "none" );
		    		$( "#" + prefix + "preview" + num ).attr( "src", "" );
		    		
		    		if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
		    			tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
		    		}
		    		
		    		$("#" + prefix + "upBtn" + preview_num).val('');
		    		console.log("삭제후 tempArray : " + tempArray);
				}
				  
				if(preview_num == 3){//3번 사진 삭제시( 3 <- 4 )
		  			//1. 4번사진 src 담기(4번사진 src 삭제 안해도 추가할 때 덧입혀짐 )
		  			//2. 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none)
		  			var preview_src_4 = $( "#" + prefix + "preview" + num ).attr( "src" );
		  			var preview_src_parent_4 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
		  			preview_src_parent_4 = preview_src_parent_4.replace( /\s/g, ".");
		  			$( "." + preview_src_parent_4 ).css( "display", "none" );
		  			$( "#" + prefix + "preview" + num ).attr( "src", "" );
		  			
		  			if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
		  				tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
	 	  			}
		  			console.log("삭제후 tempArray : " + tempArray);
		  			$("#" + prefix + "upBtn" + preview_num).val('');
		  			
		  			//3. 4번사진 src 3번 사진 src 넣기
					$( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src", preview_src_4 );//5번사진 src --> 4번사진 src 넣기		  
				}
		  		  
				if(preview_num == 2){//2번 사진 삭제시( 2 <- 3 <- 4 )
		  			//1. 3번사진 src 담기(3번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 4번사진 src 담기(4번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
		  			var preview_src_3 = $( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src" );
		  			var preview_src_4 = $( "#" + prefix + "preview" + num ).attr( "src" );
		  			$( "#" + prefix + "preview" + num ).attr( "src", "" );
		  			
		  			if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
		  				tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
		  			}
		  			
		  			$("#" + prefix + "upBtn" + preview_num).val('');
		  			console.log("삭제후 tempArray : " + tempArray);
		  			
		  			//2. 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) 
		  			var preview_src_parent_4 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
		  			preview_src_parent_4 = preview_src_parent_4.replace( /\s/g, ".");
		  			$( "." + preview_src_parent_4 ).css( "display", "none" );
		  			
		  			//3. 3번사진 src 2번 사진 src으로 넣기 / 4번사진 src 3번 사진 src으로 넣기
					$( "#" + prefix + "preview" + ( num - 2 ) ).attr( "src", preview_src_3 );//3번사진 src --> 2번사진 src 넣기
					$( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src", preview_src_4 );//4번사진 src --> 3번사진 src 넣기		  
				}
		  		  
				if(preview_num == 1){//1번 사진 삭제시( 1 <- 2 <- 3 <- 4 )
		  			//1. 2번사진 src 담기(2번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 3번사진 src 담기(3번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 4번사진 src 담기(4번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
		  			var preview_src_2 = $( "#" + prefix + "preview" + ( num - 2 ) ).attr( "src" );
		  			var preview_src_3 = $( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src" );
		  			var preview_src_4 = $( "#" + prefix + "preview" + num ).attr( "src" );
		  			$( "#" + prefix + "preview" + num ).attr( "src", "" );
		  			
		  			if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
		  				tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
		  			}
		  			
		  			$("#" + prefix + "upBtn" + preview_num).val('');
		  			console.log("삭제후 tempArray : " + tempArray);
		  			
		  			//2. 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 3번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) 
		  			var preview_src_parent_4 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
		  			preview_src_parent_4 = preview_src_parent_4.replace( /\s/g, ".");
		  			$( "." + preview_src_parent_4 ).css( "display", "none" );
		  			
		  			//3. 2번사진 src 1번 사진 src으로 넣기 / 3번사진 src 2번 사진 src으로 넣기 / 4번사진 src 3번 사진 src으로 넣기
					$( "#" + prefix + "preview" + ( num - 3 ) ).attr( "src", preview_src_2 );//2번사진 src --> 1번사진 src 넣기
					$( "#" + prefix + "preview" + ( num - 2 ) ).attr( "src", preview_src_3 );//3번사진 src --> 2번사진 src 넣기
					$( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src", preview_src_4 );//4번사진 src --> 3번사진 src 넣기		  
				}
			}
			
			if(num == 3){//사진 3장 선택됐을 때
				if(preview_num == 3){//3번 사진 삭제시
		    		//1. 3번사진 부모 class값 가져오고 display: none
		    		var preview_src_parent_3 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
		    		preview_src_parent_3 = preview_src_parent_3.replace( /\s/g, ".");
		    		$( "." + preview_src_parent_3 ).css( "display", "none" );
		    		$( "#" + prefix + "preview" + num ).attr( "src", "" );
		    		
		    		if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
		    			tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
		    		}
		    		
		    		$("#" + prefix + "upBtn" + preview_num).val('');
		    		console.log("삭제후 tempArray : " + tempArray);
				}
				  
				if(preview_num == 2){//2번 사진 삭제시( 2 <- 3 )
		  			//1. 3번사진 src 담기(3번사진 src 삭제 안해도 추가할 때 덧입혀짐 )
		  			//2. 3번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none)
		  			var preview_src_3 = $( "#" + prefix + "preview" + num ).attr( "src" );
		  			var preview_src_parent_3 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
		  			preview_src_parent_3 = preview_src_parent_3.replace( /\s/g, ".");
		  			$( "." + preview_src_parent_3 ).css( "display", "none" );
		  			$( "#" + prefix + "preview" + num ).attr( "src", "" );
		  			
		  			if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
		  				tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
		  			}
		  			
		  			$("#" + prefix + "upBtn" + preview_num).val('');
		  			console.log("삭제후 tempArray : " + tempArray);
		  			
		  			//3. 3번사진 src 2번 사진 src 넣기
					$( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src", preview_src_3 );//3번사진 src --> 2번사진 src 넣기		  
				}
		  		  
				if(preview_num == 1){//1번 사진 삭제시( 1 <- 2 <- 3 )
		  			//1. 2번사진 src 담기(2번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 3번사진 src 담기(3번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
		  			var preview_src_2 = $( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src" );
		  			var preview_src_3 = $( "#" + prefix + "preview" + num ).attr( "src" );
		  			$( "#" + prefix + "preview" + num ).attr( "src", "" );
		  			
		  			if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
		  				tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
		  			}
		  			
		  			$("#" + prefix + "upBtn" + preview_num).val('');
		  			console.log("삭제후 tempArray : " + tempArray);
		  			
		  			//2. 3번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) 
		  			var preview_src_parent_3 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
		  			preview_src_parent_3 = preview_src_parent_3.replace( /\s/g, ".");
		  			$( "." + preview_src_parent_3 ).css( "display", "none" );
		  			
		  			//3. 2번사진 src 1번 사진 src으로 넣기 / 3번사진 src 2번 사진 src으로 넣기
					$( "#" + prefix + "preview" + ( num - 2 ) ).attr( "src", preview_src_2 );//2번사진 src --> 1번사진 src 넣기
					$( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src", preview_src_3 );//3번사진 src --> 2번사진 src 넣기		  
				}
			}
			
			if(num == 2){//사진 2장 선택했을 때
				if(preview_num == 2){//2번 사진 삭제시
		    		//1. 2번사진 부모 class값 가져오고 display: none
		    		var preview_src_parent_2 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
		    		preview_src_parent_2 = preview_src_parent_2.replace( /\s/g, ".");
		    		$( "." + preview_src_parent_2 ).css( "display", "none" );
		    		$( "#" + prefix + "preview" + num ).attr( "src", "" );
		    		
		    		if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
		    			tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
		    		}
		    		
		    		$("#" + prefix + "upBtn" + preview_num).val('');
		    		console.log("삭제후 tempArray : " + tempArray);
				}
				  
				if(preview_num == 1){//1번 사진 삭제시( 1 <- 2 )
		  			//1. 2번사진 src 담기(2번사진 src 삭제 안해도 추가할 때 덧입혀짐 )
		  			//2. 2번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none)
		  			var preview_src_2 = $( "#" + prefix + "preview" + num ).attr( "src" );
		  			var preview_src_parent_2 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
		  			preview_src_parent_2 = preview_src_parent_2.replace( /\s/g, ".");
		  			$( "." + preview_src_parent_2 ).css( "display", "none" );
		  			$( "#" + prefix + "preview" + num ).attr( "src", "" );
		  			
		  			if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
		  				tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
		  			}
		  			
		  			$("#" + prefix + "upBtn" + preview_num).val('');
		  			console.log("삭제후 tempArray : " + tempArray);
		  			
		  			//3. 2번사진 src 1번 사진 src 넣기
					$( "#" + prefix + "preview" + ( num - 1 ) ).attr( "src", preview_src_2 );//2번사진 src --> 1번사진 src 넣기		  
				}
			}
			
			if(num == 1){
				if(preview_num == 1){//1번 사진 삭제시
		    		//1. 1번사진 부모 class값 가져오고 display: none
		    		var preview_src_parent_1 = $( "#" + prefix + "preview" + num ).parent().attr( "class" );
		    		preview_src_parent_1 = preview_src_parent_1.replace( /\s/g, ".");
		    		$( "." + preview_src_parent_1 ).css( "display", "none" );
		    		$( "#" + prefix + "preview" + num ).attr( "src", "" );
		    		
		    		if(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()) >= 0){
		    			tempArray.splice(tempArray.indexOf($("#" + prefix + "upBtn" + preview_num).val()), 1);
		    		}
		    		
		    		$("#" + prefix + "upBtn" + preview_num).val('');
		    		console.log("삭제후 tempArray : " + tempArray);
				}
			}
		}
	});
}