<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--PG크로스브라우징필수내용 시작-->
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Pragma" content="no-cache">
<!--PG크로스브라우징필수내용 끝-->
<link rel="stylesheet" href="/h72/resources/css/productEnroll.css">
<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="/h72/resources/js/productEnroll.thumnail.js"></script>
<script type="text/javascript" src="/h72/resources/js/productEnroll.formCheck.js"></script>
<script type="text/javascript" src="/h72/resources/js/productEnroll.option.js"></script>
<title>72hours::국내 최대 재난대비 용품샵</title>
<script>

$(document).ready(function(){
	
});

</script>
</head>
<body id="main">
	<div id="productEnroll_top">
		<jsp:include page="../main_header.jsp" flush="false" />
	</div>
	<!-- START -->
	<div id="productEnroll_wrap" >
		<div id="productEnroll_header" class="">
			<div class="line1">
			</div>
			<div class="line2">
			</div>
		</div>
		
		<div id="productEnroll_contents">
			<div id="productEnroll_in">
				<div class="titleArea">
				    <h2>PRODUCT ENROLL</h2> 
				</div>
				<div id="productEnroll">
					<form action="productEnrollInsert" method="post" enctype="multipart/form-data">
						<table id="productEnroll_table">
							<tr>
								<td><p>상 품 명</p></td>
								<td>
									<div class="inputBox3Wrap" id="">
										<input type="text" placeholder="" id="itemName" name="itemName" class="inputBox3" >
									</div>
								</td>
							</tr>

							<tr>
								<td><p>거래 업체</p></td>
								<td>
									<div class="inputBox3Wrap" id="productEnroll_cate">
										<input type="text" placeholder="" id="" name="providerCode" class="inputBox3">
									</div>
								</td>
							</tr>
							<tr>
								<td><p>옵 션</p></td>
								<td>
									<div id="productEnroll_explanation">
										<p>
											* ID는 옵션을 구별하는 고유 ID를 뜻합니다. &nbsp; &nbsp;예시)   black : bk 또는  white : wh
										</p>
									</div>
									<div class="" id="productEnroll_priceBtnWrap">
										<input type="button" name="" class="" value="+" id="productEnroll_priceBtn"/>
									</div>
									<div class="productEnroll_price" id="productEnroll_priceInputWrap">
										<ul>
											<li>
												<input type="text" id="productEnroll_option" name="itemOptionName" placeholder="옵션명" 
												class="" onchange="" onkeyup=""/>
											</li>
											<li>
												<input type="text" id="productEnroll_optionId" name="itemOptionId" placeholder="ID" 
												class="" onfocus="OptionExplanationOpen()" onfocusout="OptionExplanationclose()"/>
												|
											</li>
											<li>
												<input type="text" id="" name="cost" 
												min="0" max="1000000000" step="1000" placeholder="매입가" 
												class="" onchange="getNumber(this);" onkeyup="getNumber(this);"/>
												원
											</li>
											
											<li>
												<input type="text" id="" name="price" 
												min="0" max="1000000000" step="1000" placeholder="판매가" 
												class="" onchange="getNumber(this);" onkeyup="getNumber(this);"/>
												원												
											</li>
											<li>
												<input type="text" id="" name="sailPrice" 
												min="0" max="1000000000" step="1000" placeholder="할인가" 
												class="" onchange="getNumber(this);" onkeyup="getNumber(this);"/>
												원
											</li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<td><p>재고 수량</p></td>
								<td>
									<div class="productEnroll_stock" id="">
										<ul>
											<li>
												<input type="number" placeholder="" id="" name="stock" class=""
												  min="0" max="500" step="1" value="1">
										  	</li>
											<li>개</li>	
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<td><p>분 류</p></td>
								<td>
									<script>
									 	$(document).ready(function() {
											$("input[name=productEnroll_category]").change(function() {
												$("input[name=productEnroll_category]").each(function(i) {
												   if (this.checked) {
													   $("input[name=productEnroll_categoryValue]").eq(i).val("Y");
												   }else{
													   $("input[name=productEnroll_categoryValue]").eq(i).val("N");
												   }
												});
											});
										}); 
									</script>
									<div class="" id="productEnroll_servie">
									<ul>
										<li><input type="radio" name="productEnroll_category" id="productEnroll_cate1"><label for="productEnroll_cate1">배낭</label></li>
										<li><input type="radio" name="productEnroll_category" id="productEnroll_cate2"><label for="productEnroll_cate2">방한</label></li>   
										<li><input type="radio" name="productEnroll_category" id="productEnroll_cate3"><label for="productEnroll_cate3">식료</label></li>  
										<li><input type="radio" name="productEnroll_category" id="productEnroll_cate4"><label for="productEnroll_cate4">도구</label></li>  
										<li><input type="radio" name="productEnroll_category" id="productEnroll_cate5"><label for="productEnroll_cate5">기타</label></li>  
									</ul>
									
									<input type="hidden" name="productEnroll_categoryValue" >
									<input type="hidden" name="productEnroll_categoryValue" >
									<input type="hidden" name="productEnroll_categoryValue" >
									<input type="hidden" name="productEnroll_categoryValue" >
									<input type="hidden" name="productEnroll_categoryValue" >
									
									</div>
								</td>
							</tr>
							
							<tr>
								<td><p class="textarea_text">비 고</p></td>
								<td>
									<div class="textareaBoxWrap" id="">
										<textarea placeholder="" id="" name="etc" class="textareaBox" style="background:aliceblue;"></textarea>
										<div id="review_text_state" class="border_radius soft">
													특이 사항이 있으면 적어주세요!
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td id="farea">
									<div id="itemPhoto" class="item photo">
										<div class="">
											<button type="button" id="productEnroll_photo" class="" tabindex="-1">
												+
											</button>
											<input type="file" multiple name="img1" id="upBtn1" class="file_input_hidden" /> 
											<input type="file" multiple name="img2" id="upBtn2" class="file_input_hidden" style="display:none" /> 
										    <div id="thumnailArea">
										    	<div id="thumnailWrap1"><img id="thumnail1" name="thumanail" /><span class="productEnroll_thumDelete" >X</span></div>
										    	<div id="thumnailWrap2"><img id="thumnail2" name="thumanail" /><span class="productEnroll_thumDelete">X</span></div>
										    </div>
										</div>
									</div>
								    <div id="thumnailExplane"><span>*첫번째 이미지는 Title로 사용될 이미지 입니다.</span></div>
								</td>
							</tr>
						</table>
						<div id="productEnroll_enrollBtnWrap">
							<input type="submit" value="등록하기" id="productEnroll_enrollBtn">
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
		<div id="productEnroll_footer">
			<div id="productEnroll_in">
				<jsp:include page="../main_footer.jsp" flush="false" />
			</div>
		</div>

	<!-- END -->

</body>

</html>