<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/h72/resources/css/cart.css" type="text/css"
	rel="stylesheet">
<link href="/h72/resources/css/order.css" type="text/css"
	rel="stylesheet">
	<script type="text/javascript" src="/h72/resources/js/iamport.payment-1.1.1.js"></script>
	<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript" src="/h72/resources/js/orderList.js"></script>
<title>Order List</title>
<script>
$(function(){
	if('${tab}'=='orderCategory'){
		$('#orderCategory').css("display","block");
		$('#orderlist').css("display","none");
	}else{
		$('#orderlist').css("display","block");
		$('#orderCategory').css("display","none");
	}
});

</script>
</head>
<body id="main">
	<div id="content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp" />


		<div id="order_contents_wrap">
			<div id="order_contents">
				<div class="order_titleArea">
					<h2>ORDER LIST</h2>
				</div>


				<div class="xans-element- xans-myshop xans-myshop-orderhistorytab ">
					<ul>
						<c:if test ="${tab == 'orderlist' }">
						<li>
						<a href="javascript:void(0)" class="selected" 
						onclick="openTab('orderlist')" id="orderListTab">주문내역조회</a>
						
						</li>
						<li>
						<a href="javascript:void(0)" class="" id="orderCategoryTab"
						onclick="openTab('orderCategory')">취소/반품/교환</a></li>
						</c:if>
						<c:if test ="${tab == 'orderCategory' }">
						<li>
						<a href="javascript:void(0)" class="" 
						onclick="openTab('orderlist')" id="orderListTab">주문내역조회</a>
						
						</li>
						<li>
						<a href="javascript:void(0)" class="selected" id="orderCategoryTab"
						onclick="openTab('orderCategory')">취소/반품/교환</a></li>
						</c:if>
					</ul>
				</div>

				<form method="GET" id="searchDateForm" name="searchDateForm" action="/h72/searchOrder">
					<div class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">
						<fieldset>
							<span class="day_field"> 
								<a href="#none" class="btnNormal" days="00"> 
								<span class="orderhis_day">오늘</span></a> 
								<a href="#none" class="btnNormal" days="07"> 
								<span class="orderhis_day2">1주일</span></a> 
								<a href="#none" class="btnNormal" days="30"> 
								<span class="orderhis_day2">1개월</span></a>
								<a href="#none" class="btnNormal" days="90"> <span
									class="orderhis_day2">3개월</span></a> <a href="#none"
								class="btnNormal" days="180"> <span class="orderhis_day3">6개월</span></a>
							</span> 
							
								<input type="date" name="start_date" class="fText" id="startDate" value="${startDate }"> 
								&nbsp;&nbsp;~&nbsp;&nbsp; 
								<input type="date" name="end_date" class="fText" id="endDate" value="${endDate }"> 
								<span class="order_term_search" id="searchDate">조회</span>
								<input type="hidden" name="page" value="${currentPage }"/>
								<c:if test ="${tab == 'orderlist' }">
								<input type="hidden" name="tab" id="inputTab" value="orderlist"/>
								</c:if>
								<c:if test ="${tab == 'orderCategory' }">
								<input type="hidden" name="tab" id="inputTab" value="orderCategory"/>
								</c:if>
						</fieldset>
						<ul>
							<li>· 기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
							<li>· 주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
							<li>· 구매확정시 결제금액의 예정 적립금을 드립니다.</li>
						</ul>
					</div>
				</form>
				
				<div class="tabcontent" id="orderlist">
				<div class="xans-element- xans-myshop xans-myshop-orderhistorylistitem ">
					<!--
        $login_url = /member/login.html
    -->
					<div class="title">
						<h3>주문 상품 정보</h3>
					</div>
					<table border="1" summary="">
						<thead>
							<tr>
								<th scope="col" class="number">주문일자<br>[주문번호]
								</th>
								<th scope="col" class="thumb">이미지</th>
								<th scope="col" class="product">상품정보</th>
								<th scope="col" class="quantity">수량</th>
								<th scope="col" class="price">상품구매금액</th>
								<th scope="col" class="state">주문처리상태</th>
								<th scope="col" class="service">주문처리</th>
							</tr>
						</thead>
						<c:if test="${!(orderList eq null) }">
						<c:forEach var="orderList" items="${orderList}">
						<tbody class="">
							<tr class="xans-record-">
								<td rowspan="2" class="number ">${orderList.enrollDate }
									<p>
										<a href="/h72/order/order_detail?orderNo=${orderList.orderNo }" class="line">
										[ ${orderList.orderNo } ]</a><br>
									</p>
								</td>
								<td class="thumb"><a
									href="/h72/order/order_detail?orderNo=${orderList.orderNo }"><img
										src="/h72/resources${orderList.mainImgN1 }" alt=""></a></td>
								<td class="product"><a
									href="/h72/order/order_detail?orderNo=${orderList.orderNo }" class="line"><strong>
											${orderList.itemNameN1 } 외 ${orderList.kindsQuantity }개</strong></a>
									<div class="option ">[대표옵션: ${orderList.itemOptionNameN1 }]</div>
									</td>
								<td class="quantity">${orderList.totalQuantity }</td>
								<td class="price"><strong><fmt:formatNumber value="${orderList.totalPrice }" pattern="#,###"/>원</strong></td>
								<td class="state">
									<p>${orderList.orderStatus }</p>
								</td>
								<td class="service">
								<c:if test="${orderList.orderStatus eq '결제완료' || orderList.orderStatus eq '주문접수'}">
									<a href="#none" onclick="orderChange('${orderList.orderNo}', '${orderList.orderStatus}','list');">
									<p class="order_cancle">주문취소&nbsp;&nbsp;<span class="order_cancle_arrow">&gt;</span></p></a>
								</c:if>
								<c:if test="${orderList.orderStatus eq '배송중'}">
									<a href="http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=${orderList.transportNumber }" target="_blank">
										<p class="order_cancle">배송조회&nbsp;&nbsp;<span class="order_cancle_arrow">&gt;</span></p></a>
										<a href="#none" onclick="orderFinish('${orderList.orderNo}','${orderList.totalSavingPoint }','list');">
									<p class="order_cancle">구매확정&nbsp;&nbsp;<span class="order_cancle_arrow">&gt;</span></p></a>
								</c:if>
								<c:if test="${orderList.orderStatus eq '구매완료'}">
								<a href="http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=${orderList.transportNumber }" target="_blank">
										<p class="order_cancle">배송조회&nbsp;&nbsp;<span class="order_cancle_arrow">&gt;</span></p></a>
								</c:if>
								
								</td>
							</tr>
						</tbody>
						</c:forEach>
						</c:if>
						<c:if test="${orderList eq null || orderList==''}">
						<tbody class="">
							<tr>
								<td colspan="7" class="empty">주문 내역이 없습니다</td>
							</tr>
						</tbody>
						</c:if>
					</table>
				</div>


				<div class="xans-element- xans-myshop xans-myshop-orderhistorypaging">
					<c:if test="${currentPage <= 1 }">
					<p>
						&lt;
					</p>
					</c:if>
					<c:if test="${currentPage > 1 }">
					<p>
						<a href="#page" id="prePaging">&lt;</a>
					</p>
					</c:if>
					<ol>
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
						<c:if test="${i==currentPage }">
						<li class="xans-record-"><span class="this">${i}</span></li>
						</c:if>
						<c:if test="${i != currentPage }">
						<li class="xans-record-"><span id="paging" >${i}</span>
						<c:set value="${i}" var="searchPage"/>
						</li>
						</c:if>
						</c:forEach>	
					</ol>
					<p>
						<c:if test="${currentPage >= maxPage }">
							&gt;
						</c:if>
						<c:if test="${currentPage < maxPage }">
							<a href="#page" id="endPaging">&gt;</a>
						</c:if>
					</p>
				</div>
				</div>
				
				
				<div class="tabcontent" id="orderCategory">
				<div class="xans-element- xans-myshop xans-myshop-orderhistorylistitem ">
					<!--
        $login_url = /member/login.html
    -->
					<div class="title">
						<h3>취소/교환/반품</h3>
					</div>
					<table border="1" summary="">
						<thead>
							<tr>
								<th scope="col" class="number">주문일자<br>[주문번호]
								</th>
								<th scope="col" class="thumb">이미지</th>
								<th scope="col" class="product">상품정보</th>
								<th scope="col" class="quantity">수량</th>
								<th scope="col" class="price">상품구매금액</th>
								<th scope="col" class="state">주문처리상태</th>
								<th scope="col" class="service">취소/교환/반품</th>
							</tr>
						</thead>
						<c:if test="${!(reOrderList eq null)}">
						<c:forEach var="reOrderList" items="${reOrderList}">
						<tbody class="">
							<tr class="xans-record-">
								<td rowspan="2" class="number ">${reOrderList.enrollDate}
									<p>
										<a href="/h72/order/order_detail?orderNo=${reOrderList.orderNo }" class="line">
											[ ${reOrderList.orderNo} ]</a>
									</p>
								</td>
								<td class="thumb">
										<a href="/h72/order/order_detail?orderNo=${reOrderList.orderNo }" class="line"><img
										src="/h72/resources${reOrderList.mainImgN1}" alt=""></a></td>
								<td class="product">
								<a href="/h72/order/order_detail?orderNo=${reOrderList.orderNo }" class="line"><strong>
											${reOrderList.itemNameN1}</strong></a>
									<div class="option ">[대표옵션: ${reOrderList.itemOptionNameN1}]</div></td>
								<td class="quantity">${reOrderList.totalQuantity}</td>
								<td class="price"><strong><fmt:formatNumber value="${reOrderList.totalPrice}" pattern="#,###"/>원</strong></td>
								<td class="state">
									<p>${reOrderList.orderStatus}</p>
								</td>
								<td class="service">
									<p class="">${reOrderList.orderChange}</p>
								</td>
							</tr>
						</tbody>
						</c:forEach>
						</c:if>

						<c:if test="${reOrderList eq null || reOrderList==''}">
						<tbody class="">
							<tr>
								<td colspan="7" class="empty">취소/교환/반품 내역이 없습니다</td>
							</tr>
						</tbody>
						</c:if>
					</table>
				</div>


				<div class="xans-element- xans-myshop xans-myshop-orderhistorypaging">
					<c:if test="${currentPage <= 1 }">
					<p>
						&lt;
					</p>
					</c:if>
					<c:if test="${currentPage > 1 }">
					<p>
						<a href="#page" id="cprePaging">&lt;</a>
					</p>
					</c:if>
					<ol>
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
						<c:if test="${i == currentPage}">
						<li class="xans-record-"><span class="this">${i}</span></li>
						</c:if>
						<c:if test="${i != currentPage }">
						<li class="xans-record-"><span id="cpaging" >${i}</span>
						<c:set value="${i}" var="searchPage"/>
						</li>
						</c:if>
						</c:forEach>	
					</ol>
					<p>
						<c:if test="${currentPage >= maxPage }">
							&gt;
						</c:if>
						<c:if test="${currentPage < maxPage }">
							<a href="#page" id="cendPaging">&gt;</a>
						</c:if>
					</p>
				</div>
				</div>
				
				
				
				
				
				
			</div>
		</div>





		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
	
	<script>
	$(function(){
	
	 	 $('#paging, #cpaging').click(
 	 			function(){
 	 				var endDate = document.getElementById("startDate").value;
 	 				var currentDate = document.getElementById("endDate").value;
 	 				var currentPage = '${searchPage}';
 	 				var tab = $('#inputTab').val();
 	 				console.log(currentPage);
 	 				location.href ="/h72/searchOrder?page="+currentPage+"&start_date="+endDate+"&end_date="+currentDate+"&tab="+tab;
 	 		});
		
		$('#prePaging, #cprePaging').click(
 	 			function(){
 	 				var endDate = document.getElementById("startDate").value;
 	 				var currentDate = document.getElementById("endDate").value;
 	 				var currentPage = '${currentPage-1}';
 	 				var tab = $('#inputTab').val();
 	 				console.log(currentPage);
 	 				location.href ="/h72/searchOrder?page="+currentPage+"&start_date="+endDate+"&end_date="+currentDate+"&tab="+tab;
 	 		});
		$('#endPaging ,#cendPaging').click(
 	 			function(){
 	 				var endDate = document.getElementById("startDate").value;
 	 				var currentDate = document.getElementById("endDate").value;
 	 				var currentPage = '${currentPage+1}';
 	 				var tab = $('#inputTab').val();
 	 				console.log(currentPage);
 	 				location.href ="/h72/searchOrder?page="+currentPage+"&start_date="+endDate+"&end_date="+currentDate+"&tab="+tab;
 	 		}); 
		
	});
	
	</script>

</body>
</html>