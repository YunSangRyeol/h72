<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="/h72/resources/css/cart.css" type="text/css"
	rel="stylesheet">
<title>Shopping_cart</title>
</head>
<body id="main">
	
	<div id="content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp" />
	

	<div id="order_contents_wrap">
		<div id="order_contents">
			<div class="order_titleArea">
				<h2>SHOPPING CART</h2>
			</div>


			<div class="xans-element- xans-order xans-order-basketpackage ">
				<!-- 혜택정보 -->
				<!-- 장바구니 비어있을 때 -->
				<div class="xans-element- xans-order xans-order-empty ">
					<p>장바구니가 비어 있습니다.</p>
				</div>
				<!-- 할인금액 노출 : 삭제 시 할인금액이 노출되지 않습니다.-->
				<!-- 일반상품 -->
				<div class="orderListArea">

					<!-- 일반상품 (기본배송) -->
					<!-- 일반상품 (업체기본배송) -->
					<!-- 일반상품 (개별배송) -->
					<!-- 일반상품 (해외배송) -->
					<table border="1" summary=""
						class="xans-element- xans-order xans-order-normnormal boardList xans-record-">
						
						<thead>
							<tr>
								<th scope="col" class="chk"><input type="checkbox"
									onclick="Basket.setCheckBasketList('basket_product_normal_type_normal', this);"></th>
								<th scope="col" class="thumb">이미지</th>
								<th scope="col" class="product">상품정보</th>
								<th scope="col" class="price">판매가</th>
								<th scope="col" class="quantity">수량</th>
								<th scope="col" class="mileage">적립금</th>
								<th scope="col" class="delivery">배송구분</th>
								<th scope="col" class="charge">배송비</th>
								<th scope="col" class="total">합계</th>
								<th scope="col" class="button">선택</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td colspan="10"><strong class="type">[기본배송]</strong>
									상품구매금액 <strong>13,500</strong><span
									class="displaynone"> </span> + 배송비 2,500<span
									class="displaynone"> </span> = 합계 : <strong class="total"><span>16,000</span>원</strong>
									<span class="displaynone"> </span></td>
							</tr>
						</tfoot>
						<tbody class="xans-element- xans-order xans-order-list">
							<tr class="xans-record-">
								<td><input type="checkbox" id="basket_chk_id_0"
									name="basket_product_normal_type_normal"></td>
								<td class="thumb"><a href="#"><div class="itemImg"></div></a></td>
								<td class="product"><a href="#"><strong>재난 무선 라디오</strong> </a>
									<ul
										class="xans-element- xans-order xans-order-optionall option">
										<li class="xans-record-">[옵션: ]</li>
									</ul></td>
								<td class="price">
									<div class="">
										<strong>13,500원</strong>
										<p class="displaynone"></p>
									</div>
								</td>
								<td class="quantity"><span class="quantity"><input
										id="quantity_id_0" name="quantity_name_0" size="2" value="1"
										type="text"><a href="javascript:;"
										onclick="Basket.addQuantityShortcut('quantity_id_0', 0);"><img
											src="/h72/resources/image/btn_quantity_up.gif"
											alt="증가" class="QuantityUp"></a><a href="javascript:;"
										onclick="Basket.outQuantityShortcut('quantity_id_0', 0);"><img
											src="/h72/resources/image/btn_quantity_down.gif"
											alt="감소" class="QuantityDown"></a></span> <a href="javascript:;"
									onclick="Basket.modifyQuantity()"><!-- <img
										src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_modify.gif"
										alt="변경"> -->
										<span class="QuantityModify">변경</span>
										</a></td>
								<td class="mileage">-</td>
								<td class="delivery">기본배송
									<div class="displaynone">(해외배송가능)</div>
								</td>
								<td>
									<p class="">
										2,500원<br>
									</p>조건
								</td>
								<td class="total"><strong>13,500원</strong>
									<div class="displaynone"></div></td>
								<td class="button"><a href="javascript:;"
									onclick="Basket.orderBasketItem(0);"
									style="padding: 3px 7px 3px 7px; line-height: 25px; background: #000; border: 1px solid #000; color: #fff; font-size: 11px;">주문하기</a><br>
								<br> <a href="javascript:;"
									onclick="Basket.deleteBasketItem(0);"
									style="padding: 3px 7px 3px 7px; line-height: 25px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; font-size: 11px;">삭제하기</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 무이자상품 -->
				<div class="orderListArea">

					<!-- 무이자상품 (기본배송)-->
					<!-- 무이자상품 (개별배송)-->
					<!-- 무이자상품 (해외배송) -->
				</div>
				<!-- 무이자할부 정보 (카드이미지 등) -->
				<!-- 선택상품 제어 버튼 -->
				<div class="xans-element- xans-order xans-order-selectorder ">
					<span class="left"> <strong class="ctrlTxt">선택상품을</strong> <a
						href="#none" onclick="Basket.deleteBasket()"
						style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; font-size: 11px;">삭제하기</a>
					</span> <a href="#none" onclick="Basket.emptyBasket()"
						style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; font-size: 11px;">장바구니비우기</a>
				</div>
				<!-- 총 주문금액 : 국내배송상품 -->
				<div class="xans-element- xans-order xans-order-totalsummary  ">
					<table border="1" summary="">
						<thead>
							<tr>
								<th scope="col"><span>총 상품금액</span></th>
								<th scope="col">총 배송비</th>
								<th scope="col">결제예정금액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="price"><div class="box">
										<strong>27,000</strong>원 <span class="tail displaynone"></span>
									</div></td>
								<td class="option"><div class="box">
										<strong> + </strong><strong>2,500</strong>원 <span
											class="tail displaynone"></span>
									</div></td>
								<td class="total"><div class="box">
										<strong> = </strong><strong>29,500</strong>원 <span
											class="tail displaynone"></span>
									</div></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 총 주문금액 : 해외배송상품 -->
				<!-- 주문 버튼 -->
				<div class="xans-element- xans-order xans-order-totalorder">
					<a href="<c:url value="/order/order"/>" onclick="Basket.orderAll(this)"
						link-order="/order/order.jsp?basket_type=all_buy"
						link-login="/member/login.html" class="order_total_btn ">전체상품주문</a>
					<a href="#none" onclick="Basket.orderSelectBasket(this)"
						link-order="/order/orderform.html?basket_type=all_buy"
						link-login="/member/login.html" class="order_select_btn">선택상품주문</a><span
						class="right"> <a href="/"
						style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; font-size: 11px;">쇼핑계속하기</a>
					</span>
					<!-- 네이버 체크아웃 구매 버튼  -->
					<div id="NaverChk_Button"></div>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>