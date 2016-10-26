<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ORDER DETAIL</title>
<link href="/h72/resources/css/cart.css" type="text/css"
	rel="stylesheet">
<link href="/h72/resources/css/order.css" type="text/css"
	rel="stylesheet">
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
					<!--
        $print_spec_url = /myshop/order/print/spec.html
        $print_pg_card_url = /myshop/order/print/pg.html
        $print_tax_url = /myshop/order/print/tax.html
        $issue_tax_url = /myshop/order/issue/tax.html
        $issue_cash_url = /myshop/order/issue/cash.html
        $select_gift_url = /order/gift_select.html
     -->
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
										<td>20161012-0000493</td>
									</tr>
									<tr>
										<th scope="row">주문일자</th>
										<td>2016-10-12 10:35:43</td>
									</tr>
									<tr>
										<th scope="row">주문자</th>
										<td><span>하지수</span></td>
									</tr>
									<tr>
										<th scope="row">주문처리상태</th>
										<td>취소 <span class="displaynone"> <a href="#none"
												onclick="window.open('/myshop/order/escrow.html?order_id=20161012-0000493', '', 'scrollbars=yes, resizeable=0, status=0, directories=0, toolbar=0'); return false;"
												style="padding: 3px 12px 3px 12px; width: 44px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; font-size: 11px;">구매확인</a>
												<a href="#none"
												onclick="window.open('/myshop/order/escrow.html?order_id=20161012-0000493', '', 'scrollbars=yes, resizeable=0, status=0, directories=0, toolbar=0'); return false;"
												style="padding: 3px 12px 3px 12px; width: 44px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; font-size: 11px;">환불요청</a>
										</span>
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
						<div class="boardTotal">
							<table border="1" summary="">
								<tbody>
									<tr class="total first">
										<th scope="row">총 주문금액</th>
										<td><span class="grid"> <strong>0</strong>원 
										</span> 
										</td>
									</tr>
								</tbody>
								
							</table>
						</div>
						<div class="boardTotal summaryBtm">
							<table border="1" summary="">
								<tbody>
									<tr class="total first">
										<th scope="row">총 결제금액</th>
										<td><strong>17,000</strong>원 
										</td>
									</tr>
									<tr class="">
										<th scope="row">결제수단</th>
										<td><strong><span>무통장 입금</span></strong>
											<p>
												<span>입금자 : 하지수, 계좌번호 : 국민은행 00112233445566
													((주)살아남조)</span> 
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
									<td colspan="7"><strong class="type">[기본배송]</strong>
										상품구매금액 <strong>0</strong> + 배송비 0 + 지역별배송비 0 = 합계 : <strong
										class="total"><span>0원</span></strong> <span
										class="displaynone"></span></td>
								</tr>
							</tfoot>
							<tbody
								class="xans-element- xans-myshop xans-myshop-orderhistorydetailbasic">
								<tr class="xans-record-">
									<td class="thumb"></td>
									<td class="product"><a
										href="/product/detail.html?product_no=8761&amp;cate_no=27"><strong>
												재난 무선 라디오 </strong></a>
										<div class="option ">[옵션: 블랙]</div>
										
									</td>
									<td class="quantity">1</td>
									<td class="price"><strong>14,500원</strong>
									<div class="displaynone"></div></td>
									<td class="delivery">기본배송
										<div class="displaynone">(해외배송가능)</div>
									</td>
									<td class="state">
										<p>입금전취소</p>
										<p class="displaynone">
											<a href="#" target="_self"></a>
										</p>
										<p class="displaynone">
											<a href="#none" class="line" onclick="">[]</a>
										</p>
									</td>
									<td class="service">
										<p class="displaynone">
											<a href="#none" class="line"
												onclick="OrderLayer.getDetailInfo('?product_no=8761&amp;order_id=20161012-0000493&amp;ord_item_code=20161012-0000493-01');">[상세정보]</a>
										</p>
										<p class="">-</p>
									</td>
								</tr>
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
										<td><span>하지수</span></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">영문이름</th>
										<td><span></span></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">이름(발음기호)</th>
										<td><span></span></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">국가</th>
										<td></td>
									</tr>
									<tr>
										<th scope="row">우편번호</th>
										<td><span>14965</span></td>
									</tr>
									<tr>
										<th scope="row">주소</th>
										<td><span>경기도 시흥시 월곶중앙로14번길 87 (월곶동) 월곶동풍림2차아파트
												215동 802gh</span></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">도시</th>
										<td></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">주/지방</th>
										<td></td>
									</tr>
									<tr>
										<th scope="row">일반전화</th>
										<td><span>010-7929-4990</span></td>
									</tr>
									<tr>
										<th scope="row">휴대전화</th>
										<td><span>010-7929-4990</span></td>
									</tr>
									<tr>
										<th scope="row">배송메시지</th>
										<td><span></span></td>
									</tr>
									<tr class="displaynone">
										<th scope="row">희망 배송일</th>
										<td></td>
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