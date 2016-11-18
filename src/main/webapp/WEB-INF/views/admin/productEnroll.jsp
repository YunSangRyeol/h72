<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
										<input type="text" placeholder="" id="itemName" name="itemName" class="inputBox3" value="${item[0].itemName}" >
									</div>
								</td>
							</tr>
							<tr>
								<td><p>거래 업체</p></td>
								<td>
									<div class="inputBox3Wrap" id="providerCode">
										<select id="productEnroll_provider" name="providerCode" class="inputBox3">
										    <c:forEach var="provider" items="${provider}">
											    <option value="${provider.providerCode}">${provider.providerName }</option>
										    </c:forEach>
										</select>
									</div>
									<div id="productEnroll_providerInfoWrap">
									 <c:forEach var="provider" items="${provider}" varStatus="status">
										<ul id="productEnroll_providerInfo${status.count}">
											<li><span>상점명</span><span>${provider.providerName }</span></li>
											<li><span>Phone</span><span>${provider.pPhone}</span></li>
											<li><span>Tell</span><span>${provider.pTell }</span></li>
											<li><span>주 소</span><span>${provider.pAderess }</span></li>
										</ul>
										</c:forEach>
									</div>
								</td>
							</tr>
							<tr>
								<td><p>옵 션</p></td>
								<td>
									<div id="productEnroll_explanation">
										<p>
											* ID는 옵션을 구별하는 고유 ID를 뜻합니다. &nbsp; &nbsp;예시)   BLACK : BK 또는  WHITE : WH
										</p>
									</div>
									<div class="" id="productEnroll_priceBtnWrap">
										<input type="button" name="" class="" value="+" id="productEnroll_priceBtn"/>
									</div>
									<c:if test="${item ne null }">
									<c:forEach items="${item}" varStatus="i" var="item">
									<div class="productEnroll_price" id="productEnroll_priceInputWrap">
										<ul>
											<li>
												<input type="text" id="productEnroll_option" name="itemOptionName" placeholder="옵션명" 
												class="" onchange="" onkeyup="" value="${item.itemOptionName }"/>
											</li>
											<li>
												<input type="text" id="productEnroll_optionId" name="itemOptionId" placeholder="ID" 
												class="" onfocus="OptionExplanationOpen()" onfocusout="OptionExplanationclose()"
												value="${fn:substring(item.itemId,fn:length(item.itemId)-2,fn:length(item.itemId))}"
												/>
												|
											</li>
											<li>
												<input type="text" id="cost" name="cost" 
												min="0" max="1000000000" step="1000" placeholder="매입가" 
												class="" onchange="getNumber(this);" onkeyup="getNumber(this);"
												value="${item.cost}"/>
												원
											</li>
											
											<li>
												<input type="text" id="price" name="price" 
												min="0" max="1000000000" step="1000" placeholder="판매가" 
												class="" onchange="getNumber(this);" onkeyup="getNumber(this);"
												value="${item.price}"/>
												원												
											</li>
											<li>
												<input type="text" id="sailPrice" name="sailPrice" 
												min="0" max="1000000000" step="1000" placeholder="할인가" 
												class="" onchange="getNumber(this);" onkeyup="getNumber(this);"
												value="${item.sailPrice}"/>
													원
											</li>
											<li>
												<input type="number" placeholder="" id="" name="stock" class=""
												  min="0" max="500" step="1" value="${item.stock}" />
										  		개
										  	</li>
										</ul>
									</div>
									</c:forEach>
									</c:if>
									<c:if test="${item eq null }">
									<div class="productEnroll_price" id="productEnroll_priceInputWrap_null">
										<ul>
											<li>
												<input type="text" id="productEnroll_option" name="itemOptionName" placeholder="옵션명" 
												class="" onchange="" onkeyup="" value=""/>
											</li>
											<li>
												<input type="text" id="productEnroll_optionId" name="itemOptionId" placeholder="ID" 
												class="" onfocus="OptionExplanationOpen()" onfocusout="OptionExplanationclose()"
												value=""
												/>
												|
											</li>
											<li>
												<input type="text" id="cost" name="cost" 
												min="0" max="1000000000" step="1000" placeholder="매입가" 
												class="" onchange="getNumber(this);" onkeyup="getNumber(this);"
												value=""/>
												원
											</li>
											
											<li>
												<input type="text" id="price" name="price" 
												min="0" max="1000000000" step="1000" placeholder="판매가" 
												class="" onchange="getNumber(this);" onkeyup="getNumber(this);"
												value=""/>
												원												
											</li>
											<li>
												<input type="text" id="sailPrice" name="sailPrice" 
												min="0" max="1000000000" step="1000" placeholder="할인가" 
												class="" onchange="getNumber(this);" onkeyup="getNumber(this);"
												value=""/>
													원
											</li>
											<li>
												<input type="number" placeholder="" id="" name="stock" class=""
												  min="0" max="500" step="1">
										  		개
										  	</li>
										</ul>
									</div>
									</c:if>
									
								</td>
							</tr>
							<tr>
								<td><p>분 류</p></td>
								<td>
									<div class="" id="productEnroll_servie">
									<ul>
										<li><input type="radio" name="categoryCode" id="productEnroll_cate1" value="BAG" ><label for="productEnroll_cate1">배낭</label></li>
										<li><input type="radio" name="categoryCode" id="productEnroll_cate2" value="PROTECT"><label for="productEnroll_cate2">방한</label></li>   
										<li><input type="radio" name="categoryCode" id="productEnroll_cate3" value="FOOD"><label for="productEnroll_cate3">식료</label></li>  
										<li><input type="radio" name="categoryCode" id="productEnroll_cate4" value="TOOL"><label for="productEnroll_cate4">도구</label></li>  
										<li><input type="radio" name="categoryCode" id="productEnroll_cate5" value="ETC"><label for="productEnroll_cate5">기타</label></li>  
									</ul>
									<c:choose>
											<c:when test="${item eq null}">
												<script>
													$("#productEnroll_cate1").attr("checked",true);
												</script>
											</c:when>
											<c:otherwise>
													<c:choose>
														<c:when test="${fn:substring(item[0].itemDetailId,0,3) eq 'BAG'}">
														<script>
															$("#productEnroll_cate1").attr("checked",true);
														</script>
														</c:when>
														<c:when test="${fn:substring(item[0].itemDetailId,0,5) eq 'PROTECT'}">
														<script>
															$("#productEnroll_cate2").attr("checked",true);
														</script>
														</c:when>
														<c:when test="${fn:substring(item[0].itemDetailId,0,4) eq 'FOOD'}">
														<script>
															$("#productEnroll_cate3").attr("checked",true);
														</script>
														</c:when>
														<c:when test="${fn:substring(item[0].itemDetailId,0,4) eq 'TOOL'}">
														<script>
															$("#productEnroll_cate4").attr("checked",true);
														</script>
														</c:when>
														<c:when test="${fn:substring(item[0].itemDetailId,0,3) eq 'ETC'}">
														<script>
															$("#productEnroll_cate5").attr("checked",true);
														</script>
														</c:when>
													</c:choose>
											</c:otherwise>	
										</c:choose>
									</div>
								</td>
							</tr>
							<tr>
								<td><p class="textarea_text">비 고</p></td>
								<td>
									<div class="textareaBoxWrap" id="">
										<textarea placeholder="" id="" name="etc" class="textareaBox" style="background:aliceblue;">${item[0].etc}</textarea>
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
										<button type="button" id="productEnroll_photo" class="" tabindex="-1">
											+
										</button>
										<div class="fileWrap">
											<input type="file" multiple name="img1" id="upBtn1" class="file_input_hidden" /> 
											<input type="file" multiple name="img2" id="upBtn2" class="file_input_hidden" style="display:none" /> 
										</div>
									    <div id="thumnailArea">
									    	<div id="thumnailWrap1">
									    		<img id="thumnail1" name="thumanail" />
									    		<span class="productEnroll_thumDelete" >X</span>
									    	</div>
									    	<div id="thumnailWrap2">
									    		<img id="thumnail2" name="thumanail" />
									    		<span class="productEnroll_thumDelete">X</span>
									    	</div>
									    </div>
									</div>
									<c:if test="${item ne null }">
										<div id="itemPhotoUpdate" class="item photo">
										    <div id="thumnailAreaUpdate">
										    	<div id="updateImgWrap1">
										    		<img id="updateImg1" src="/h72/resources${item[0].mainImg}"/>
										    	</div>
										    	<div id="updateImgWrap2">
										    		<img id="updateImg2" src="/h72/resources${item[0].detailImg01}"/>
										    	</div>
										    	<c:if test="${item[0].detailImg02 ne null }">
										    	<div id="updateImgWrap3">
										    		<img id="updateImg3" src="/h72/resources${item[0].detailImg02}"/>
										    	</div>
										    	</c:if>
												<div id="updateDelete" class="updateImgDelete"><p>전체삭제</p></div>
										    </div>
										</div>
									</c:if>
								    <div id="thumnailExplane"><span>*첫번째 이미지는 Title로 사용될 이미지 입니다.</span></div>
								</td>
							</tr>
						</table>
						<div id="productEnroll_enrollBtnWrap">
							<c:if test="${item eq null }"> 
							<input type="button" value="등록하기" id="productEnroll_enrollBtn">
							</c:if>
							
							<c:if test="${item ne null }"> 
								<input type="button" value="수정하기" id="productEnroll_updateBtn">
							</c:if>
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