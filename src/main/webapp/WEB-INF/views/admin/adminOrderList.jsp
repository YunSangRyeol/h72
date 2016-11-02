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
 	function updateStatusOne(orderNo){
 		var status = $("[name=selectStatusOne] option:selected").val();
 		//에이작스
			$.ajax({
				type:'POST',
				url: "/h72/updateStatusOne.do",
				data :{"orderNo":orderNo, "status":status},
				success: function(data) {
					alert(data.result);
					if(data.result > 0){
						alert("예!");			
					}
				},
				error: function(data) {
					alert("에러");
					alert(date);
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
			onclick="openTab(event, 'payed')">결제완료</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'move')">배송중</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'back')">취소/교환/반품</a></li>
	</ul>

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
					<c:set var="result" value="${(list.totalQuantity*list.totalPrice)+result}" />
						<div class="displaynone"></div></td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="state">
						<select id="state${list.orderNo }" name="selectStatusOne" class="selectOption">
							<option value="결제완료">결제완료</option>
							<option value="배송중">배송중</option>
							<option value="주문접수">주문접수</option> 
				<script>
				$(function(){
					$('#state${list.orderNo }').val('${list.orderStatus}').prop("selected", true);
				});
				</script>
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" id="" onclick="updateStatusOne('${list.orderNo }')" value="변경">
					</td>
				</tr>				
				</c:forEach>				
			</tbody>
		</table>
		<div id="totalPrice"> 총 금액 : ${result} 원</div>
		<div id="optionBtn">
			선택한 주문건을 
			<select id="modifyWhat" name="selectStatus" class="selectOption">
				<option name="selectStatus" value="결제완료" >결제완료</option>
				<option name="selectStatus" value="배송중" >배송중</option>
				<option name="selectStatus" value="주문접수" >주문접수</option>
			</select>
			로 변경합니다. &nbsp;
			<input type="submit" class="admin_btn" value="변경하기">
		</div>
		</form>
	</div><!-- tab -->

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
				<tr class="xans-record-">
					<td><input type="checkbox" id="check${list.orderNo }" name="changeList"  value="${list.orderNo }" ></td>
					<td class="number"><p> ${list.enrollDate } <br><a href="">[${list.orderNo }]</a> </p></td>

					<td class="product">${list.itemNameN1 } [ 옵션 : ${list.itemOptionNameN1 } ] 외 ${list.totalQuantity -1 }개 </td>
					<td class="quantity">${list.totalQuantity }</td>
					<td class="price"><strong>${list.totalPrice }</strong>
					<c:set var="result" value="${(list.totalQuantity*list.totalPrice)+result}" />
						<div class="displaynone"></div></td>
					<td class="who"><a>${list.userId }</a></td>
					<td class="how">${list.paymentMethod }</td>
					<td class="state">
						<select id="state${list.orderNo }" name="selectStatusOne" class="selectOption">
							<option value="결제완료">결제완료</option>
							<option value="배송중">배송중</option>
							<option value="주문접수">주문접수</option> 
				<script>
				$(function(){
					$('#state${list.orderNo }').val('${list.orderStatus}').prop("selected", true);
				});
				</script>
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" id="" onclick="updateStatusOne('${list.orderNo }')" value="변경">
					</td>
				</tr>				
				</c:forEach>				
			</tbody>
		</table>
		<div id="totalPrice"> 총 금액 : ${result} 원</div>
		<div id="optionBtn">
			선택한 주문건을 
			<select id="modifyWhat" name="selectStatus" class="selectOption">
				<option name="selectStatus" value="결제완료" >결제완료</option>
				<option name="selectStatus" value="배송중" >배송중</option>
				<option name="selectStatus" value="주문접수" >주문접수</option>
			</select>
			로 변경합니다. &nbsp;
			<input type="submit" class="admin_btn" value="변경하기">
		</div>
		</form>
	</div><!-- tab -->

	<div id="payed" class="tabcontent">
		<h3>Tokyo</h3>
		<p>Tokyo is the capital of Japan.</p>
	</div><!-- tab -->
	
	<div id="move" class="tabcontent">
		<h3>Tokyo</h3>
		<p>Tokyo is the capital of Japan.</p>
	</div><!-- tab -->
	
	<div id="back" class="tabcontent">
		<h3>취소내역</h3>
				<table id="tblExport" border="1" summary="">
			<thead>
				<tr>
					<th scope="col" class="checked"><input type="checkbox" id="allCheck"></th>
					<th scope="col" class="number"><p>주문일자<br>[주문번호]</p></th>
					<th scope="col" class="product">상품정보</th>
					<th scope="col" class="quantity">총 수량</th>
					<th scope="col" class="price">상품구매금액</th>
					<th scope="col" class="who">주문자</th>
					<th scopt="col" class="how">주문 방법</th>
					<th scope="col" class="state">주문처리상태</th>
				</tr>
			</thead>
			<tbody class="">
				<tr class="xans-record-">
					<td><input type="checkbox"></td>
					<td class="number"><p> 2016/10/17 <br><a href="">[20161017-0001735]</a> </p></td>

					<td class="product">베이직 모직 백팩 [옵션: 그레이]</td>
					<td class="quantity">1</td>

					<td class="price"><strong>23,900원</strong>
						<div class="displaynone"></div></td>
					<td class="who"><a>user01</a></td>
					<td class="how">무통장</td>
					<td class="state">
						<select id="stateMo" class="selectOption">
							<option id="">결제완료</option>
							<option id="">배송중</option>
							<option id="">주문접수</option> 
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" value="변경">
					</td>
				</tr>
				
				<tr class="xans-record-">
					<td><input type="checkbox"></td>
					<td class="number"><p> 2016/10/17 <br><a href="">[20161017-0001735]</a></p></td>

					<td class="product">베이직 모직 백팩 [옵션: 그레이] 외 5개 </td>
					<td class="quantity">6</td>

					<td class="price"><strong>23,900원</strong>
						<div class="displaynone"></div></td>
					<td class="who"><a>user01</a></td>
					<td class="how">무통장</td>
					<td class="state">
						<select id="stateMo" class="selectOption">
							<option id="">결제완료</option>
							<option id="">배송중</option>
							<option id="">주문접수</option> 
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" value="변경">
					</td>					
				</tr>
			</tbody>
		</table>
		<div id="totalPrice"> 총 금액 : </div>
		<div id="modifyBtn">
			선택한 주문건을 
			<select id="modifyWhat" class="selectOption">
				<option id="">결제완료</option>
				<option id="">배송중</option>
				<option id="">주문접수</option>
			</select>
			로 변경합니다. &nbsp;
			<input type="submit" class="admin_btn" value="변경하기">
		</div>
		<hr>
		
		<h3>교환내역</h3>
				<table id="orderList" border="1" summary="">
			<thead>
				<tr>
					<th scope="col" class="checked"><input type="checkbox" id="allCheck"></th>
					<th scope="col" class="number"><p>주문일자<br>[주문번호]</p></th>
					<th scope="col" class="product">상품정보</th>
					<th scope="col" class="quantity">총 수량</th>
					<th scope="col" class="price">상품구매금액</th>
					<th scope="col" class="who">주문자</th>
					<th scopt="col" class="how">주문 방법</th>
					<th scope="col" class="state">주문처리상태</th>
				</tr>
			</thead>
			<tbody class="">
				<tr class="xans-record-">
					<td><input type="checkbox"></td>
					<td class="number"><p> 2016/10/17 <br><a href="">[20161017-0001735]</a> </p></td>

					<td class="product">베이직 모직 백팩 [옵션: 그레이]</td>
					<td class="quantity">1</td>

					<td class="price"><strong>23,900원</strong>
						<div class="displaynone"></div></td>
					<td class="who"><a>user01</a></td>
					<td class="how">무통장</td>
					<td class="state">
						<select id="stateMo" class="selectOption">
							<option id="">결제완료</option>
							<option id="">배송중</option>
							<option id="">주문접수</option> 
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" value="변경">
					</td>
				</tr>
				
				<tr class="xans-record-">
					<td><input type="checkbox"></td>
					<td class="number"><p> 2016/10/17 <br><a href="">[20161017-0001735]</a></p></td>

					<td class="product">베이직 모직 백팩 [옵션: 그레이] 외 5개 </td>
					<td class="quantity">6</td>

					<td class="price"><strong>23,900원</strong>
						<div class="displaynone"></div></td>
					<td class="who"><a>user01</a></td>
					<td class="how">무통장</td>
					<td class="state">
						<select id="stateMo" class="selectOption">
							<option id="">결제완료</option>
							<option id="">배송중</option>
							<option id="">주문접수</option> 
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" value="변경">
					</td>					
				</tr>
			</tbody>
		</table>
		<div id="totalPrice"> 총 금액 : </div>
		<div id="modifyBtn">
			선택한 주문건을 
			<select id="modifyWhat" class="selectOption">
				<option id="">결제완료</option>
				<option id="">배송중</option>
				<option id="">주문접수</option>
			</select>
			로 변경합니다. &nbsp;
			<input type="submit" class="admin_btn" value="변경하기">
		</div>

		<hr>
		
		<h3>반품내역</h3>
				<table id="orderList" border="1" summary="">
			<thead>
				<tr>
					<th scope="col" class="checked"><input type="checkbox" id="allCheck"></th>
					<th scope="col" class="number"><p>주문일자<br>[주문번호]</p></th>
					<th scope="col" class="product">상품정보</th>
					<th scope="col" class="quantity">총 수량</th>
					<th scope="col" class="price">상품구매금액</th>
					<th scope="col" class="who">주문자</th>
					<th scopt="col" class="how">주문 방법</th>
					<th scope="col" class="state">주문처리상태</th>
				</tr>
			</thead>
			<tbody class="">
				<tr class="xans-record-">
					<td><input type="checkbox"></td>
					<td class="number"><p> 2016/10/17 <br><a href="">[20161017-0001735]</a> </p></td>

					<td class="product">베이직 모직 백팩 [옵션: 그레이]</td>
					<td class="quantity">1</td>

					<td class="price"><strong>23,900원</strong>
						<div class="displaynone"></div></td>
					<td class="who"><a>user01</a></td>
					<td class="how">무통장</td>
					<td class="state">
						<select id="stateMo" class="selectOption">
							<option id="" >결제완료</option>
							<option id="">배송중</option>
							<option id="">주문접수</option> 
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" value="변경">
					</td>
				</tr>
				
				<tr class="xans-record-">
					<td><input type="checkbox"></td>
					<td class="number"><p> 2016/10/17 <br><a href="">[20161017-0001735]</a></p></td>

					<td class="product">베이직 모직 백팩 [옵션: 그레이] 외 5개 </td>
					<td class="quantity">6</td>

					<td class="price"><strong>23,900원</strong>
						<div class="displaynone"></div></td>
					<td class="who"><a>user01</a></td>
					<td class="how">무통장</td>
					<td class="state">
						<select id="stateMo" class="selectOption">
							<option id="">결제완료</option>
							<option id="">배송중</option>
							<option id="">주문접수</option> 
						</select>&nbsp;&nbsp;&nbsp;<input type="button" class="admin_btn_min" value="변경">
					</td>					
				</tr>
			</tbody>
		</table>
		<div id="totalPrice"> 총 금액 : </div>
		<div id="modifyBtn">
			선택한 주문건을 
			<select id="modifyWhat" class="selectOption">
				<option class="nn" id="">결제완료</option>
				<option class="nn" id="">배송중</option>
				<option class="nn" id="">주문접수</option>
			</select>
			로 변경합니다. &nbsp;
			<input type="submit" class="admin_btn" value="변경하기">
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