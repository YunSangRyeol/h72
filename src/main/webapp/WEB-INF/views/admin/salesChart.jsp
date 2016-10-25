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
<script src="http://yui.yahooapis.com/3.18.1/build/yui/yui-min.js"></script>
<title>Sales Chart</title>
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
					.replace("active", "");
		}
		document.getElementById(tabname).style.display = "block";
		evt.currentTarget.className += " active";
	}

 	//현재 날짜 value입력
 	$(function(){
 		var tDay = new Date();
 		var bMonth = tDay.getMonth();
 		var tMonth = tDay.getMonth()+1;
 		var tDate = tDay.getDate();
 		
 		document.getElementById("nowDate").value = tDay.getFullYear()+"-"+tMonth+"-"+ tDate;
 	});
 	
 // Create a YUI sandbox on your page.
 	YUI().use('node', 'event', function (Y) {
 	    // The Node and Event modules are loaded and ready to use.
 	    // Your code goes here!
 	});
 
 	YUI().use('node', function (Y) {
 	    // Access DOM nodes.
 	    var oneElementById     = Y.one('#foo'),
 	        oneElementByName   = Y.one('body'),
 	        allElementsByClass = Y.all('.bar');

 	    // Create DOM nodes.
 	    var contentNode = Y.Node.create('<div>'),
 	        listNode    = Y.Node.create('<ul>'),
 	        footerNode  = Y.Node.create('<footer>');

 	    contentNode.setHTML('<p>Node makes it easy to add content.</p>');
 	    listNode.insert('<li>Buy milk</li>');
 	    footerNode.prepend('<h2>Footer Content</h2>');

 	    // Manipulate DOM nodes.
 	    Y.all('.important').addClass('highlight');

 	    Y.one('#close-button').on('click', function () {
 	        contentNode.hide();
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
    			<h2>Sales Chart</h2> 
			</div>

	<div id="admin_order_search">
	<div id="searchDate">
		<form>
		<input type="date" name="nowDate" id="nowDate" class="searchDateInput">
		 &nbsp; <input type="submit" value="검색" class="admin_btn_min">
		</form>
	</div><!-- searchDate -->    
    </div>
 
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
    <table id="orderList" cellspacing='0' cellpadding='0'>
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
	</div><!-- tab -->

	<div id="order" class="tabcontent">
	
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
	
	</div><!-- tab -->

	</div><!-- all tab -->


	</div><!-- admin_order_contents_wrap -->
	</div><!-- admin_order_contents -->
	
	
	<div class="footer">			
		<jsp:include page="../main_footer.jsp" flush="false" />
	</div>
	
</body>
</html>