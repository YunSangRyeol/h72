<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
table {
	width: 100%;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
}

ul.tab {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Float the list items side by side */
ul.tab li {float: left;}

/* Style the links inside the list items */
ul.tab li a {
    display: inline-block;
    color: black;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of links on hover */
ul.tab li a:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
ul.tab li a:focus, .active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}
</style>
<script>
	function openTab(evt, tabname) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}
		document.getElementById(tabname).style.display = "block";
		evt.currentTarget.className += " active";
	}

	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
</script>
<head>
<meta charset="UTF-8">
<title>admin page</title>
</head>
<body>

	<fieldset>
	<legend>검색기간설정</legend>
        <span>
            <a href="#none" class="btnNormal" days="00"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif" offimage="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif" onimage="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1_on.gif" alt="오늘"></a>
            <a href="#none" class="btnNormal" days="07"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif" offimage="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif" onimage="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2_on.gif" alt="1주일"></a>
            <a href="#none" class="btnNormal" days="30"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif" offimage="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif" onimage="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3_on.gif" alt="1개월"></a>
            <a href="#none" class="btnNormal" days="90"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif" offimage="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif" onimage="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4_on.gif" alt="3개월" style="margin-left:-1px;"></a>
            <a href="#none" class="btnNormal" days="180"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif" offimage="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif" onimage="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5_on.gif" alt="6개월"></a>
        </span>
        <input id="history_start_date" name="history_start_date" class="fText hasDatepicker" readonly="readonly" size="10" value="2016-07-20" type="text">
        <button type="button" class="ui-datepicker-trigger">
        <img src="http://img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" alt="..." title="..."></button> ~ <input type="" id="history_end_date" name="history_end_date" class="fText hasDatepicker" readonly="readonly" size="10" value="2016-10-18" type="text"><button type="button" class="ui-datepicker-trigger">
        <img src="http://img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" alt="..." title="..."></button>        <input alt="조회" id="order_search_btn" type="image" src="http://img.echosting.cafe24.com/skin/admin_ko_KR/myshop/btn_search.gif">   
    </fieldset>
    
    <fieldset>
    <legend>회원으로 검색</legend>
    	<input type="text" id="serchid" name="searchid"><input type="submit" value="검색">
    </fieldset>

	<div id="admin_admin_title">주문 내역</div>
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
			onclick="openTab(event, 'back')">반품내역</a></li>
	</ul>

	<div id="all" class="tabcontent">
		<table border="1" summary="">
			<thead>
				<tr>
					<th scope="col" class="checked"><input type="checkbox">
					</th>

					<th scope="col" class="number">주문일자<br>[주문번호]
					</th>

					<th scope="col" class="product">상품정보</th>
					<th scope="col" class="quantity">수량</th>
					<th scope="col" class="price">상품구매금액</th>
					<th scope="col" class="thumb">주문자</th>
					<th scopt="col" class="how">주문 방법</th>
					<th scope="col" class="state">주문처리상태</th>
				</tr>
			</thead>
			<tbody class="">
				<tr class="xans-record-">
					<td><input type="checkbox"></td>
					<td class="number ">2016/10/17 <a href=""><p>[20161017-0001735]</p></a></td>

					<td class="product">베이직 모직 백팩 [옵션: 그레이]</td>
					<td class="quantity">1</td>

					<td class="price"><strong>23,900원</strong>
						<div class="displaynone"></div></td>
					<td class="thumb"><a>user01</a></td>
					<td class="how">무통장</td>
					<td class="state">
						<p>결제완료</p>
					</td>
				</tr>
			</tbody>
		</table>
		<br><br><br>
		<div id="modifyBtn">
			선택한 주문건을 
			<select id="modifyWhat">
				<option id="">결제완료</option>
				<option id="">배송중</option>
				<option id="">주문접수</option>
			</select>
			로 변경합니다. 
			<input type="submit" value="변경하기">
		</div>
	</div><!-- tab -->

	<div id="order" class="tabcontent">
		<h3>Paris</h3>
		<p>Paris is the capital of France.</p>
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
		<h3>Tokyo</h3>
		<p>Tokyo is the capital of Japan.</p>
	</div><!-- tab -->

	</div><!-- all tab -->








</body>
</html>