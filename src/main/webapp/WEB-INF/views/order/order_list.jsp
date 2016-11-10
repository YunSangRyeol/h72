<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
function openTab(evt, tabname) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className
				.replace("selected", "");
	}
	document.getElementById(tabname).style.display = "block";
	evt.currentTarget.className += " selected";
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
						<li><!-- <a
							href="/myshop/order/list.html?history_start_date=2016-07-27&amp;history_end_date=2016-10-25">주문내역조회
						</a> -->
						<a href="javascript:void(0)" class="tablinks selected"
						onclick="openTab(event, 'orderlist')" id="defaultOpen">주문내역조회</a>
						
						</li>
						<li><!-- <a
							href="/myshop/order/list.html?mode=cs&amp;history_start_date=2016-07-27&amp;history_end_date=2016-10-25">취소/반품/교환
								내역 </a> -->
						<a href="javascript:void(0)" class="tablinks"
						onclick="openTab(event, 'orderCategory')">취소/반품/교환</a></li>
					</ul>
				</div>

				<form method="GET" id="OrderHistoryForm" name="OrderHistoryForm">
					<div
						class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">
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
							
							<input type="date" name="history_start_date" class="fText" id="startDate"
								value="2016-10-25"> &nbsp;&nbsp;~&nbsp;&nbsp; <input
								type="date" name="history_end_date" class="fText" id="endDate"
								value="2016-10-25"> <span class="order_term_search">조회</span>
						</fieldset>
						<ul>
							<li>· 기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
							<li>· 주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
						</ul>
					</div>
					<input id="mode" name="mode" value="" type="hidden"> <input
						id="term" name="term" value="" type="hidden">
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
								<th scope="col" class="service">취소/교환/반품</th>
							</tr>
						</thead>
						<c:forEach var="orderList" items="${orderList}">
						<tbody class="">
							<tr class="xans-record-">
								<td rowspan="2" class="number ">${orderList.enrollDate }
									<p>
										<a
											href="<c:url value="/order/order_detail"/>"
											class="line">${orderList.orderNo }</a><br>
										<!-- <a href="#none" class="displaynone" onclick="OrderHistory.orderCancel('20161023-0000828')">
										<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_order_cancel.gif" alt="주문취소"></a>	 -->
										<p class="order_cancle">주문취소&nbsp;&nbsp;<span class="order_cancle_arrow">&gt;</span></p>
									</p>
								</td>
								<td class="thumb"><a
									href="/product/detail.html?product_no=8049&amp;cate_no=32"><img
										src="/h72/resources${orderList.mainImgN1 }" alt=""></a></td>
								<td class="product"><a
									href="/product/detail.html?product_no=8049&amp;cate_no=32"><strong>
											${orderList.itemNameN1 }</strong></a>
									<div class="option ">[옵션: ${orderList.itemOptionNameN1 }]</div>
									</td>
								<td class="quantity">${orderList.totalQuantity }</td>
								<td class="price"><strong>${orderList.totalPrice }</strong></td>
								<td class="state">
									<p>${orderList.orderStatus }</p>
								</td>
								<td class="service">
									<p class="">${orderList.orderChange }</p>
								</td>
							</tr>


						</tbody>
						</c:forEach>
						<tbody class="displaynone">
							<tr>
								<td colspan="7" class="empty">주문 내역이 없습니다</td>
							</tr>
						</tbody>
					</table>
				</div>


				<div class="xans-element- xans-myshop xans-myshop-orderhistorypaging">
					<p>
						<a href="?page=1&amp;history_start_date=2016-07-27&amp;history_end_date=2016-10-25">&lt;</a>
					</p>
					<ol>
						<li class="xans-record-"><a
							href="?page=1&amp;history_start_date=2016-07-27&amp;history_end_date=2016-10-25"
							class="this">1</a></li>
					</ol>
					<p>
						<a href="?page=1&amp;history_start_date=2016-07-27&amp;history_end_date=2016-10-25">&gt;</a>
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
						<tbody class="">
							<tr class="xans-record-">
								<td rowspan="2" class="number ">2016-10-23
									<p>
										<a
											href="<c:url value="/order/order_detail"/>"
											class="line">[20161023-0000828]</a>
									</p>
								</td>
								<td class="thumb"><a
									href="/product/detail.html?product_no=8049&amp;cate_no=32"><img
										src="" alt=""></a></td>
								<td class="product"><a
									href="/product/detail.html?product_no=8049&amp;cate_no=32"><strong>
											재난대비 무선 라디오</strong></a>
									<div class="option ">[옵션: ]</div>
									<p class="free displaynone">무이자할부 상품</p></td>
								<td class="quantity">2</td>
								<td class="price"><strong>41,800원</strong></td>
								<td class="state">
									<p>입금전</p>
								</td>
								<td class="service">
									<p class="">-</p>
								</td>
							</tr>


						</tbody>
						<tbody class="displaynone">
							<tr>
								<td colspan="7" class="empty">주문 내역이 없습니다</td>
							</tr>
						</tbody>
					</table>
				</div>


				<div class="xans-element- xans-myshop xans-myshop-orderhistorypaging">
					<p>
						<a href="?page=1&amp;history_start_date=2016-07-27&amp;history_end_date=2016-10-25">&lt;</a>
					</p>
					<ol>
						<li class="xans-record-"><a
							href="?page=1&amp;history_start_date=2016-07-27&amp;history_end_date=2016-10-25"
							class="this">1</a></li>
					</ol>
					<p>
						<a href="?page=1&amp;history_start_date=2016-07-27&amp;history_end_date=2016-10-25">&gt;</a>
					</p>
				</div>
				</div>
				
				
				
				
				
				
			</div>
		</div>





		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>

</body>
</html>