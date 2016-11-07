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
<script type="text/javascript" src="/h72/resources/js/order.js"></script>
<script type="text/javascript" src="/h72/resources/js/iamport.payment-1.1.1.js"></script>
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
<script type="text/javascript">
$(function(){
	//결제 부분
	$("input[name=addr_paymethod]:checked").each(function(){
		$("#payment_input_tcash").each(function() {
			$(this).css('display', 'none');
		});
	});
	
/* $("input[name=addr_paymethod]").change(function(){
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
}); */
	
});

function hideExclude(excludeId) {
	$("#payment_input_cash").each(function() {
		$(this).css('display', 'none');
	});
	
	$("#payment_input_tcash").each(function() {
		$(this).css('display', 'none');
	});
	// 파라미터로 넘겨 받은 id 요소는 show
	$("#" + excludeId).css('display','table');
}


var payMethod = "vbank";

function setPayMethod(payment){
	payMethod = payment;
	
	var paylabel = $('#paymethod_'+payment).next("label").text();
	$('#current_pay_name').text(paylabel);
	
	if (payment == "vbank") {
		hideExclude('payment_input_cash');
	} else if (payment == "phone") {
		hideExclude('pg_paymethod_info_pg');
	} else if (payment == "trans") {
		hideExclude('payment_input_tcash');
	}	else if (payment == "card") {
			hideExclude('pg_paymethod_info_pg');
	}	
	
}


function paymentSubmit(){
	var orderName = $('#rname').val();
	var orderAddress = $('#raddress').val();
	var orderAddressDetail=$('#raddressDetail').val();
	var orderPost = $('#rpostnum').val();
	var orderPhone = $('rphone2_1').val()+"-"+$('rphone2_2').val()+"-"+$('rphone2_3').val();
	
	if($('#chk_purchase_agreement0').is(':checked') != true){
		
		alert('결제정보 및 구매진행 동의에 체크해주세요.');
		
	}else if(orderName == "" || orderAddress=="" ||orderAddressDetail==""|| orderPost == "" || orderPhone == ""){
		alert('배송지 정보 필수입력사항을 입력해주세요.');
	}else{
		CallpaymentAPI();
	}
	
}

function CallpaymentAPI(){
	orderTitle = '${olist.get(0).getItemFullName()}'+'외 ${olist.size()}개';
	totalPrice = $('#totalPrice').val();
	orderName = $('#rname').val();
	orderAddress = $('#raddress').val()+$('#raddressDetail').val();
	orderPost = $('#rpostnum').val();
	orderPhone = $('rphone2_1').val()+"-"+$('rphone2_2').val()+"-"+$('rphone2_3').val();

	var IMP = window.IMP; // 생략가능
	IMP.init('imp29445119'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	IMP.request_pay({
	    pg : 'uplus', // 결제회사 결정
	    pay_method : payMethod, // 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
	    merchant_uid : 'merchant_' + new Date().getTime(), //가맹점에서 생성/관리하는 고유 주문번호, 결제가 된 적이 있는 merchant_uid로는 재결제 불가
	    name : orderTitle,
	    amount : totalPrice,
	    buyer_name : orderName,
	    buyer_tel : orderPhone,
	    buyer_addr : orderAddress,
	    buyer_postcode : orderPost,
	}, function(rsp) {
	    if ( rsp.success ) {
	    	$("#orderForm").submit();
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	    	var msg = '결제를 취소하셨습니다.';
	        //var msg = '결제에 실패하였습니다.';
	        //msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
	
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
									<strong>${loginUser.name }</strong> 님은, <strong>[${loginUser.levelcode }]</strong> 회원이십니다.
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
					<form action="/h72/insertOrder" method="post" id="orderForm">
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
											상품구매금액 <strong><fmt:formatNumber value="${result}" pattern="#,###" /></strong> + 배송비 2,500 = 합계 : 
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
											<input type="button" id="search_ozipcode" onclick="sample5_execDaumPostcode()" value="우편번호"><br>
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
										<td><select id="ophone2_1" name="ophone2">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
												<script>
				$(function(){
					$('#ophone2_1').val('${phoneF}').prop("selected", true);
				});
				</script>
										</select>-<input id="ophone2_2" name="ophone2" maxlength="4"
											size="4" value="${phoneM }" type="text">-<input
											id="ophone2_3" name="ophone2" maxlength="4"
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
												<input id="sameaddr0" name="sameaddr" value="T" type="radio" checked="checked"><label
													for="sameaddr0">주문자 정보와 동일</label> <input id="sameaddr1"
													name="sameaddr" value="F" type="radio"><label for="sameaddr1">새로운배송지</label>
												
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">받으시는 분 <span class="star">*</span></th>
										<td><input id="rname" name="rname" class="inputTypeText" size="15"
											value="" type="text" required></td>
									</tr>
									<tr>
										<th scope="row">주소 <span class="star">*</span></th>
										<td><input id="rpostnum" name="rpostnum" class="inputTypeText" size="6" maxlength="6" readonly="1"
											value="" type="text">
											<input type="button" id="search_ozipcode" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
											<input id="raddress" name="raddress" class="inputTypeText" size="40"
											value="" readonly type="text"> <span class="grid">기본주소</span><br>
											<input id="raddressDetail" name="raddressDetail" class="inputTypeText" size="40"
											value="" type="text" required> <span class="grid">나머지주소</span>
										</td>
									</tr>
									<tr>
										<th scope="row">휴대전화 <span class="star">*</span></th>
										<td><select id="rphone2_1" name="rphone2">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
										</select>-<input id="rphone2_2" name="rphone2" maxlength="4"
											 size="4" value="" type="text" required>-<input
											id="rphone2_3" name="rphone2" maxlength="4"
											size="4" value="" type="text" required></td>
									</tr>
									<tr>
										<th scope="row">배송메시지</th>
										<td><textarea id="omessage" name="omessage" maxlength="255" cols="70"></textarea>
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
										<th scope="col" class=""><span>적립금 사용 금액 </span></th>
										<th scope="col">총 결제예정 금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="price"><div class="box">
												<strong id="total_order_price_view"><fmt:formatNumber value="${result+2500}" pattern="#,###" /></strong>원 <span
													class="tail displaynone"><span
													id="total_order_price_ref_view" class="tail"></span></span>
											</div></td>
										<td class="option "><div class="box">
												<strong>-</strong><strong id="total_sale_price_view">0</strong>원
												<span class="tail displaynone"><span
													id="total_sale_price_ref_view" class="tail"></span></span>
											</div></td>
										<td class="total"><div class="box">
												<strong>= </strong><strong id="total_order_sale_price_view">
												<fmt:formatNumber value="${result+2500}" pattern="#,###" type="number" /></strong>원
												<script>
	$(function(){
		
		$('.input_mile').change(function() {
			var mile = $(this).val();
			var point = ${loginUser.point };
				console.log(point);
				
			if(mile <= point){	
		    console.log(mile);
		    $('strong#total_sale_price_view').text(mile).trigger('change');
		    var total = ${result+2500};
		    console.log(total);
		    $('strong#total_order_sale_price_view').text(formatNumber(total-mile));
		    $('#totalPrice').attr('value', total-mile);
		    $('#total_price').text(formatNumber(total-mile));
			}else{
				$('strong#total_sale_price_view').text("0");
				var total = ${result+2500};
			    console.log(total);
			    $('strong#total_order_sale_price_view').text(formatNumber(total));
			    $('#totalPrice').attr('value', total);
			    $('#total_price').text(formatNumber(total));
			}
		});
		
		function formatNumber (num) {
		    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
		}

	});
</script>
											</div></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="detail">
							<div class="">
								<table border="1" summary="" class="option">
									
									<!-- 적립금 -->
									<tbody class="">
										<tr>
											<th scope="row">적립금</th>
											<td>
												<p>
													<c:if test="${loginUser.point < 2000}">
													<input id="input_mile" name="input_mile" class="inputTypeText" size="10"
														value="" type="text" readonly="readnonly">
														</c:if>
													<c:if test="${loginUser.point >= 2000}">
													<input id="input_mile" class="input_mile" name="input_mile" class="inputTypeText" 
														value="" type="text" maxlength="${loginUser.point }" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'/>
														<script>
		function onlyNumber(event){
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
				return;
			else
				return false;
		}
		function removeChar(event) {
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.keyCode;
			if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39){
				
				return;
			}
			else{
				event.target.value = event.target.value.replace(/[^0-9]/g, "");
	        }
			
			var point = ${loginUser.point };
			var mile = $('.input_mile').val();
		    if($('.input_mile').val() > point) {
		    	alert("사용가능 적립금보다 사용금액이 많습니다.\n다시 입력해 주세요");
	        }
		}
	</script>
													
													</c:if> 원 (총 사용가능 적립금 : <strong
														class="point">${loginUser.point }</strong>원)
												</p>
												<ul class="info">
													<li>적립금은 최소 2,000 이상일 때 결제가 가능합니다.</li>
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
								<span class="ec-base-label">
								<input id="paymethod_vbank" name="addr_paymethod" value="vbank" type="radio" checked="checked" onclick="setPayMethod('vbank');">
								<label for="paymethod_vbank">무통장 입금</label></span> 
								<span class="ec-base-label"><input id="paymethod_card" name="addr_paymethod" value="card" type="radio" onclick="setPayMethod('card');"><label
									for="paymethod_card">카드 결제</label></span> 
								<span class="ec-base-label"><input id="paymethod_phone" name="addr_paymethod" value="phone" type="radio" onclick="setPayMethod('phone');"><label
									for="paymethod_phone">휴대폰 결제</label></span> 
								<span class="ec-base-label"><input id="paymethod_trans" name="addr_paymethod" value="trans" type="radio" onclick="setPayMethod('trans');"><label
									for="paymethod_trans">실시간 계좌이체</label></span>
							</div>

							<div class="info">
								<!-- 무통장입금 -->
								<table border="1" summary="" id="payment_input_cash" style="display:table">
									<tbody>
										<tr>
											<th scope="row">입금자명</th>
											<td><input id="pname" name="pname" class="inputTypeText"
												size="15" maxlength="20" value="" type="text"></td>
										</tr>
										<tr>
											<th scope="row">입금은행</th>
											<td><select id="bankaccount" name="bankaccount">
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
												class="inputTypeText" size="26" maxlength="30" value=""
												type="text"></td>
										</tr>
										<tr>
											<th scope="row"></th>
											<td><input type="checkbox" name="flagEscrowUse"
												id="flagEscrowUse0" value="T"><label
												for="flagEscrowUse0"> 구매안전 서비스를 적용합니다.</label></td>
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
								<input id= totalPrice name ="totalPrice" value="${result+2500 }" type="hidden"/>
								<%-- <input id="total_price" name="total_price"
									class="inputTypeText"
									style="text-align: right; clear: none; border: 0px; float: none;"
									size="10" readonly="1" value="${result+2500 }" type="text"> --%>
								<span id="total_price">
								<fmt:formatNumber value="${result+2500}" pattern="#,###" type="number" /></span>
								<span>원</span>
							</p>
							<p class="paymentAgree" id="chk_purchase_agreement"
								style="display: block;">
								<input id="chk_purchase_agreement0"
									name="chk_purchase_agreement" value="T" type="checkbox" style="display: block;"><label
									for="chk_purchase_agreement0">결제정보를 확인하였으며, 구매진행에
									동의합니다.</label>
							</p>
							<div class="button">
								<a href="#none">
								<span class="btn_payment" onclick="paymentSubmit();">결제하기</span>
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
					</form>
					<p><br><br><br><br></p>

				</div>
			</div>
		</div>
		</c:if>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>