<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/h72/resources/css/admin.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<script src="/h72/resources/js/jquery.battatech.excelexport.js"></script>
<script src="/h72/resources/js/adminOrderList.js"></script>
<title>Admin Order List</title>
<script type="text/javascript">
//excel파일 다운로드
$(function(){
    $("#btnExportAll").click(function () {
        $("#orderListAll").battatech_excelexport({
            containerid: "orderList"
           , datatype: 'table'
        });
        $(this).attr('download', 'sample.xls').attr('href', uri);
    });
    
    $("#btnExportOrder").click(function () {
        $("#orderListOrder").battatech_excelexport({
            containerid: "orderList"
           , datatype: 'table'
        });
        $(this).attr('download', 'sample.xls').attr('href', uri);
    });
    
    $("#btnExportPurchased").click(function () {
        $("#orderListPurchased").battatech_excelexport({
            containerid: "orderList"
           , datatype: 'table'
        });
        $(this).attr('download', 'sample.xls').attr('href', uri);
    });
    
    $("#btnExportdelivery").click(function () {
        $("#orderListdelivery").battatech_excelexport({
            containerid: "orderList"
           , datatype: 'table'
        });
        $(this).attr('download', 'sample.xls').attr('href', uri);
    });
    
    $("#btnExportCancle").click(function () {
        $("#orderListCancle").battatech_excelexport({
            containerid: "orderList"
           , datatype: 'table'
        });
        $(this).attr('download', 'sample.xls').attr('href', uri);
    });
    
    $("#btnExportChange").click(function () {
        $("#orderListChange").battatech_excelexport({
            containerid: "orderList"
           , datatype: 'table'
        });
        $(this).attr('download', 'sample.xls').attr('href', uri);
    });
    
    $("#btnExportBack").click(function () {
        $("#orderListBack").battatech_excelexport({
            containerid: "orderList"
           , datatype: 'table'
        });
        $(this).attr('download', 'sample.xls').attr('href', uri);
    });
});
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
    <li>주문번호를 클릭하시면 해당 주문에 대한 배송정보를 확인하실 수 있습니다.</li>
    <li>상품정보를 클릭하시면 해당 주문의 대한 상세내역을 확인하실 수 있습니다.</li>
    <li>종류별 변경 후에 상단의 탭 이동시 새로고침을 해주셔야 재배열됩니다.</li>
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
    <input type="button" id="btnExportAll" value="모든 내역 엑셀로 다운로드" />
    <br />
    <form id="adminOrderListForm" action="/h72/updateOrderStatus.do">
    <table id="orderListAll" cellspacing='0' cellpadding='0'>
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
				<tr class="xans-record-"><!-- 내용 -->
					<td><input type="checkbox" id="check${list.orderNo }" name="changeList"  value="${list.orderNo }" ></td>
					<td class="number"><p> ${list.enrollDate } <br><a href="">[${list.orderNo }]</a> </p></td>
					<td class="product"><a herf="#none" style="cursor: pointer;" onclick="Contents('${list.orderNo}')">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.kindsQuantity -1 }종류 </a></td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong><fmt:formatNumber value="${list.totalPrice }" groupingUsed="true" /></strong>					
					<c:set var="resultAll" value="${list.totalPrice+resultAll}" />
						<div class="displaynone"></div></td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="state">
						<select id="state${list.orderNo }" name="selectStatusOne${list.orderNo }0" class="selectOption">
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
		<c:if test="${list.orderChange eq null }">
		<th class="change"></th>
		</c:if>
				</tr>				
				<c:forEach var="listContents" items="${listContents}" >	
				<c:if test="${listContents.orderNo eq list.orderNo }">
				<tr class="Contents${list.orderNo }" style="display:none;"><!-- 내부 내용 -->									
						<th scope="col" class="checked"></th>
						<th scope="col" class="number"></th>
						<th scope="col" class="product">${listContents.itemName } [ 옵션 : ${listContents.itemOptionName } ]</th>
						<th scope="col" class="quantity">${listContents.quantity }</th>
						<th scope="col" class="price"><fmt:formatNumber value="${listContents.cost }" groupingUsed="true" /> </th>
						<th scope="col" class="who"></th>
						<th scopt="col" class="how"></th>
						<th scope="col" class="state"></th>
				</tr>
				</c:if>
				</c:forEach>
				
				</c:forEach>	
							
			</tbody>
		</table>
		
		<div id="totalPrice"> 총 금액 : <fmt:formatNumber value="${resultAll }" groupingUsed="true" /> 원</div>
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
    <input type="button" id="btnExportOrder" value="접수내역 엑셀로 다운로드" />
    <br />
    <form id="adminOrderListForm" action="/h72/updateOrderStatus.do">
    <table id="orderListOrder" cellspacing='0' cellpadding='0'>
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
					<td class="product"><a herf="#none" style="cursor: pointer;" onclick="Contents('${list.orderNo}')">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.kindsQuantity -1 }종류 </a></td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong><fmt:formatNumber value="${list.totalPrice }" groupingUsed="true" /></strong>
						<c:set var="resultOrder" value="0"/>
						<c:set var="resultOrder" value="${list.totalPrice+resultOrder}" />
						<div class="displaynone"></div>
					</td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="state">
						<select id="state${list.orderNo }" name="selectStatusOne${list.orderNo }1" class="selectOption">
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
				<c:forEach var="listContents" items="${listContents}" >	
				<c:if test="${listContents.orderNo eq list.orderNo }">
				<tr class="Contents${list.orderNo }" style="display:none;"><!-- 내부 내용 -->									
						<th scope="col" class="checked"></th>
						<th scope="col" class="number"></th>
						<th scope="col" class="product">${listContents.itemName } [ 옵션 : ${listContents.itemOptionName } ]</th>
						<th scope="col" class="quantity">${listContents.quantity }</th>
						<th scope="col" class="price"><fmt:formatNumber value="${listContents.cost }" groupingUsed="true" /></th>
						<th scope="col" class="who"></th>
						<th scopt="col" class="how"></th>
						<th scope="col" class="state"></th>
				</tr>
				</c:if>
				</c:forEach>		
				</c:if>		
				</c:forEach>				
			</tbody>
		</table>
		<div id="totalPrice"> 총 금액 : <fmt:formatNumber value="${resultOrder}" groupingUsed="true" pattern="0"/> 원</div>
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
    <input type="button" id="btnExportPurchased" value="결제내역 엑셀로 다운로드" />
    <br />
    <form id="adminOrderListForm" action="/h72/updateOrderStatus.do">
    <table id="orderListPurchased" cellspacing='0' cellpadding='0'>
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
					<td class="product"><a herf="#none" style="cursor: pointer;" onclick="Contents('${list.orderNo}')">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.kindsQuantity -1 }종류 </a></td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong>${list.totalPrice }</strong>
						<c:set var="resultpaid" value="0" />
						<c:set var="resultpaid" value="${list.totalPrice+resultpaid}" />
						<div class="displaynone"></div>
					</td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="state">
						<select id="state" name="selectStatusOne${list.orderNo}2" class="selectOption">
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
				<c:forEach var="listContents" items="${listContents}" >	
				<c:if test="${listContents.orderNo eq list.orderNo }">
				<tr class="Contents${list.orderNo }" style="display:none;"><!-- 내부 내용 -->									
						<th scope="col" class="checked"></th>
						<th scope="col" class="number"></th>
						<th scope="col" class="product">${listContents.itemName } [ 옵션 : ${listContents.itemOptionName } ]</th>
						<th scope="col" class="quantity">${listContents.quantity }</th>
						<th scope="col" class="price">${listContents.cost }</th>
						<th scope="col" class="who"></th>
						<th scopt="col" class="how"></th>
						<th scope="col" class="state"></th>
				</tr>
				</c:if>
				</c:forEach>	
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
    <input type="button" id="btnExportdelivery" value="배송내역 엑셀로 다운로드" />
    <br />
    <form id="adminOrderListForm" action="/h72/updateOrderStatus.do">
    <table id="orderListdelivery" cellspacing='0' cellpadding='0'>
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
					<td class="product"><a herf="#none" style="cursor: pointer;" onclick="Contents('${list.orderNo}')">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.kindsQuantity -1 }종류 </a></td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong>${list.totalPrice }</strong>
						<c:set var="resultdelivery" value="0" />
						<c:set var="resultdelivery" value="${list.totalPrice+resultdelivery}" />
						<div class="displaynone"></div>
					</td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="state">
						<select id="state" name="selectStatusOne${list.orderNo}3" class="selectOption">
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
				<c:forEach var="listContents" items="${listContents}" >	
				<c:if test="${listContents.orderNo eq list.orderNo }">
				<tr class="Contents${list.orderNo }" style="display:none;"><!-- 내부 내용 -->									
						<th scope="col" class="checked"></th>
						<th scope="col" class="number"></th>
						<th scope="col" class="product">${listContents.itemName } [ 옵션 : ${listContents.itemOptionName } ]</th>
						<th scope="col" class="quantity">${listContents.quantity }</th>
						<th scope="col" class="price">${listContents.cost }</th>
						<th scope="col" class="who"></th>
						<th scopt="col" class="how"></th>
						<th scope="col" class="state"></th>
				</tr>
				</c:if>
				</c:forEach>		
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
    <input type="button" id="btnExportCancle" value="최소내역 엑셀로 다운로드" />
    <br />
    <form id="adminOrderListForm" action="/h72/updateOrderStatus.do">
    <table id="orderListCancle" cellspacing='0' cellpadding='0'>
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
					<td class="product"><a herf="#none" style="cursor: pointer;" onclick="Contents('${list.orderNo}')">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.kindsQuantity -1 }종류 </a></td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong>${list.totalPrice }</strong>
						<c:set var="resultchange" value="0" /> 
						<c:set var="resultchange" value="${(list.totalQuantity*list.totalPrice)+resultpaid}" />
						<div class="displaynone"></div>
					</td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="change">
						<select id="change${list.orderNo }" name="selectChangeOne${list.orderNo}1" class="selectOption">
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
				<c:forEach var="listContents" items="${listContents}" >	
				<c:if test="${listContents.orderNo eq list.orderNo }">
				<tr class="Contents${list.orderNo }" style="display:none;"><!-- 내부 내용 -->									
						<th scope="col" class="checked"></th>
						<th scope="col" class="number"></th>
						<th scope="col" class="product">${listContents.itemName } [ 옵션 : ${listContents.itemOptionName } ]</th>
						<th scope="col" class="quantity">${listContents.quantity }</th>
						<th scope="col" class="price">${listContents.cost }</th>
						<th scope="col" class="who"></th>
						<th scopt="col" class="how"></th>
						<th scope="col" class="state"></th>
				</tr>
				</c:if>
				</c:forEach>	
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
    <input type="button" id="btnExportChange" value="교환내역 엑셀로 다운로드" />
    <br />
    <form id="adminOrderListForm" action="/h72/updateOrderStatus.do">
    <table id="orderListChange" cellspacing='0' cellpadding='0'>
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
					<td class="product"><a herf="#none" style="cursor: pointer;" onclick="Contents('${list.orderNo}')">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.kindsQuantity -1 }종류 </a></td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong>${list.totalPrice }</strong>
						<c:set var="resultpaid" value="${(list.totalQuantity*list.totalPrice)+resultpaid}" />
						<div class="displaynone"></div>
					</td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="change">
						<select id="change${list.orderNo }" name="selectChangeOne${list.orderNo}2" class="selectOption">
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
				<c:forEach var="listContents" items="${listContents}" >	
				<c:if test="${listContents.orderNo eq list.orderNo }">
				<tr class="Contents${list.orderNo }" style="display:none;"><!-- 내부 내용 -->									
						<th scope="col" class="checked"></th>
						<th scope="col" class="number"></th>
						<th scope="col" class="product">${listContents.itemName } [ 옵션 : ${listContents.itemOptionName } ]</th>
						<th scope="col" class="quantity">${listContents.quantity }</th>
						<th scope="col" class="price">${listContents.cost }</th>
						<th scope="col" class="who"></th>
						<th scopt="col" class="how"></th>
						<th scope="col" class="state"></th>
				</tr>
				</c:if>
				</c:forEach>		
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
    <input type="button" id="btnExportBack" value="반품내역 엑셀로 다운로드" />
    <br />
    <form id="adminOrderListForm" action="/h72/updateOrderStatus.do">
    <table id="orderListBack" cellspacing='0' cellpadding='0'>
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
					<td class="product"><a herf="#none" style="cursor: pointer;" onclick="Contents('${list.orderNo}')">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.kindsQuantity -1 }종류 </a></td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong>${list.totalPrice }</strong>
						<c:set var="resultpaid" value="${(list.totalQuantity*list.totalPrice)+resultpaid}" />
						<div class="displaynone"></div>
					</td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="change">
						<select id="change${list.orderNo }" name="selectChangeOne${list.orderNo}3" class="selectOption">
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
				<c:forEach var="listContents" items="${listContents}" >	
				<c:if test="${listContents.orderNo eq list.orderNo }">
				<tr class="Contents${list.orderNo }" style="display:none;"><!-- 내부 내용 -->									
						<th scope="col" class="checked"></th>
						<th scope="col" class="number"></th>
						<th scope="col" class="product">${listContents.itemName } [ 옵션 : ${listContents.itemOptionName } ]</th>
						<th scope="col" class="quantity">${listContents.quantity }</th>
						<th scope="col" class="price">${listContents.cost }</th>
						<th scope="col" class="who"></th>
						<th scopt="col" class="how"></th>
						<th scope="col" class="state"></th>
				</tr>
				</c:if>
				</c:forEach>	
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