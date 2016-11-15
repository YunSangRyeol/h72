<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ORDER DETAIL</title>
<link href="/h72/resources/css/cart.css" type="text/css"
	rel="stylesheet">
<link href="/h72/resources/css/order.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript" src="/h72/resources/js/orderList.js"></script>	

</head>
<body id="main">
	<div id="content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp" />


		<div id="order_contents_wrap">
			<div id="order_contents">
				<div class="order_titleArea">
					<h2>ORDER DETAIL</h2>
				</div>




				<div class="xans-element- xans-myshop xans-myshop-orderhistorydetail xans-record-">
				
					<!-- 주문정보 -->
					<div class="orderArea">
						<div class="title">
							<h3>주문정보</h3>
						</div>

						<div class="boardView">
							<table border="1" summary="">
								<tbody>
									<tr>
										<th scope="row">주문번호</th>
										<td>${detailOrder.orderNo }</td>
									</tr>
									<tr>
										<th scope="row">주문일자</th>
										<td>${detailOrder.enrollDate}</td>
									</tr>
									<tr>
										<th scope="row">주문자</th>
										<td><span>${loginUser.name }</span></td>
									</tr>
									<tr>
										<th scope="row">주문처리상태</th>
										<td>${detailOrder.orderStatus }&nbsp;&nbsp;<c:if test="${detailOrder.orderStatus eq '결제완료' || detailOrder.orderStatus eq '입금전'}">
									<a href="#none" onclick="orderChange('${detailOrder.orderNo}', '${detailOrder.orderStatus}','detail');">
									<span class="order_change">주문취소&nbsp;&nbsp;<span class="order_change_arrow">&gt;</span></span></a>
								</c:if>
								<c:if test="${detailOrder.orderStatus eq '배송중'}">
									<a href="우체국택배 http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=${detailOrder.transportNumber }">&nbsp;&nbsp;
										<span class="order_change">배송조회&nbsp;&nbsp;<span class="order_change_arrow">&gt;</span></span></a> &nbsp;&nbsp;
									<a href="#none" onclick="orderFinish('${detailOrder.orderNo}','${detailOrder.totalSavingPoint }','detail');">
									<span class="order_change">구매확정&nbsp;&nbsp;<span class="order_change_arrow">&gt;</span></span></a>	&nbsp;&nbsp;
									<%-- <a href="#none" onclick="orderRefund('${detailOrder.orderNo}');">
									<span class="order_change">반품요청&nbsp;&nbsp;<span class="order_change_arrow">&gt;</span></span></a>&nbsp;&nbsp; --%>
								</c:if>
								<c:if test="${detailOrder.orderStatus eq '구매완료'}">
									<a href="우체국택배 http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=${detailOrder.transportNumber }">&nbsp;&nbsp;
										<span class="order_change">배송조회&nbsp;&nbsp;<span class="order_change_arrow">&gt;</span></span></a>
								</c:if>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 결제정보 -->
					<div class="orderArea">
						<div class="title">
							<h3>결제정보</h3>
						</div>
						<div class="boardTotal summaryBtm">
							<table border="1" summary="">
								<tbody>
									<tr class="total first">
										<th scope="row">총 결제금액</th>
										<td><strong><fmt:formatNumber value="${detailOrder.totalPrice}" pattern="#,###" /></strong>원 
										</td>
									</tr>
									<tr class="">
										<th scope="row">결제수단</th>
										<td><strong><span>${detailOrder.paymentMethod }</span></strong>
											<p>
												<c:if test="${detailOrder.paymentMethod == '가상계좌 입금' }">
												<span>입금자 : ${bank.name }, 계좌번호 : ${bank.bank } ${bank.accountNum }
													</span> 
													</c:if>
											</p></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 주문 상품 정보 -->
					<div class="orderArea">
						<div class="title">
							<h3>주문 상품 정보</h3>
						</div>

						<!-- 기본배송 -->
						<table border="1" summary="" class="boardList ">
							<thead>
								<tr>
									<th scope="col" class="thumb">이미지</th>
									<th scope="col" class="product">상품정보</th>
									<th scope="col" class="quantity">수량</th>
									<th scope="col" class="price">상품구매금액</th>
									<th scope="col" class="delivery">배송구분</th>
									<th scope="col" class="state">주문처리상태</th>
									<th scope="col" class="service">취소/교환/반품</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
								<c:forEach items="${orderContents }" var ="oclist">
								<c:set var="result" value="${oclist.cost+ result }"/>
								</c:forEach>
									<td colspan="7"><strong class="type">[기본배송]</strong>
										상품구매금액 <strong><fmt:formatNumber value="${result}" pattern="#,###" /></strong>
										<c:if test="${result>=80000 }">
										+ 무료배송 +
										</c:if>
										<c:if test="${result<80000 }">
										+ 배송비 2,500 +
										</c:if>
										  = 합계 : <strong
										class="total"><span><fmt:formatNumber value="${detailOrder.totalPrice }" pattern="#,###" />원</span></strong> </td>
								</tr>
							</tfoot>
							<tbody class="xans-element- xans-myshop xans-myshop-orderhistorydetailbasic">
								<c:forEach items="${orderContents }" var ="oclist">
								<tr class="xans-record-">
									<td class="thumb"><a href="/h72/detail/selectItem?ItemDetailId=${oclist.itemDetailID }"><img
										src="/h72/resources${oclist.mainImg }" alt=""></a></td>
									<td class="product"><a
										href="/h72/detail/selectItem?ItemDetailId=${oclist.itemDetailID }"><strong>
												${oclist.itemName } </strong></a>
										<div class="option ">[옵션: ${oclist.itemOptionName }]</div>
										
									</td>
									<td class="quantity">${oclist.quantity }</td>
									<td class="price"><strong><fmt:formatNumber value="${oclist.cost}" pattern="#,###" />원</strong>
									<div class="displaynone"></div></td>
									<td class="delivery">기본배송
									</td>
									<td class="state">
										<p>${detailOrder.orderStatus }</p>
									</td>
									<td class="service">
								<p>-</p>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<!-- 환불정보 -->
					<!-- 추가결제 -->
					<!-- 배송지정보 -->
					<div class="orderArea">
						<div class="title">
							<h3>배송지정보</h3>
						</div>
						<div class="boardView">
							<table border="1" summary="">
								<tbody>
									<tr>
										<th scope="row">받으시는분</th>
										<td><span>${detailOrder.deleveryName }</span></td>
									</tr>
									<tr>
										<th scope="row">우편번호</th>
										<td><span>${detailOrder.postNum }</span></td>
									</tr>
									<tr>
										<th scope="row">주소</th>
										<td><span>${detailOrder.address }
												${detailOrder.addressDetail }</span></td>
									</tr>
									<tr>
										<th scope="row">일반전화</th>
										<td><span>${detailOrder.phone }</span></td>
									</tr>
									<tr>
										<th scope="row">배송메시지</th>
										<td><span>${detailOrder.deliveryMessage }</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="btnArea">
        <a href="<c:url value="/order/order_list"/>" style="padding:7px 22px 7px 22px; background:#000; border:1px solid #000; color:#fff; font-size:11px;">주문목록보기</a>
    </div>
				
					
				</div>

			</div>
		</div>


		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>