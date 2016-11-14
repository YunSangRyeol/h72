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
	<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<title>Order List</title>
<script type="text/javascript">

//탭 변경	
function openTab(tabname) {
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	
	if(tabname=="orderCategory"){
	$.ajax({
		type:'GET',
		url: "/h72/searchOrder",
		data :{"tab":tabname, "page": "1","start_date": startDate,"end_date": endDate},
		success: function(data) {
			$('#orderCategoryTab').addClass("selected");
			$('#orderListTab').removeClass("selected");
			$('#orderlist').css("display","none");
			$('#orderCategory').css("display","block");
			$('#inputTab').val(tabname);
			alert('성공');
		},
		error: function(data) {
			alert("에러발생! 변경에 실패하였습니다.");
		}			
	});	
	
	}else{
		$.ajax({
			type:'GET',
			url: "/h72/order/order_list",
			data :{"tab":tabname},
			success: function(data) {
				$('#orderCategoryTab').removeClass("selected");
				$('#orderListTab').addClass("selected");
				$('#orderCategory').css("display","none");
				$('#orderlist').css("display","block");
				$('#inputTab').val(tabname);
			},
			error: function(data) {
				alert("에러발생! 변경에 실패하였습니다.");
			}			
		});	
	}
	
}

function orderChange(orderNo, status) {
	if(confirm("주문을 취소하시겠습니까?") == true){
	location.href="/h72/updateStatusCancle?orderNo="+orderNo+"&status="+status;
	}
}


// 날짜포맷 지정하는 함수
function dateToYYYYMMDD(date)
{
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}


//날짜 선택 버튼시 inputd의 날짜 변경
	$(function(){
		
		var currDate = new Date(); // 현재 날짜
		var startDate = new Date(new Date().setMonth(new Date().getMonth()-3)); // 한달전 날짜
		
		// YYYY-MM-DD로 형식변환
		var prevMon = dateToYYYYMMDD(startDate);
		var currMon = dateToYYYYMMDD(currDate);
		
		document.getElementById("startDate").value = prevMon;
		document.getElementById("endDate").value = currMon;
		
		
		$('a[days=00]').click(
		function(){
			document.getElementById("startDate").value = dateToYYYYMMDD(currDate);	
		});
		
		
		$('a[days=07]').click(
				function(){
					var preSeven = new Date(new Date().setDate(new Date().getDate()-7));
					document.getElementById("startDate").value = dateToYYYYMMDD(preSeven);	
						
				});
		
		$('a[days=30]').click(
				function(){
					var preOneMonth = new Date(new Date().setMonth(new Date().getMonth()-1));
					document.getElementById("startDate").value = dateToYYYYMMDD(preOneMonth);	
				});
		$('a[days=90]').click(
				function(){
					var preThreeMonth = new Date(new Date().setMonth(new Date().getMonth()-3));
					document.getElementById("startDate").value = dateToYYYYMMDD(preThreeMonth);	
					
				});
		$('a[days=180]').click(
				function(){
					var preSixMonth = new Date(new Date().setMonth(new Date().getMonth()-6));
					document.getElementById("startDate").value = dateToYYYYMMDD(preSixMonth);	
					
				}); 
		
		
		$('#searchDate').click(
 	 			function(){
 	 					searchDateForm.submit();
 	 		});
		
		
		
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
						<li>
						<a href="javascript:void(0)" class="selected" 
						onclick="openTab('orderlist')" id="orderListTab">주문내역조회</a>
						
						</li>
						<li>
						<a href="javascript:void(0)" class="" id="orderCategoryTab"
						onclick="openTab('orderCategory')">취소/반품/교환</a></li>
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
							
								<input type="date" name="start_date" class="fText" id="startDate" value="2016-10-25"> 
								&nbsp;&nbsp;~&nbsp;&nbsp; 
								<input type="date" name="end_date" class="fText" id="endDate" value="2016-10-25"> 
								<span class="order_term_search" id="searchDate">조회</span>
								<input type="hidden" name="page" value="${currentPage }"/>
								<input type="hidden" name="tab" id="inputTab" value="orderlist"/>
						</fieldset>
						<ul>
							<li>· 기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
							<li>· 주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
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
									href="/h72/order/order_detail?orderNo=${orderList.orderNo }"><strong>
											${orderList.itemNameN1 } 외 ${orderList.kindsQuantity }개</strong></a>
									<div class="option ">[대표옵션: ${orderList.itemOptionNameN1 }]</div>
									</td>
								<td class="quantity">${orderList.totalQuantity }</td>
								<td class="price"><strong><fmt:formatNumber value="${orderList.totalPrice }" pattern="#,###"/>원</strong></td>
								<td class="state">
									<p>${orderList.orderStatus }</p>
								</td>
								<td class="service">
								<c:if test="${orderList.orderStatus eq '결제완료' || orderList.orderStatus eq '입금전'}">
									<a href="#none" onclick="orderChange('${orderList.orderNo}', '${orderList.orderStatus}');">
									<p class="order_cancle">주문취소&nbsp;&nbsp;<span class="order_cancle_arrow">&gt;</span></p></a>
								</c:if>
								<c:if test="${orderList.orderStatus eq '배송중'}">
									<a href="우체국택배 http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=${orderList.transportNo }">
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
				
				
				<div class="tabcontent" id="orderCategory" style="display:none;">
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
						<c:if test="${!(reOrderList eq null) }">
						<c:forEach var="reOrderList" items="${reOrderList}">
						<tbody class="">
							<tr class="xans-record-">
								<td rowspan="2" class="number ">${reOrderList.enrollDate}
									<p>
										<a href="/h72/order/order_detail?orderNo=${reOrderList.orderNo }" class="line">
											class="line">[ ${reOrderList.orderNo} ]</a>
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
				
				
				
				
				
				
			</div>
		</div>





		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
	
	<script>
	$(function(){
		$('#paging').click(
 	 			function(){
 	 				var preDate = document.getElementById("startDate").value;
 	 				var currentDate = document.getElementById("endDate").value;
 	 				var currentPage = '${searchPage}';
 	 				var tab = $('#inputTab').val();
 	 				console.log(currentPage);
 	 				$.ajax({
 	 					type:'GET',
 	 					url: "/h72/searchOrder",
 	 					data :{"tab":tab, "page": currentPage,"start_date": preDate,"end_date": currentDate},
 	 					success: function(data) {
 	 						alert('성공');
 	 					},
 	 					error: function(data) {
 	 						alert("에러발생! 변경에 실패하였습니다.");
 	 					}			
 	 				});
 	 		});
		
		$('#prePaging').click(
 	 			function(){
 	 				var preDate = document.getElementById("startDate").value;
 	 				var currentDate = document.getElementById("endDate").value;
 	 				var currentPage = '${currentPage-1}';
 	 				var tab = $('#inputTab').val();
 	 				console.log(currentPage);
 	 				$.ajax({
 	 					type:'GET',
 	 					url: "/h72/searchOrder",
 	 					data :{"tab":tab, "page": currentPage,"start_date": preDate,"end_date": currentDate},
 	 					success: function(data) {
 	 						alert('성공');
 	 					},
 	 					error: function(data) {
 	 						alert("에러발생! 변경에 실패하였습니다.");
 	 					}			
 	 				});
 	 		});
		$('#endPaging').click(
 	 			function(){
 	 				var preDate = document.getElementById("startDate").value;
 	 				var currentDate = document.getElementById("endDate").value;
 	 				var currentPage = '${currentPage+1}';
 	 				var tab = $('#inputTab').val();
 	 				console.log(currentPage);
 	 				$.ajax({
 	 					type:'GET',
 	 					url: "/h72/searchOrder",
 	 					data :{"tab":tab, "page": currentPage,"start_date": preDate,"end_date": currentDate},
 	 					success: function(data) {
 	 						alert('성공');
 	 					},
 	 					error: function(data) {
 	 						alert("에러발생! 변경에 실패하였습니다.");
 	 					}			
 	 				});
 	 		});
	 	/* $('#paging').click(
 	 			function(){
 	 				var endDate = document.getElementById("startDate").value;
 	 				var currentDate = document.getElementById("endDate").value;
 	 				var currentPage = '${searchPage}';
 	 				var tab = $('#inputTab').val();
 	 				console.log(currentPage);
 	 				location.href ="/h72/searchOrder?page="+currentPage+"&start_date="+endDate+"&end_date="+currentDate+"&tab="+tab;
 	 		});
		
		$('#prePaging').click(
 	 			function(){
 	 				var endDate = document.getElementById("startDate").value;
 	 				var currentDate = document.getElementById("endDate").value;
 	 				var currentPage = '${currentPage-1}';
 	 				var tab = $('#inputTab').val();
 	 				console.log(currentPage);
 	 				location.href ="/h72/searchOrder?page="+currentPage+"&start_date="+endDate+"&end_date="+currentDate+"&tab="+tab;
 	 		});
		$('#endPaging').click(
 	 			function(){
 	 				var endDate = document.getElementById("startDate").value;
 	 				var currentDate = document.getElementById("endDate").value;
 	 				var currentPage = '${currentPage+1}';
 	 				var tab = $('#inputTab').val();
 	 				console.log(currentPage);
 	 				location.href ="/h72/searchOrder?page="+currentPage+"&start_date="+endDate+"&end_date="+currentDate+"&tab="+tab;
 	 		}); */
	
	});
	
	</script>

</body>
</html>