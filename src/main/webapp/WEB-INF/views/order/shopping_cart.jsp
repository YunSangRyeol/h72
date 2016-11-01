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
<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="/h72/resources/js/cart.js"></script>		
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
				
					<!-- 장바구니 비어있을 때 -->
					<c:if test="${clist eq null}">
						<div class="xans-element- xans-order xans-order-empty ">
							<p>장바구니가 비어 있습니다.</p>
						</div>
					</c:if>
					
					<!-- 일반상품 -->
					<c:if test="${!(clist eq null)}">
						<div class="orderListArea">
							<!-- 일반상품  -->
							<table border="1" summary=""
								class="xans-element- xans-order xans-order-normnormal boardList xans-record-">
								<thead>
									<tr>
										<th scope="col" class="chk"><input type="checkbox" id="allCheck"></th>
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
										<td colspan="10">
											<c:forEach items="${clist}" var="cart">
											<c:set var="result" value="${(cart.quantity*cart.cost)+result}" />
											</c:forEach>
											<strong class="type">[기본배송]</strong>
											상품구매금액 <strong>${result}</strong> + 배송비 2,500 = 합계 : <strong
											class="total"><span>${result+2500}</span>원</strong> 
											
											</td>
									</tr>
								</tfoot>
								<tbody class="xans-element- xans-order xans-order-list">
				
									<c:forEach items="${clist}" var="cart" varStatus="cnt">
									<tr class="xans-record-">
										<td><input type="checkbox" id="basket_chk_${cnt.count}" value="${cart.cartid}"></td>
										<td class="thumb"><a href="#"><img src="/h72/resources${cart.mainImg }" class="itemImg"/></a></td>
										<td class="product"><a href="#"><strong>${cart.itemFullName}</strong> </a>
											<ul
												class="xans-element- xans-order xans-order-optionall option">
												<li class="xans-record-">[옵션:${cart.itemOptionName } ]</li>
											</ul></td>
										<td class="price">
											<div class="">
												<strong>${cart.cost }</strong>
											</div>
										</td>
										<td class="quantity">
										<!-- <form action="/h72/updateQuantity" method="get" id="quantity_${cnt.count}">
											<input type="hidden" value="${cart.itemid }" name="itemId"/>
										 -->
										<span class="quantity">
										<input type="hidden" value="${cart.itemid }" id="item_id_${cnt.count }" name="itemId"/>
										<input id="quantity_id_${cnt.count}" name="quantity_id_0" size="2" value="${cart.quantity}" type="text"/>
										<a href="javascript:;" onclick="addQuantityShortcut('quantity_id_${cnt.count}',${cnt.count});">
										<img src="/h72/resources/image/btn_quantity_up.gif" alt="증가" class="QuantityUp"></a>
										<a href="javascript:;" onclick="outQuantityShortcut('quantity_id_${cnt.count}',${cnt.count});">
										<img src="/h72/resources/image/btn_quantity_down.gif" alt="감소" class="QuantityDown"></a>
										</span> <a href="javascript:;" onclick="modifyQuantity(${cnt.count});">
												<span class="QuantityModify">변경</span>
										</a>
										<!--</form>  -->
										</td>
										<td class="mileage">-</td>
										<td class="delivery">기본배송
											<div class="displaynone">(해외배송가능)</div>
										</td>
										<td>
											<p class="">
												2,500원<br>
											</p>조건
										</td>
										<td class="total"><strong>${cart.cost*cart.quantity+2500}</strong></td>
										<td class="button"><a href="javascript:;"
											onclick="orderBasketItem(${cnt.count});"
											style="padding: 2px 7px 2px 7px; line-height: 0px; background: #000; border: 1px solid #000; color: #fff; font-size: 11px;">주문하기</a><br>
											<br> <a href="javascript:;"
											onclick="deleteBasketItem(${cnt.count});"
											style="padding: 2px 7px 2px 7px; line-height: 0px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; font-size: 11px;">삭제하기</a>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>

							<!-- 선택상품 제어 버튼 -->
							<div class="xans-element- xans-order xans-order-selectorder ">
								<span class="left"> <strong class="ctrlTxt">선택상품을</strong>
									<a href="#none" onclick="deleteBasket()"
									style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; font-size: 11px;">삭제하기</a>
								</span> <a href="#none" onclick="emptyBasket()"
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
													<strong>${result}</strong>원 <span class="tail displaynone"></span>
												</div></td>
											<td class="option"><div class="box">
													<strong> + </strong><strong>2,500</strong>원 <span
														class="tail displaynone"></span>
												</div></td>
											<td class="total"><div class="box">
													<strong> = </strong><strong>${result+2500}</strong>원 <span
														class="tail displaynone"></span>
												</div></td>
										</tr>
									</tbody>
								</table>
							</div>


						</div>
					</c:if>


					<!-- 주문 버튼 -->
					<div class="xans-element- xans-order xans-order-totalorder">
						<a href="<c:url value="/order/order"/>"
							onclick="Basket.orderAll(this)"
							link-order="/order/order.jsp?basket_type=all_buy"
							link-login="/member/login.html" class="order_total_btn ">전체상품주문</a>
						<a href="#none" onclick="Basket.orderSelectBasket(this)"
							link-order="/order/orderform.html?basket_type=all_buy"
							link-login="/member/login.html" class="order_select_btn">선택상품주문</a><span
							class="right"><a href="/h72"
							style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; font-size: 11px;">쇼핑계속하기</a>
						</span>
					</div>


					<!-- 이용안내 -->
					<div class="xans-element- xans-order xans-order-basketguide help ">
						<h3>HELP</h3>
						<div class="content">
							<h4>장바구니 이용안내</h4>
							<ul>
								<li><span class="num">- </span> 선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면
									됩니다.</li>
								<li><span class="num">- </span> [쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
							</ul>
							<h4>결제 이용안내</h4>
							<ul>
								<li><span class="num">- </span> [전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에
									대한 주문/결제가 이루어집니다.</li>
							</ul>
						</div>
					</div>

				</div>

			</div>
		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>
