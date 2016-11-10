/**
 * review.js
 */

function init(pageNo){
	alert("init 실행");
	getReviewList(pageNo);
}

function getReviewList(pageNo_pa){
		var params = {pageNo : pageNo_pa ,
					  itemDetailId : _itemDetailId}
		alert("getReviewList function 실행");
		alert("params : " + params.pageNo + ", " + params.itemDetailId);
		
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
	alert("paging run");
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
	alert("reviewing run");
	$(".reviews.reviews-product").html("");
	console.log("reviewList1111111111111111");
	console.log(reviewList);
	if(reviewList != null){
		
		var listSize = reviewList.length;
		var loginUser = $("#loginUserId").val();
			//$("input[name='R_WRITER']").val();
		
		if(listSize != 0){
			for(var i = 0; i < listSize; i++){
				var list_div = "";
				/*$(".reviews.reviews-product").append(
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
						"	</li>");*/
				
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
											reviewList[i].r_CONTENTS +
				"						</a>" +
				"					</div>" +
				"					<ul class='images'>" +
				"						<li>" +
				"							<a data-photo-review-popup-url='' class='photo-review-popup'>" +
				"								<img class='review-image loaded' src='/h72/resources/uploadFiles/" + reviewList[i].r_IMG01 + "' style='width:74px; height:74px;'>" +
				"							</a>" +
				"						</li>" +
				"						<li>" +
				"							<a data-photo-review-popup-url='' class='photo-review-popup'>" +
				"								<img class='review-image loaded' src='/h72/resources/uploadFiles/" + reviewList[i].r_IMG02 + "' style='width:74px; height:74px;'>" +
				"							</a>" +
				"						</li>" +
				"						<li>" +
				"							<a data-photo-review-popup-url='' class='photo-review-popup'>" +
				"								<img class='review-image loaded' src='/h72/resources/uploadFiles/" + reviewList[i].r_IMG03 + "' style='width:74px; height:74px;'>" +
				"							</a>" +
				"						</li>" +
				"						<li>" +
				"							<a data-photo-review-popup-url='' class='photo-review-popup'>" +
				"								<img class='review-image loaded' src='/h72/resources/uploadFiles/" + reviewList[i].r_IMG04 + "' style='width:74px; height:74px;'>" +
				"							</a>" +
				"						</li>" +
				"						<li>" +
				"							<a data-photo-review-popup-url='' class='photo-review-popup'>" +
				"								<img class='review-image loaded' src='/h72/resources/uploadFiles/" + reviewList[i].r_IMG05 + "' style='width:74px; height:74px;'>" +
				"							</a>" +
				"						</li>" +
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
					"				<a>" +
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
	
	$(document).on("click", "#delete", function(){
		console.log("rrrr");
		var focus_review_div_id = $(this).parent().parent().parent().parent().parent().parent().parent().parent().attr("id");
		var focus_div_user = $(this).parent().parent().parent().parent().parent().parent().parent().parent().children().first().children().children().first().children().last().text();
		var currentPageNo = $(".product_reviews__footer > #pager > .page-list > .pagination > li.ajaxPageC.active").text();
		var itemDetailId = _itemDetailId;
		
		var params = {
			reviewNo : focus_review_div_id ,
			user : focus_div_user ,
			itemDetailId : itemDetailId ,
		};
		
		/*var params2 = {
			pageNo : currentPageNo ,
			itemDetailId : itemDetailId
		};*/
		
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
					alert("result : " + data.result + ": 삭제 성공");
					
					if(reviewListCount/limit == 1){
						getReviewList(currentPageNo - 1);
					}else{
						getReviewList(currentPageNo);
					}
					//삭제 후 다시 뿌려주는 ajax 호출 
					/*if(currentPageNo == ""){
						console.log("currentPageNo : " + currentPageNo);
						alert("currentPageNo : null");
						getReviewList(1);
					}*/
					/*getReviewList(currentPageNo);*/
				}
				
				/*paging(data);
				reviewing(data.reviewList);*/
			} 
			,error : function(data){}
		});
		
	});
	
	
	
	$(document).on("click", ".ajaxPageC", function(){
   		var pageNo = $(this).text();
   		alert("pageNo : " + pageNo);
   		getReviewList(pageNo);
   	});
	
	//구매하기, 장바구니 버튼
	$(".remove-preview.hoverable").mouseenter(function(){
		$(this).css("opacity", "0.8");
	});
	
	$(".remove-preview.hoverable").mouseleave(function(){
		$(this).css("opacity", "0.4");
	});
		
	uploadPhoto();
}

console.log(_itemDetailId);
   
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
   	var n = 1;
  	var num = 1;
   	console.log("ok");
   	console.log(n);
     	
   	//사진올리기 버튼 클릭
	$(document).on("click", ".field-box.add-image-container, .image-inline-photo-add", function(){
   		//e.preventDefault();
   		if(n < 6){
   			//버튼(input type=file)클릭 강제 이벤트
   			$("#upBtn" + n).click();         
   			$("input:file").val().toLowerCase();
   		}else{
   			alert("사진은 최대 5장까지만 업로드할 수 있습니다.")
   		}
   	});
     	
   	//input file 선택했을 때
	$(".input-file").change(function(){
		$(".image-inline-photo-add").css("display", "block");
		
		var ext = $("#upBtn" + n).val().split(".").pop();
		ext = ext.toLowerCase();
		
		if(ext.length > 0){
			if($.inArray(ext,['gif','png','jpg','jpeg']) == -1) { 
				alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
				this.value = "";
				return false;  
			} else {
				readURL(this);	
				if(num != 6){	
					$(this).css("display", "none");
				}
		 		
				var thum = $(".preview_div_" + n).attr("class");
				thum = thum.replace( /\s/, ".");
				$("." + thum).css("display", "block");//숨겨진 섬네일 show
			}
		}
		n++;
	});
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				var thumnailId = "preview"+ num;
				console.log(thumnailId);
				$('#'+thumnailId).css("width","74px");
				$('#'+thumnailId).css("height","74px");
				$('#'+thumnailId).attr("src", e.target.result);
				num++;
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	//사진 삭제 눌렀을 때
	$( document ).on( "click", ".remove-preview.hoverable", function(){
	  
		//선택한 사진의 번호
		var this_preview_class = $( this ).parent().attr( "class" );//클릭한 섬네일 div
		this_preview_class = this_preview_class.replace( /\s/, "." );//공백 '.' 치환 
		var preview_num = this_preview_class.substring( this_preview_class.length - 1);
		  
		n--;	// 6 -> 5
		num--;	// 6 -> 5

 		  	//alert( "선택된 사진 class(from parent)  : " + this_preview_class + "\n선택된 사진 번호 : " + preview_num + "\nn: " + n +"\nnum: " + num + "\n총 사진갯수 : " + num);
		if(num == 5){
			//사진 5장 선택됐을 때
			if(preview_num == 5){//5번 사진 삭제시
  		  		//1. 5번사진 src 담기(5번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
    			var preview_src_5 = $( "#preview" + num ).attr( "src" );
    			$( "#preview" + num ).attr( "src", null );
    			
    			//2. 5번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none)
    			var preview_src_parent_5 = $( "#preview" + num ).parent().attr( "class" );
    			preview_src_parent_5 = preview_src_parent_5.replace( /\s/, ".");
    			$( "." + preview_src_parent_5 ).css( "display", "none" );
  		  	}
		  
			if(preview_num == 4){//4번 사진 삭제시( 4 <- 5 )
				//1. 5번사진 src 담기(5번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
				var preview_src_5 = $( "#preview" + num ).attr( "src" );
				$( "#preview" + num ).attr( "src", "" );
				
				//2. 5번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none)
				var preview_src_parent_5 = $( "#preview" + num ).parent().attr( "class" );
				preview_src_parent_5 = preview_src_parent_5.replace( /\s/, ".");
				$( "." + preview_src_parent_5 ).css( "display", "none" );
				
				//3. 5번사진 src 4번 사진 src 넣기
				$( "#preview" + ( num - 1 ) ).attr( "src", preview_src_5 );//5번사진 src --> 4번사진 src 넣기		  
	  		}
  		  
			if(preview_num == 3){//3번 사진 삭제시( 3 <- 4 <- 5 )
	  			//1. 5번사진 src 담기(5번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 4번사진 src 담기(4번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
	  			var preview_src_4 = $( "#preview" + ( num - 1 ) ).attr( "src" );
	  			var preview_src_5 = $( "#preview" + num ).attr( "src" );
	  			
	  			//2. 5번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) 
	  			var preview_src_parent_5 = $( "#preview" + num ).parent().attr( "class" );
	  			preview_src_parent_5 = preview_src_parent_5.replace( /\s/, ".");
	  			$( "." + preview_src_parent_5 ).css( "display", "none" );
	  			
	  			//3. 5번사진 src 4번 사진 src으로 넣기 / 4번사진 src 3번 사진 src으로 넣기
				$( "#preview" + ( num - 2 ) ).attr( "src", preview_src_4 );//4번사진 src --> 3번사진 src 넣기
				$( "#preview" + ( num - 1 ) ).attr( "src", preview_src_5 );//5번사진 src --> 4번사진 src 넣기		  
			}	
  		  
			if(preview_num == 2){//2번 사진 삭제시( 2 <- 3 <- 4 <- 5 )
	  			//1. 5번사진 src 담기(5번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 4번사진 src 담기(4번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 3번사진 src 담기(3번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
	  			var preview_src_3 = $( "#preview" + ( num - 2 ) ).attr( "src" );
	  			var preview_src_4 = $( "#preview" + ( num - 1 ) ).attr( "src" );
	  			var preview_src_5 = $( "#preview" + num ).attr( "src" );
	  			
	  			//2. 5번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 3번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) 
	  			var preview_src_parent_5 = $( "#preview" + num ).parent().attr( "class" );
	  			preview_src_parent_5 = preview_src_parent_5.replace( /\s/, ".");
	  			$( "." + preview_src_parent_5 ).css( "display", "none" );
	  			
	  			//3. 5번사진 src 4번 사진 src으로 넣기 / 4번사진 src 3번 사진 src으로 넣기
				$( "#preview" + ( num - 3 ) ).attr( "src", preview_src_3 );//3번사진 src --> 2번사진 src 넣기
				$( "#preview" + ( num - 2 ) ).attr( "src", preview_src_4 );//4번사진 src --> 3번사진 src 넣기
				$( "#preview" + ( num - 1 ) ).attr( "src", preview_src_5 );//5번사진 src --> 4번사진 src 넣기		  
			}
  		  
			if(preview_num == 1){//2번 사진 삭제시( 1 <- 2 <- 3 <- 4 <- 5 )
	  			//1. 5번사진 src 담기(5번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 4번사진 src 담기(4번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 3번사진 src 담기(3번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
	  			var preview_src_2 = $( "#preview" + ( num - 3 ) ).attr( "src" );
	  			var preview_src_3 = $( "#preview" + ( num - 2 ) ).attr( "src" );
	  			var preview_src_4 = $( "#preview" + ( num - 1 ) ).attr( "src" );
	  			var preview_src_5 = $( "#preview" + num ).attr( "src" );
	  			
	  			//2. 5번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 3번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) 
	  			var preview_src_parent_5 = $( "#preview" + num ).parent().attr( "class" );
	  			preview_src_parent_5 = preview_src_parent_5.replace( /\s/, ".");
	  			$( "." + preview_src_parent_5 ).css( "display", "none" );
	  			
	  			//3. 5번사진 src 4번 사진 src으로 넣기 / 4번사진 src 3번 사진 src으로 넣기
				$( "#preview" + ( num - 4 ) ).attr( "src", preview_src_2 );//2번사진 src --> 1번사진 src 넣기		  
				$( "#preview" + ( num - 3 ) ).attr( "src", preview_src_3 );//3번사진 src --> 2번사진 src 넣기
				$( "#preview" + ( num - 2 ) ).attr( "src", preview_src_4 );//4번사진 src --> 3번사진 src 넣기
				$( "#preview" + ( num - 1 ) ).attr( "src", preview_src_5 );//5번사진 src --> 4번사진 src 넣기		  
			}
	 	}
		
		if(num == 4){//사진 4장 선택됐을 때
			if(preview_num == 4){//4번 사진 삭제시
	    		//1. 4번사진 부모 class값 가져오고 display: none
	    		var preview_src_parent_4 = $( "#preview" + num ).parent().attr( "class" );
	    		preview_src_parent_4 = preview_src_parent_4.replace( /\s/, ".");
	    		$( "." + preview_src_parent_4 ).css( "display", "none" );
			}
			  
			if(preview_num == 3){//3번 사진 삭제시( 3 <- 4 )
	  			//1. 4번사진 src 담기(4번사진 src 삭제 안해도 추가할 때 덧입혀짐 )
	  			//2. 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none)
	  			var preview_src_4 = $( "#preview" + num ).attr( "src" );
	  			var preview_src_parent_4 = $( "#preview" + num ).parent().attr( "class" );
	  			preview_src_parent_4 = preview_src_parent_4.replace( /\s/, ".");
	  			$( "." + preview_src_parent_4 ).css( "display", "none" );
	  			//3. 4번사진 src 3번 사진 src 넣기
				$( "#preview" + ( num - 1 ) ).attr( "src", preview_src_4 );//5번사진 src --> 4번사진 src 넣기		  
			}
	  		  
			if(preview_num == 2){//2번 사진 삭제시( 2 <- 3 <- 4 )
	  			//1. 3번사진 src 담기(3번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 4번사진 src 담기(4번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
	  			var preview_src_3 = $( "#preview" + ( num - 1 ) ).attr( "src" );
	  			var preview_src_4 = $( "#preview" + num ).attr( "src" );
	  			
	  			//2. 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) 
	  			var preview_src_parent_4 = $( "#preview" + num ).parent().attr( "class" );
	  			preview_src_parent_4 = preview_src_parent_4.replace( /\s/, ".");
	  			$( "." + preview_src_parent_4 ).css( "display", "none" );
	  			
	  			//3. 3번사진 src 2번 사진 src으로 넣기 / 4번사진 src 3번 사진 src으로 넣기
				$( "#preview" + ( num - 2 ) ).attr( "src", preview_src_3 );//3번사진 src --> 2번사진 src 넣기
				$( "#preview" + ( num - 1 ) ).attr( "src", preview_src_4 );//4번사진 src --> 3번사진 src 넣기		  
			}
	  		  
			if(preview_num == 1){//1번 사진 삭제시( 1 <- 2 <- 3 <- 4 )
	  			//1. 2번사진 src 담기(2번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 3번사진 src 담기(3번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 4번사진 src 담기(4번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
	  			var preview_src_2 = $( "#preview" + ( num - 2 ) ).attr( "src" );
	  			var preview_src_3 = $( "#preview" + ( num - 1 ) ).attr( "src" );
	  			var preview_src_4 = $( "#preview" + num ).attr( "src" );
	  			
	  			//2. 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 4번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) / 3번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) 
	  			var preview_src_parent_4 = $( "#preview" + num ).parent().attr( "class" );
	  			preview_src_parent_4 = preview_src_parent_4.replace( /\s/, ".");
	  			$( "." + preview_src_parent_4 ).css( "display", "none" );
	  			
	  			//3. 2번사진 src 1번 사진 src으로 넣기 / 3번사진 src 2번 사진 src으로 넣기 / 4번사진 src 3번 사진 src으로 넣기
				$( "#preview" + ( num - 3 ) ).attr( "src", preview_src_2 );//2번사진 src --> 1번사진 src 넣기
				$( "#preview" + ( num - 2 ) ).attr( "src", preview_src_3 );//3번사진 src --> 2번사진 src 넣기
				$( "#preview" + ( num - 1 ) ).attr( "src", preview_src_4 );//4번사진 src --> 3번사진 src 넣기		  
			}
		}
		
		if(num == 3){//사진 3장 선택됐을 때
			if(preview_num == 3){//3번 사진 삭제시
	    		//1. 3번사진 부모 class값 가져오고 display: none
	    		var preview_src_parent_3 = $( "#preview" + num ).parent().attr( "class" );
	    		preview_src_parent_3 = preview_src_parent_3.replace( /\s/, ".");
	    		$( "." + preview_src_parent_3 ).css( "display", "none" );
			}
			  
			if(preview_num == 2){//2번 사진 삭제시( 2 <- 3 )
	  			//1. 3번사진 src 담기(3번사진 src 삭제 안해도 추가할 때 덧입혀짐 )
	  			//2. 3번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none)
	  			var preview_src_3 = $( "#preview" + num ).attr( "src" );
	  			var preview_src_parent_3 = $( "#preview" + num ).parent().attr( "class" );
	  			preview_src_parent_3 = preview_src_parent_3.replace( /\s/, ".");
	  			$( "." + preview_src_parent_3 ).css( "display", "none" );
	  			
	  			//3. 3번사진 src 2번 사진 src 넣기
				$( "#preview" + ( num - 1 ) ).attr( "src", preview_src_3 );//3번사진 src --> 2번사진 src 넣기		  
			}
	  		  
			if(preview_num == 1){//1번 사진 삭제시( 1 <- 2 <- 3 )
	  			//1. 2번사진 src 담기(2번사진 src 삭제 안해도 추가할 때 덧입혀짐.) / 3번사진 src 담기(3번사진 src 삭제 안해도 추가할 때 덧입혀짐.)
	  			var preview_src_2 = $( "#preview" + ( num - 1 ) ).attr( "src" );
	  			var preview_src_3 = $( "#preview" + num ).attr( "src" );
	  			
	  			//2. 3번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none) 
	  			var preview_src_parent_3 = $( "#preview" + num ).parent().attr( "class" );
	  			preview_src_parent_3 = preview_src_parent_3.replace( /\s/, ".");
	  			$( "." + preview_src_parent_3 ).css( "display", "none" );
	  			
	  			//3. 2번사진 src 1번 사진 src으로 넣기 / 3번사진 src 2번 사진 src으로 넣기
				$( "#preview" + ( num - 2 ) ).attr( "src", preview_src_2 );//2번사진 src --> 1번사진 src 넣기
				$( "#preview" + ( num - 1 ) ).attr( "src", preview_src_3 );//3번사진 src --> 2번사진 src 넣기		  
			}
		}
		
		if(num == 2){//사진 2장 선택했을 때
			if(preview_num == 2){//2번 사진 삭제시
	    		//1. 2번사진 부모 class값 가져오고 display: none
	    		var preview_src_parent_2 = $( "#preview" + num ).parent().attr( "class" );
	    		preview_src_parent_2 = preview_src_parent_2.replace( /\s/, ".");
	    		$( "." + preview_src_parent_2 ).css( "display", "none" );
			}
			  
			if(preview_num == 1){//1번 사진 삭제시( 1 <- 2 )
	  			//1. 2번사진 src 담기(2번사진 src 삭제 안해도 추가할 때 덧입혀짐 )
	  			//2. 2번사진 부모 class값 가져오기(class 값에 공백을 '.'로 치환 --> display: none)
	  			var preview_src_2 = $( "#preview" + num ).attr( "src" );
	  			var preview_src_parent_2 = $( "#preview" + num ).parent().attr( "class" );
	  			preview_src_parent_2 = preview_src_parent_2.replace( /\s/, ".");
	  			$( "." + preview_src_parent_2 ).css( "display", "none" );
	  			
	  			//3. 2번사진 src 1번 사진 src 넣기
				$( "#preview" + ( num - 1 ) ).attr( "src", preview_src_2 );//2번사진 src --> 1번사진 src 넣기		  
			}
		}
		
		if(num == 1){
			if(preview_num == 1){//1번 사진 삭제시
	    		//1. 1번사진 부모 class값 가져오고 display: none
	    		var preview_src_parent_1 = $( "#preview" + num ).parent().attr( "class" );
	    		preview_src_parent_1 = preview_src_parent_1.replace( /\s/, ".");
	    		$( "." + preview_src_parent_1 ).css( "display", "none" );
	    		$( "#preview" + num ).attr( "src", "" );
			}
		}
	});
}