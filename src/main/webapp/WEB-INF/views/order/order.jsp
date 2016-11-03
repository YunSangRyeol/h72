<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="/h72/resources/css/cart.css" type="text/css"
	rel="stylesheet">
<link href="/h72/resources/css/order.css" type="text/css"
	rel="stylesheet">

<title>Order</title>
<style>
.main_line2 .main_cate #main_cateIdx1 {
    margin-left: 0px;
}
</style>
<script>
$(document).ready(function(){
	
	$("input[name=addr_paymethod]:checked").each(function(){
		$("#payment_input_tcash").each(function() {
			$(this).css('display', 'none');
		});
	});
	
$("input[name=addr_paymethod]").change(function(){
	var radioValue = $(this).val();
	var paylabel = $(this).next("label").text();
	console.log(paylabel);
	
	if (radioValue == "cash") {
		hideExclude('payment_input_cash', paylabel);
	} else if (radioValue == "cell") {
		hideExclude('pg_paymethod_info_pg', paylabel);
	} else if (radioValue == "tcash") {
		hideExclude('payment_input_tcash', paylabel);
	}	else if (radioValue == "card") {
			hideExclude('pg_paymethod_info_pg', paylabel);
	}	
});


function hideExclude(excludeId ,paylabel) {
	console.log(paylabel);
	$("#payment_input_cash").each(function() {
		$(this).css('display', 'none');
	});
	
	$("#payment_input_tcash").each(function() {
		$(this).css('display', 'none');
	});
	// 파라미터로 넘겨 받은 id 요소는 show
	$("#" + excludeId).css('display','table');
	
	$('#current_pay_name').text(paylabel);
	/* <strong id="current_pay_name">무통장 입금</strong> */
}

/*  $('#oemail3').change(function(){
	var option = $(this).val();
	console.log(option);
	$('#oemail2').text(option);
	$('#inputId').attr('readonly', true);
});
  */
  
  

});


function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
							&& /[동|로|가]$/g
									.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName
								: data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' ('
								+ extraRoadAddr
								+ ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document
							.getElementById('rpostnum').value = data.zonecode; //5자리 새우편번호 사용
					document
							.getElementById('raddress').value = fullRoadAddr;

					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if (data.autoRoadAddress) {
						//예상되는 도로명 주소에 조합형 주소를 추가한다.
						var expRoadAddr = data.autoRoadAddress
								+ extraRoadAddr;
						document
								.getElementById('raddress').innerHTML = '(예상 도로명 주소 : '
								+ expRoadAddr
								+ ')';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						document
								.getElementById('raddress').innerHTML = '(예상 지번 주소 : '
								+ expJibunAddr
								+ ')';

					} else {
						document
								.getElementById('raddress').innerHTML = '';
					}
				}
			}).open();
}
</script>


</head>
<body id="main">

	<div id="content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp" />

		<c:if test="${!(loginUser eq null)}">
		<div id="order_contents_wrap">
			<div id="order_contents">
				<div class="order_titleArea">
					<h2>ORDER</h2>
				</div>
				<!-- 해택정보 -->
				<div class="xans-element- xans-order xans-order-form xans-record-">
					<div class="xans-element- xans-order xans-order-dcinfo  ">
						<h3>
							<strong><span>membership<br>benefit
							</span></strong>
						</h3>
						<div class="info">
							<div class="member">
								<p>
									<strong>${loginUser.name }</strong> 님은, [${loginUser.levelcode }] 회원이십니다.
								</p>
							</div>
							<div class="mileage">
								<span>가용적립금 : <strong>${loginUser.point }원</strong></span>
							</div>
						</div>
					</div>


					<ul class="controlInfo">
						<li>상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
					</ul>
					<!-- 배송상품 주문 내역  -->
					<div class="orderListArea ">
						<div class="title">
							<h3>국내배송상품 주문내역</h3>
							<p class="button">
								<a href="javascript:window.history.back();"
									style="padding: 4px 12px 4px 12px; line-height: 24px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; font-size: 11px;">이전페이지</a>
							</p>
						</div>

						<!-- 기본배송 -->
						<div class="boardList ">
							<table border="1" summary="">
								<thead>
									<tr>
										<!-- <th scope="col" class="chk displaynone"><input
										type="checkbox"
										onclick="EC_SHOP_FRONT_ORDERFORM_PRODUCT.proc.setCheckOrderList('chk_order_cancel_list_basic', this);"
										disabled=""></th> -->
										<th scope="col" class="thumb">이미지</th>
										<th scope="col" class="product">상품정보</th>
										<th scope="col" class="price">판매가</th>
										<th scope="col" class="quantity">수량</th>
										<th scope="col" class="mileage">적립금</th>
										<th scope="col" class="delivery">배송구분</th>
										<th scope="col" class="charge">배송비</th>
										<th scope="col" class="total">합계</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<c:forEach items="${olist}" var="cartOrder">
										<c:set var="result" value="${(cartOrder.quantity*cartOrder.cost)+result}" />
										</c:forEach>	
										<td colspan="9"><strong class="type">[기본배송]</strong>
											상품구매금액 <strong><fmt:formatNumber value="${result}" pattern="#,###" /><span class="displaynone">
													(0)</span></strong> + 배송비 2,500 = 합계 : 
													<strong class="total">
													<span><fmt:formatNumber value="${result+2500}" pattern="#,###" />
													</span>원</strong>
											<span class="displaynone"></span></td>
										
									</tr>
								</tfoot>
								
								<tbody class="xans-element- xans-order xans-order-normallist">
								<c:forEach items="${olist}" var="cartOrder">
									<tr class="xans-record-">
										<td class="thumb"><a
											href="/product/detail.html?product_no=8112&amp;cate_no=28"><img
												src="/h72/resources${cartOrder.mainImg }" alt=""></a></td>
										<td class="product"><a
											href="/product/detail.html?product_no=8112&amp;cate_no=28"><strong>${cartOrder.itemFullName }</strong></a>
										<td class="price">
											<div class="">
												<strong>${cartOrder.cost }</strong>
											</div>
										</td>
										<td class="quantity">${cartOrder.quantity }</td>
										<td class="mileage"><input
											id="product_mileage_all_8112_000A" name="product_mileage_all"
											value="160" type="hidden"><span class="mileage_icon">적</span>&nbsp;
											<fmt:formatNumber value="${(loginUser.pointRate/100)*cartOrder.cost }" pattern="#,###"/>원</td>
										<td class="delivery">기본배송</td>
										<td class="charge">[조건]</td>
										<td class="total"><strong><fmt:formatNumber value="${cartOrder.quantity*cartOrder.cost}" pattern="#,###" />원</strong>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>
					<ul class="controlInfo typeBtm">
						<li>상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
					</ul>
					<!-- 이전페이지 이동 -->
					<div class="btnArea">
						<a href="javascript:window.history.back();"
							style="padding: 4px 12px 4px 12px; line-height: 24px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; font-size: 11px;">이전페이지</a>
					</div>

					<!-- 주문자 정보 -->
					<div class="orderArea">
						<div class="title">
							<h3>주문자 정보</h3>
							<p class="required">
								<span class="star">*</span> 필수입력사항
							</p>
						</div>
						<div class="boardWrite">
							<table border="1" summary="">
								<!-- 국문 쇼핑몰 -->
								<tbody class="address_form ">
									<tr>
										<th scope="row">주문하시는 분 <span class="star">*</span></th>
										<td><input id="oname" name="oname" value="${loginUser.name }" class="inputTypeText" size="15"
											value="" type="text"></td>
									</tr>
									<tr>
										<th scope="row">주소 <span class="star">*</span></th>
										<td><input id="postnum" name="postnum" class="inputTypeText" size="6" maxlength="6" readonly="readonly"
											value="${loginUser.postnum }" type="text"> 
											<br>
											<input id="address" name="address" class="inputTypeText" size="40"
											readonly="1" value="${loginUser.address }" type="text"> <span class="grid">기본주소</span><br>
											<input id="addressDetail" name="addressDetail" class="inputTypeText" size="40"
											value="${loginUser.addressdetail }" type="text"> <span class="grid">나머지주소</span>
										</td>
									</tr>
									<tr>
									<c:set var="tempPhone" value="${loginUser.phone }"/>
									<c:set var="phoneF" value="${fn:substring(tempPhone, 0, tempPhone.indexOf('-'))}" />
									<c:set var="phoneM" value="${fn:substring(tempPhone, tempPhone.indexOf('-')+1, tempPhone.lastIndexOf('-'))}" />
									<c:set var="phoneL" value="${fn:substring(tempPhone, tempPhone.lastIndexOf('-')+1, tempPhone.length()) }" />
										<th scope="row">휴대전화</th>
										<td><select id="ophone2_1" name="ophone2_[]">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
										</select>-<input id="ophone2_2" name="ophone2_[]" maxlength="4"
											size="4" value="${phoneM }" type="text">-<input
											id="ophone2_3" name="ophone2_[]" maxlength="4"
											size="4" value="${phoneL }" type="text"></td>
									</tr>
									
								</tbody>

							</table>
						</div>
					</div>


					<!-- 배송지 정보  -->
					<div class="orderArea ">
						<div class="title">
							<h3>배송지 정보</h3>
							<p class="required">
								<span class="star">*</span> 필수입력사항
							</p>
						</div>
						<div class="boardWrite">
							<table border="1" summary="">
								<tbody>
									<tr>
										<th scope="row">배송지 선택</th>
										<td>
											<div class="address">
												<input id="sameaddr0" name="sameaddr" value="T" type="radio"><label
													for="sameaddr0">주문자 정보와 동일</label> <input id="sameaddr1"
													name="sameaddr" value="F" type="radio"><label for="sameaddr1">새로운배송지</label>
												
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">받으시는 분 <span class="star">*</span></th>
										<td><input id="rname" name="rname" class="inputTypeText" size="15"
											value="" type="text"></td>
									</tr>
									<tr>
										<th scope="row">주소 <span class="star">*</span></th>
										<td><input id="rpostnum" name="rpostnum" class="inputTypeText" size="6" maxlength="6" readonly="1"
											value="" type="text"> - <input id="rzipcode2"
											name="rzipcode2" class="inputTypeText" size="6" maxlength="6" readonly="1"
											value="" type="text" style="display: none;"> 
											<input type="button" id="search_ozipcode" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
											<input id="raddress" name="raddress" class="inputTypeText" size="40"
											value="" readonly type="text"> <span class="grid">기본주소</span><br>
											<input id="raddressDetail" name="raddressDetail" class="inputTypeText" size="40"
											value="" type="text"> <span class="grid">나머지주소</span>
										</td>
									</tr>
									<tr>
										<th scope="row">일반전화 <span class="star">*</span></th>
										<td><select id="rphone1_1" name="rphone1_[]"
											fw-filter="isNumber&amp;isFill" fw-label="수취자 전화번호"
											fw-alone="N" fw-msg="">
												<option value="02">02</option>
												<option value="031">031</option>
												<option value="032">032</option>
												<option value="033">033</option>
												<option value="041">041</option>
												<option value="042">042</option>
												<option value="043">043</option>
												<option value="044">044</option>
												<option value="051">051</option>
												<option value="052">052</option>
												<option value="053">053</option>
												<option value="054">054</option>
												<option value="055">055</option>
												<option value="061">061</option>
												<option value="062">062</option>
												<option value="063">063</option>
												<option value="064">064</option>
												<option value="0502">0502</option>
												<option value="0503">0503</option>
												<option value="0504">0504</option>
												<option value="0505">0505</option>
												<option value="0506">0506</option>
												<option value="0507">0507</option>
												<option value="070">070</option>
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
										</select>-<input id="rphone1_2" name="rphone1_[]" maxlength="4"
											fw-filter="isNumber&amp;isFill" fw-label="수취자 전화번호"
											fw-alone="N" fw-msg="" size="4" value="" type="text">-<input
											id="rphone1_3" name="rphone1_[]" maxlength="4"
											fw-filter="isNumber&amp;isFill" fw-label="수취자 전화번호"
											fw-alone="N" fw-msg="" size="4" value="" type="text"></td>
									</tr>
									<tr>
										<th scope="row">휴대전화</th>
										<td><select id="rphone2_1" name="rphone2_[]"
											fw-filter="isNumber" fw-label="수취자 핸드폰번호" fw-alone="N"
											fw-msg="">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
										</select>-<input id="rphone2_2" name="rphone2_[]" maxlength="4"
											fw-filter="isNumber" fw-label="수취자 핸드폰번호" fw-alone="N"
											fw-msg="" size="4" value="" type="text">-<input
											id="rphone2_3" name="rphone2_[]" maxlength="4"
											fw-filter="isNumber" fw-label="수취자 핸드폰번호" fw-alone="N"
											fw-msg="" size="4" value="" type="text"></td>
									</tr>
									<tr>
										<th scope="row">배송메시지</th>
										<td><textarea id="omessage" name="omessage" fw-filter=""
												fw-label="배송 메세지" fw-msg="" maxlength="255" cols="70"></textarea>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>

					<!-- 결제예정 금액 -->

					<div class="title">
						<h3>결제 예정 금액</h3>
					</div>

					<div class="totalArea">
						<div class="summary">
							<table border="1" summary="">
								<thead>
									<tr>
										<th scope="col"><span>총 주문 금액</span></th>
										<th scope="col" class=""><span>총 </span><span
											id="total_addsale_text" class="">할인</span><span
											id="plus_mark" class=""> + </span><span
											id="total_addpay_text" class="">부가결제</span><span> 금액</span></th>
										<th scope="col">총 결제예정 금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="price"><div class="box">
												<strong id="total_order_price_view">57,300</strong>원 <span
													class="tail displaynone"><span
													id="total_order_price_ref_view" class="tail"></span></span>
											</div></td>
										<td class="option "><div class="box">
												<strong>-</strong><strong id="total_sale_price_view">0</strong>원
												<span class="tail displaynone"><span
													id="total_sale_price_ref_view" class="tail"></span></span>
											</div></td>
										<td class="total"><div class="box">
												<strong>=</strong><strong id="total_order_sale_price_view">57,300</strong>원
												<span class="tail displaynone"><span
													id="total_order_sale_price_ref_view" class="tail"></span></span>
											</div></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="detail">
							<div class="">
								<table border="1" summary="" class="option">
									<tbody>
										<tr class="total">
											<th scope="row">총 부가결제금액</th>
											<td><strong id="total_addpay_price_view">0</strong>원</td>
										</tr>
									</tbody>
									<!-- 적립금 -->
									<tbody class="">
										<tr>
											<th scope="row">적립금</th>
											<td>
												<p>
													<input id="input_mile" name="input_mile" fw-filter=""
														fw-label="적립금" fw-msg="" class="inputTypeText" size="10"
														value="" type="text"> 원 (총 사용가능 적립금 : <strong
														class="point">0</strong>원)
												</p>
												<ul class="info">
													<li>적립금은 최소 5,000 이상일 때 결제가 가능합니다.</li>
													<li id="mileage_max_unlimit" class="">최대 사용금액은 제한이
														없습니다.</li>
													<li id="mileage_max_limit" class="displaynone">1회 구매시
														적립금 최대 사용금액은 입니다.</li>
													<li>적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을
														누르면 주문이 완료됩니다.</li>
													<li id="mileage_shipfee" class="displaynone">적립금 사용 시
														배송비는 적립금으로 사용 할 수 없습니다.</li>
													<li id="mileage_exception" class="displaynone">적립금 사용
														시 해당 상품에 대한 적립금은 적립되지 않습니다.</li>
												</ul>
											</td>
										</tr>
									</tbody>


								</table>
							</div>
						</div>
					</div>


					<!-- 결제 수단 -->
					<div class="payArea">
						<div class="payment">
							<div class="method">
								<span class="ec-base-label"><input id="addr_paymethod0"
									name="addr_paymethod" value="cash" type="radio" checked="checked"><label
									for="addr_paymethod0">무통장 입금</label></span> <span
									class="ec-base-label"><input id="addr_paymethod1"
									name="addr_paymethod" value="card" type="radio"><label
									for="addr_paymethod1">카드 결제</label></span> <span class="ec-base-label"><input
									id="addr_paymethod2" name="addr_paymethod" value="cell" type="radio"><label
									for="addr_paymethod2">휴대폰 결제</label></span> <span
									class="ec-base-label"><input id="addr_paymethod3"
									name="addr_paymethod" value="tcash" type="radio"><label
									for="addr_paymethod3">에스크로(실시간 계좌이체)</label></span>
							</div>

							<div class="info">
								<!-- 무통장입금 -->
								<table border="1" summary="" id="payment_input_cash" style="display:table">
									<tbody>
										<tr>
											<th scope="row">입금자명</th>
											<td><input id="pname" name="pname" fw-filter=""
												fw-label="무통장 입금자명" fw-msg="" class="inputTypeText"
												size="15" maxlength="20" value="" type="text"></td>
										</tr>
										<tr>
											<th scope="row">입금은행</th>
											<td><select id="bankaccount" name="bankaccount"
												fw-filter="" fw-label="무통장 입금은행" fw-msg="">
													<option value="-1">::: 입금은행 선택 :::</option>
													<option
														value="bank_04:03900104245260:(주)어나더무드:국민은행:www.kbstar.com">국민은행:00112233445566
														(주)살아남조</option>
													<option
														value="bank_11:3550013731443:(주)어나더무드:농협중앙회:banking.nonghyup.com">농협중앙회:3111234123123
														(주)살아남조</option>
													<option
														value="bank_20:1005501934183:(주)어나더무드:우리은행:www.wooribank.com">우리은행:1234567890000
														(주)살아남조</option>
													<option
														value="bank_26:100027696470:(주)어나더무드:신한은행:www.shinhan.com">신한은행:123412312345
														(주)살아남조</option>
													<option
														value="bank_71:01391201008686:(주)어나더무드:우체국:www.epostbank.go.kr">우체국:01111111111112
														(주)살아남조</option>
													<option
														value="bank_81:23491001101104:(주)어나더무드:KEB하나은행:www.hanabank.com">KEB하나은행:88888888888888
														(주)살아남조</option>
											</select>
												<p class="grid ">
													<a href="#none" id="btn_bank_go"><img
														src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_bank.gif"
														alt="은행사이트 바로가기"></a>
												</p></td>
										</tr>
									</tbody>
								</table>
								<!-- 실시간 계좌이체 -->
								<table border="1" summary="" id="payment_input_tcash">
									<tbody>
										<tr>
											<th scope="row">예금주명</th>
											<td><input id="allat_account_nm" name="allat_account_nm"
												fw-filter="" fw-label="무통장 입금자명" fw-msg=""
												class="inputTypeText" size="26" maxlength="30" value=""
												type="text"></td>
										</tr>
										<tr>
											<th scope="row"></th>
											<td><input type="checkbox" name="flagEscrowUse"
												id="flagEscrowUse0" value="T"><label
												for="flagEscrowUse0"> 에스크로(구매안전)서비스를 적용합니다.</label></td>
										</tr>
									</tbody>
								</table>
								
								<!-- 무통장입금, 카드결제, 휴대폰결제, 실시간계좌이체 -->
								<div id="pg_paymethod_info" class="payHelp"
									style="display: block;">
									<p id="pg_paymethod_info_shipfee">최소 결제 가능 금액은 결제금액에서 배송비를
										제외한 금액입니다.</p>
									<p id="pg_paymethod_info_pg">소액 결제의
										경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
								</div>
							</div>
             
							
						</div>

						<!-- 최종결제금액 -->
						<div class="total">
							<h4>
								<strong id="current_pay_name">무통장 입금</strong> <span>최종결제
									금액</span>
							</h4>
							<p class="price">
								<span></span><input id="total_price" name="total_price"
									fw-filter="isFill" fw-label="결제금액" fw-msg=""
									class="inputTypeText"
									style="text-align: right; ime-mode: disabled; clear: none; border: 0px; float: none;"
									size="10" readonly="1" value="11400" type="text"><span>원</span>
							</p>
							<p class="paymentAgree" id="chk_purchase_agreement"
								style="display: block;">
								<input id="chk_purchase_agreement0"
									name="chk_purchase_agreement" fw-filter="" fw-label="구매진행 동의"
									fw-msg="" value="T" type="checkbox" style="display: block;"><label
									for="chk_purchase_agreement0">결제정보를 확인하였으며, 구매진행에
									동의합니다.</label>
							</p>
							<div class="button">
								<a href="#none"><!-- <img
									src="/web/upload/sunny/images/btn_payment.png" id="btn_payment"
									alt="결제하기"> -->
								<div class="btn_payment">결제하기</div>
								</a>
							</div>
							<div class="mileage">
								<p>
									<strong>총 적립예정금액</strong><span id="mAllMileageSum"
										style="display: block;">90원</span>
								</p>
								<ul>
									<li><strong>회원 적립금</strong><span id="mMemberMileage">0원</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<p><br><br><br><br></p>

				</div>
			</div>
		</div>
		</c:if>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>