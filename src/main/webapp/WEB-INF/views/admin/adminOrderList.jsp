<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/h72/resources/css/admin.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<script src="/h72/resources/js/jquery.battatech.excelexport.js"></script>
<title>Admin Order List</title>
<script type="text/javascript">
	//excel파일 다운로드
	$(document).ready(function () {
	    $("#btnExport").click(function () {
	        $("#orderList").battatech_excelexport({
	            containerid: "orderList"
	           , datatype: 'table'
	        });
	        $(this).attr('download', 'sample.xls').attr('href', uri);
	    });
	});
	
/* 	//위치에 따른 옵션바 생성/제거
	$(window).scroll(function(){
		if($(document).scrollTop()<=500){
			$("#optionBtn").addClass("fixed");
		}else if($(document).scrollTop()>410){
			$("#optionBtn").removeClass("fixed");
	 	}
		
	}); */

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
					.replace("active", "");
		}
		document.getElementById(tabname).style.display = "block";
		evt.currentTarget.className += " active";
	}
	
	//검색시 검색 text와 submit버튼 변경
 	$(function() {
		$('#adminSearchhow').change(
				function(){
					$('#searchDate')[($("option[value='date']").is(":checked")) ? "show" : "hide"]();
					$('#searchID')[($("option[value='user']").is(":checked")) ? "show" : "hide"]();
				});
	}); 
 	
 	//전체선택 체크박스 클릭
 	$(function() {		
		$("#allCheck").click(
			function() {
				if ($("#allCheck").prop("checked")) {
					$("#orderList input[type=checkbox]").prop("checked", true);
				} else {
					$("#orderList input[type=checkbox]").prop("checked", false);
				}
				$("#orderList input[type=checkbox]").change();
		})
	})
 	
	//체크박스 선택시 tr 색 변경
	$(function() {
		$("#orderList input[type=checkbox]").change(function() {
			if ($(this).is(":checked")) {
				$(this).closest("tr").find("td").each(function() {
					$(this).css("background", "#f6f6f6");
				});
			} else {
				$(this).closest("tr").find("td").each(function() {
					$(this).css("background", "white");
				});
			}
		
		} );
	});

 	//날짜 선택 버튼시 inputd의 날짜 변경
	 	
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
			var startDate = new Date(new Date().setMonth(new Date().getDate()-3)); // 한달전 날짜
			
			// YYYY-MM-DD로 형식변환
			var prevMon = dateToYYYYMMDD(startDate);
			var currMon = dateToYYYYMMDD(currDate);		
			document.getElementById("startDate").value = prevMon;
			document.getElementById("endDate").value = currMon;
					
			$('a[days=00]').click(
			function(){
				document.getElementById("startDate").value = dateToYYYYMMDD(currDate);	
			});		
			$('a[days=03]').click(
					function(){
						var preOneMonth = new Date(new Date().setMonth(new Date().getDate()-3));
						document.getElementById("startDate").value = dateToYYYYMMDD(preOneMonth);	
					});
			$('a[days=07]').click(
					function(){
						var preSeven = new Date(new Date().setDate(new Date().getDate()-7));
						document.getElementById("startDate").value = dateToYYYYMMDD(preSeven);							
					});		
			
			$('a[days=14]').click(
					function(){
						var preThreeMonth = new Date(new Date().setMonth(new Date().getDate()-14));
						document.getElementById("startDate").value = dateToYYYYMMDD(preThreeMonth);						
					});
	});
	
 	
 	//개별 버튼 변경
 	function updateStatusOne0(orderNo){
 		var status = $("[name=selectStatusOne0] option:selected").val();
 		goAjax1(orderNo, status);
	}
 	
 	function updateStatusOne1(orderNo){
 		var status = $("[name=selectStatusOne1] option:selected").val();
 		goAjax1(orderNo, status);
	}
 	
 	function updateStatusOne2(orderNo){
 		var status = $("[name=selectStatusOne2] option:selected").val();
 		goAjax1(orderNo, status);
	}
 	
 	function updateStatusOne3(orderNo){
 		var status = $("[name=selectStatusOne3] option:selected").val();
		goAjax1(orderNo, status);
	}
 	
 	//ajax
 	function goAjax1(orderNo, status){ 		
		$.ajax({
			type:'POST',
			url: "/h72/updateStatusOne.do",
			data :{"orderNo":orderNo, "status":status},
			success: function(data) {
				if(data.result > 0){
					alert("주문번호 [" + orderNo + "]를 '" + status + "'(으)로 변경하였습니다.");			
				}
			},
			error: function(data) {
				alert("에러발생! 변경에 실패하였습니다.");
			}			
		});	
 	}
 	
 	//취소.반품.교환 관련 개별 변경 버튼
 	function updateChangeOne1(orderNo){
 		var change = $("[name=selectChangeOne1] option:selected").val();
 		goAjax2(orderNo, change);
 	}
 	
 	function updateChangeOne2(orderNo){
 		var change = $("[name=selectChangeOne2] option:selected").val();
 		goAjax2(orderNo, change);
 	}
 	
 	function updateChangeOne3(orderNo){
 		var change = $("[name=selectChangeOne3] option:selected").val();
 		goAjax2(orderNo, change);
 	}
 	
 	//ajax
 	function goAjax2(orderNo, change){ 		
 		alert("ddd" + orderNo + ", " + change);
		$.ajax({
			type:'POST',
			url: "/h72/updateChangeOne.do",
			data :{"orderNo":orderNo, "change":change},
			success: function(data) {
				if(data.result > 0){
					alert("주문번호 [" + orderNo + "]를 '" + change + "'(으)로 변경하였습니다.");			
				}
			},
			error: function(data) {
				alert("에러발생! 변경에 실패하였습니다.");
			}			
		});	
 	}
 	
 	 	
</script>
</head>
<body>
	<div class="content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp"/>
	</div>
	
	<div class="admin_contents_wrap">
	<div class="admin_contents">
	
	<div class="admin_order_titleArea">
    			<h2>Admin Order List</h2> 
			</div>

	<div id="admin_order_search">
	<div id="adminSearchhow">
	<select class="selectOption" >
		<option value="date" selected>주문일자</option>
		<option value="user">주 문 자</option>
	</select>
	</div>
	<div id="searchDate">
		<form id="searchDateForm" method="post" action="/h72/orderASearchDate.do">
		<span class="day_field"> 
			<a href="#none" class="btnNormal" days="00"><span class="orderhis_day">오늘</span></a> 
			<a href="#none" class="btnNormal" days="03"><span class="orderhis_day2">3일</span></a> 
			<a href="#none" class="btnNormal" days="07"><span class="orderhis_day2">1주</span></a>
			<a href="#none" class="btnNormal" days="14"><span class="orderhis_day3">2주</span></a>
		</span> 
		<input type="date" name="start" id="startDate" class="searchDateInput"> &nbsp; ~ &nbsp; <input type="date" name="end" id="endDate" class="searchDateInput">
		 &nbsp; <input type="submit" value="검색" class="admin_btn_min">
		</form>
	</div><!-- searchDate -->    
    <div id="searchID"  style="display:none;">
		<form method="post" action="/h72/orderASearchUserID.do">
			<input type="text" name="userid" size="30" class="searchInput"> &nbsp; <input type="submit" value="검색" class="admin_btn_min">
		</form>
	</div>
    </div>
  <ul id="admin_order_detail">
    <li>기본적으로 최근 3일간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
    <li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
  </ul>  
 
	<br>
	<br>
	<div id="admin_tab">
	<ul class="tab">
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'all')" id="defaultOpen">모두 보기</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'order')">주문접수</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'resultpaid')">결제완료</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'move')">배송중</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'back')">취소/교환/반품</a></li>
	</ul>

<!-- ----------------------------------------모두보기----------------------------------------------------------- -->
	<div id="all" class="tabcontent" style="display:block">
    <input type="button" id="btnExport" value="Export To Excel" />
    <br />
    <form id="adminOrderListForm" action="/h72/updateOrderStatus.do">
    <table id="orderList" cellspacing='0' cellpadding='0'>
			<thead>
				<tr>
					<th scope="col" class="checked"><input type="checkbox" id="allCheck"></th>
					<th scope="col" class="number"><p>주문일자<br>[주문번호]</p></th>
					<th scope="col" class="product">상품정보</th>
					<th scope="col" class="quantity">총 수량</th>
					<th scope="col" class="price">상품구매금액(원)</th>
					<th scope="col" class="who">주문자</th>
					<th scopt="col" class="how">주문 방법</th>
					<th scope="col" class="state">주문처리상태</th>
				</tr>
			</thead>			
			<tbody class="">				
				<c:forEach var="list" items="${list}" >				
				<tr class="xans-record-">
					<td><input type="checkbox" id="check${list.orderNo }" name="changeList"  value="${list.orderNo }" ></td>
					<td class="number"><p> ${list.enrollDate } <br><a href="">[${list.orderNo }]</a> </p></td>

					<td class="product">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.totalQuantity -1 }개 </td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong>${list.totalPrice }</strong>
					<c:set var="resultAll" value="${list.totalPrice+resultAll}" />
						<div class="displaynone"></div></td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="state">
						<select id="state${list.orderNo }" name="selectStatusOne0" class="selectOption">
							<option value="결제완료">결제완료</option>
							<option value="배송중">배송중</option>
							<option value="주문접수">주문접수</option> 
							<option value="구매완료">구매완료</option> 
							<option value="취소요청">취소요청</option> 
							<option value="교환요청">교환요청</option> 
							<option value="반품요청">반품요청</option> 
				<script>
				$(function(){
					$('#state${list.orderNo }').val('${list.orderStatus}').prop("selected", true);
				});
				</script>
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" id="" onclick="updateStatusOne0('${list.orderNo }')" value="변경">
					</td>
				</tr>				
				</c:forEach>				
			</tbody>
		</table>
		<div id="totalPrice"> 총 금액 : ${resultAll} 원</div>
		<div id="optionBtn">
			선택한 주문건을 
			<select id="modifyWhat" name="selectStatus" class="selectOption">
				<option value="결제완료">결제완료</option>
				<option value="배송중">배송중</option>
				<option value="주문접수">주문접수</option> 
				<option value="구매완료">구매완료</option> 
				<option value="취소요청">취소요청</option> 
				<option value="교환요청">교환요청</option> 
				<option value="반품요청">반품요청</option> 
			</select>
			로 변경합니다. &nbsp;
			<input type="submit" class="admin_btn" value="변경하기">
		</div>
		</form>
	</div><!-- tab -->
<!-- ------------------------------------주문접수---------------------------------------------------------- -->
	<div id="order" class="tabcontent">
    <input type="button" id="btnExport" value="Export To Excel" />
    <br />
    <form id="adminOrderListForm" action="/h72/updateOrderStatus.do">
    <table id="orderList" cellspacing='0' cellpadding='0'>
			<thead>
				<tr>
					<th scope="col" class="checked"><input type="checkbox" id="allCheck"></th>
					<th scope="col" class="number"><p>주문일자<br>[주문번호]</p></th>
					<th scope="col" class="product">상품정보</th>
					<th scope="col" class="quantity">총 수량</th>
					<th scope="col" class="price">상품구매금액(원)</th>
					<th scope="col" class="who">주문자</th>
					<th scopt="col" class="how">주문 방법</th>
					<th scope="col" class="state">주문처리상태</th>
				</tr>
			</thead>			
			<tbody class="">				
				<c:forEach var="list" items="${list}" >	
				<c:if test="${list.orderStatus eq '주문접수' }">			
				<tr class="xans-record-">
					<td><input type="checkbox" id="check${list.orderNo }" name="changeList"  value="${list.orderNo }" ></td>
					<td class="number"><p> ${list.enrollDate } <br><a href="">[${list.orderNo }]</a> </p></td>
					<td class="product">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.totalQuantity -1 }개 </td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong>${list.totalPrice }</strong>
						<c:set var="resultOrder" value="${list.totalPrice+resultOrder}" />
						<div class="displaynone"></div>
					</td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="state">
						<select id="state" name="selectStatusOne1" class="selectOption">
							<option value="결제완료">결제완료</option>
							<option value="배송중">배송중</option>
							<option value="주문접수" selected>주문접수</option> 
							<option value="구매완료">구매완료</option> 
							<option value="취소요청">취소요청</option> 
							<option value="교환요청">교환요청</option> 
							<option value="반품요청">반품요청</option> 
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" id="" onclick="updateStatusOne1('${list.orderNo }')" value="변경">
					</td>
				</tr>		
				</c:if>		
				</c:forEach>				
			</tbody>
		</table>
		<div id="totalPrice"> 총 금액 : ${resultOrder} 원</div>
		<div id="optionBtn">
			선택한 주문건을 
			<select id="modifyWhat" name="selectStatus" class="selectOption">
				<option value="결제완료">결제완료</option>
				<option value="배송중">배송중</option>
				<option value="주문접수" selected>주문접수</option> 
				<option value="구매완료">구매완료</option> 
				<option value="취소요청">취소요청</option> 
				<option value="교환요청">교환요청</option> 
				<option value="반품요청">반품요청</option> 
			</select>
			로 변경합니다. &nbsp;
			<input type="submit" class="admin_btn" value="변경하기">
		</div>
		</form>
	</div><!-- tab -->

<!-- -------------------------------------결제완료--------------------------------------------------------------------- -->
	<div id="resultpaid" class="tabcontent">
    <input type="button" id="btnExport" value="Export To Excel" />
    <br />
    <form id="adminOrderListForm" action="/h72/updateOrderStatus.do">
    <table id="orderList" cellspacing='0' cellpadding='0'>
			<thead>
				<tr>
					<th scope="col" class="checked"><input type="checkbox" id="allCheck"></th>
					<th scope="col" class="number"><p>주문일자<br>[주문번호]</p></th>
					<th scope="col" class="product">상품정보</th>
					<th scope="col" class="quantity">총 수량</th>
					<th scope="col" class="price">상품구매금액(원)</th>
					<th scope="col" class="who">주문자</th>
					<th scopt="col" class="how">주문 방법</th>
					<th scope="col" class="state">주문처리상태</th>
				</tr>
			</thead>			
			<tbody class="">				
				<c:forEach var="list" items="${list}" >	
				<c:if test="${list.orderStatus eq '결제완료' }">			
				<tr class="xans-record-">
					<td><input type="checkbox" id="check${list.orderNo }" name="changeList"  value="${list.orderNo }" ></td>
					<td class="number"><p> ${list.enrollDate } <br><a href="">[${list.orderNo }]</a> </p></td>
					<td class="product">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.totalQuantity -1 }개 </td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong>${list.totalPrice }</strong>
						<c:set var="resultpaid" value="${list.totalPrice+resultpaid}" />
						<div class="displaynone"></div>
					</td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="state">
						<select id="state" name="selectStatusOne2" class="selectOption">
							<option value="결제완료" selected>결제완료</option>
							<option value="배송중">배송중</option>
							<option value="주문접수">주문접수</option> 
							<option value="구매완료">구매완료</option> 
							<option value="취소요청">취소요청</option> 
							<option value="교환요청">교환요청</option> 
							<option value="반품요청">반품요청</option>  
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" id="" onclick="updateStatusOne2('${list.orderNo }')" value="변경">
					</td>
				</tr>		
				</c:if>		
				</c:forEach>				
			</tbody>
		</table>
		<div id="totalPrice"> 총 금액 : ${resultpaid} 원</div>
		<div id="optionBtn">
			선택한 주문건을 
			<select id="modifyWhat" name="selectStatus" class="selectOption">
				<option value="결제완료" selected>결제완료</option>
				<option value="배송중">배송중</option>
				<option value="주문접수">주문접수</option> 
				<option value="구매완료">구매완료</option> 
				<option value="취소요청">취소요청</option> 
				<option value="교환요청">교환요청</option> 
				<option value="반품요청">반품요청</option> 
			</select>
			로 변경합니다. &nbsp;
			<input type="submit" class="admin_btn" value="변경하기">
		</div>
		</form>
	</div><!-- tab -->

<!-- -------------------------------------배송중--------------------------------------------------------------------- -->
	<div id="move" class="tabcontent">
    <input type="button" id="btnExport" value="Export To Excel" />
    <br />
    <form id="adminOrderListForm" action="/h72/updateOrderStatus.do">
    <table id="orderList" cellspacing='0' cellpadding='0'>
			<thead>
				<tr>
					<th scope="col" class="checked"><input type="checkbox" id="allCheck"></th>
					<th scope="col" class="number"><p>주문일자<br>[주문번호]</p></th>
					<th scope="col" class="product">상품정보</th>
					<th scope="col" class="quantity">총 수량</th>
					<th scope="col" class="price">상품구매금액(원)</th>
					<th scope="col" class="who">주문자</th>
					<th scopt="col" class="how">주문 방법</th>
					<th scope="col" class="state">주문처리상태</th>
				</tr>
			</thead>			
			<tbody class="">				
				<c:forEach var="list" items="${list}" >	
				<c:if test="${list.orderStatus eq '배송중' }">			
				<tr class="xans-record-">
					<td><input type="checkbox" id="check${list.orderNo }" name="changeList"  value="${list.orderNo }" ></td>
					<td class="number"><p> ${list.enrollDate } <br><a href="">[${list.orderNo }]</a> </p></td>
					<td class="product">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.totalQuantity -1 }개 </td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong>${list.totalPrice }</strong>
						<c:set var="resultdelivery" value="${list.totalPrice+resultdelivery}" />
						<div class="displaynone"></div>
					</td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="state">
						<select id="state" name="selectStatusOne3" class="selectOption">
							<option value="결제완료">결제완료</option>
							<option value="배송중" selected>배송중</option>
							<option value="주문접수">주문접수</option> 
							<option value="구매완료">구매완료</option> 
							<option value="취소요청">취소요청</option> 
							<option value="교환요청">교환요청</option> 
							<option value="반품요청">반품요청</option> 
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" id="" onclick="updateStatusOne3('${list.orderNo }')" value="변경">
					</td>
				</tr>		
				</c:if>		
				</c:forEach>				
			</tbody>
		</table>
		<div id="totalPrice"> 총 금액 : ${resultdelivery} 원</div>
		<div id="optionBtn">
			선택한 주문건을 
			<select id="modifyWhat" name="selectStatus" class="selectOption">
				<option value="결제완료">결제완료</option>
				<option value="배송중" selected>배송중</option>
				<option value="주문접수">주문접수</option> 
				<option value="구매완료">구매완료</option> 
				<option value="취소요청">취소요청</option> 
				<option value="교환요청">교환요청</option> 
				<option value="반품요청">반품요청</option> 
			</select>
			로 변경합니다. &nbsp;
			<input type="submit" class="admin_btn" value="변경하기">
		</div>
		</form>
	</div><!-- tab -->

<!-- ---------------------------------------------취소내역-------------------------------------------------------------- -->
	<div id="back" class="tabcontent">
		<h3>취소내역</h3>
		<div id="cancel">		
    <input type="button" id="btnExport" value="Export To Excel" />
    <br />
    <form id="adminOrderListForm" action="/h72/updateOrderStatus.do">
    <table id="orderList" cellspacing='0' cellpadding='0'>
			<thead>
				<tr>
					<th scope="col" class="checked"><input type="checkbox" id="allCheck"></th>
					<th scope="col" class="number"><p>주문일자<br>[주문번호]</p></th>
					<th scope="col" class="product">상품정보</th>
					<th scope="col" class="quantity">총 수량</th>
					<th scope="col" class="price">상품구매금액(원)</th>
					<th scope="col" class="who">주문자</th>
					<th scopt="col" class="how">주문 방법</th>
					<th scope="col" class="change">주문처리상태</th>
				</tr>
			</thead>			
			<tbody class="">				
				<c:forEach var="list" items="${list}" >	
				<c:if test="${list.orderStatus eq '취소요청' }">			
				<tr class="xans-record-">
					<td><input type="checkbox" id="check${list.orderNo }" name="changeList"  value="${list.orderNo }" ></td>
					<td class="number"><p> ${list.enrollDate } <br><a href="">[${list.orderNo }]</a> </p></td>
					<td class="product">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.totalQuantity -1 }개 </td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong>${list.totalPrice }</strong>
						<c:set var="resultchange" value="${(list.totalQuantity*list.totalPrice)+resultpaid}" />
						<div class="displaynone"></div>
					</td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="change">
						<select id="change${list.orderNo }" name="selectChangeOne1" class="selectOption">
							<option value="접수중" >접수중</option>
							<option value="처리중">처리중</option>
							<option value="처리완료">처리완료</option> 
				<script>
				$(function(){
					$('#change${list.orderNo }').val('${list.orderChange}').prop("selected", true);
				});
				</script>
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" id="" onclick="updateChangeOne1('${list.orderNo }')" value="변경">
					</td>
				</tr>		
				</c:if>		
				</c:forEach>				
			</tbody>
		</table>
		<div id="totalPrice"> 총 금액 : ${resultpaid} 원</div>
		<div id="backsOptionBtn">
			선택한 주문건을 
			<select id="modifyWhat" name="selectStatus" class="selectOption">
				<option value="접수중" >접수중</option>
				<option value="처리중">처리중</option>
				<option value="처리완료">처리완료</option>
			</select>
			로 변경합니다. &nbsp;
			<input type="submit" class="admin_btn" value="변경하기">
		</div>
		</form>
		</div>
		<hr>
		
		<h3>교환내역</h3>
		<div id="change">
    <input type="button" id="btnExport" value="Export To Excel" />
    <br />
    <form id="adminOrderListForm" action="/h72/updateOrderStatus.do">
    <table id="orderList" cellspacing='0' cellpadding='0'>
			<thead>
				<tr>
					<th scope="col" class="checked"><input type="checkbox" id="allCheck"></th>
					<th scope="col" class="number"><p>주문일자<br>[주문번호]</p></th>
					<th scope="col" class="product">상품정보</th>
					<th scope="col" class="quantity">총 수량</th>
					<th scope="col" class="price">상품구매금액(원)</th>
					<th scope="col" class="who">주문자</th>
					<th scopt="col" class="how">주문 방법</th>
					<th scope="col" class="change">주문처리상태</th>
				</tr>
			</thead>			
			<tbody class="">				
				<c:forEach var="list" items="${list}" >	
				<c:if test="${list.orderStatus eq '교환요청' }">			
				<tr class="xans-record-">
					<td><input type="checkbox" id="check${list.orderNo }" name="changeList"  value="${list.orderNo }" ></td>
					<td class="number"><p> ${list.enrollDate } <br><a href="">[${list.orderNo }]</a> </p></td>
					<td class="product">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.totalQuantity -1 }개 </td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong>${list.totalPrice }</strong>
						<c:set var="resultpaid" value="${(list.totalQuantity*list.totalPrice)+resultpaid}" />
						<div class="displaynone"></div>
					</td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="change">
						<select id="change${list.orderNo }" name="selectChangeOne2" class="selectOption">
							<option value="접수중" >접수중</option>
							<option value="처리중">처리중</option>
							<option value="처리완료">처리완료</option>	
			<script>
				$(function(){
					$('#change${list.orderNo }').val('${list.orderChange}').prop("selected", true);
				});
				</script>
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" id="" onclick="updateChangeOne2('${list.orderNo }')" value="변경">
					</td>
				</tr>		
				</c:if>		
				</c:forEach>				
			</tbody>
		</table>
		<div id="totalPrice"> 총 금액 : ${resultpaid} 원</div>
		<div id="backsOptionBtn">
			선택한 주문건을 
			<select id="modifyWhat" name="selectStatus" class="selectOption">
				<option value="접수중" >접수중</option>
				<option value="처리중">처리중</option>
				<option value="처리완료">처리완료</option>
			</select>
			로 변경합니다. &nbsp;
			<input type="submit" class="admin_btn" value="변경하기">
		</div>
		</form>
		</div>

		<hr>
		
		<h3>반품내역</h3>
		<div id="backing">
    <input type="button" id="btnExport" value="Export To Excel" />
    <br />
    <form id="adminOrderListForm" action="/h72/updateOrderStatus.do">
    <table id="orderList" cellspacing='0' cellpadding='0'>
			<thead>
				<tr>
					<th scope="col" class="checked"><input type="checkbox" id="allCheck"></th>
					<th scope="col" class="number"><p>주문일자<br>[주문번호]</p></th>
					<th scope="col" class="product">상품정보</th>
					<th scope="col" class="quantity">총 수량</th>
					<th scope="col" class="price">상품구매금액(원)</th>
					<th scope="col" class="who">주문자</th>
					<th scopt="col" class="how">주문 방법</th>
					<th scope="col" class="change">주문처리상태</th>
				</tr>
			</thead>			
			<tbody class="">				
				<c:forEach var="list" items="${list}" >	
				<c:if test="${list.orderStatus eq '반품요청' }">			
				<tr class="xans-record-">
					<td><input type="checkbox" id="check${list.orderNo }" name="changeList"  value="${list.orderNo }" ></td>
					<td class="number"><p> ${list.enrollDate } <br><a href="">[${list.orderNo }]</a> </p></td>
					<td class="product">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.totalQuantity -1 }개 </td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong>${list.totalPrice }</strong>
						<c:set var="resultpaid" value="${(list.totalQuantity*list.totalPrice)+resultpaid}" />
						<div class="displaynone"></div>
					</td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="change">
						<select id="change${list.orderNo }" name="selectChangeOne3" class="selectOption">
							<option value="접수중" >접수중</option>
							<option value="처리중">처리중</option>
							<option value="처리완료">처리완료</option>
				<script>
				$(function(){
					$('#change${list.orderNo }').val('${list.orderChange}').prop("selected", true);
				});
				</script>
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" id="" onclick="updateChangeOne3('${list.orderNo }')" value="변경">
					</td>
				</tr>		
				</c:if>		
				</c:forEach>				
			</tbody>
		</table>
		<div id="totalPrice"> 총 금액 : ${resultpaid} 원</div>
		<div id="backsOptionBtn">
			선택한 주문건을 
			<select id="modifyWhat" name="selectStatus" class="selectOption">
				<option value="접수중" >접수중</option>
				<option value="처리중">처리중</option>
				<option value="처리완료">처리완료</option>
			</select>
			로 변경합니다. &nbsp;
			<input type="submit" class="admin_btn" value="변경하기">
		</div>
		</form>		
		</div>		
	</div><!-- tab -->

	</div><!-- all tab -->






	</div><!-- admin_order_contents_wrap -->
	</div><!-- admin_order_contents -->
	
	
	<div class="footer">			
		<jsp:include page="../main_footer.jsp" flush="false" />
	</div>
	
</body>
</html>