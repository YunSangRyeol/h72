<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/h72/resources/css/cart.css" type="text/css" rel="stylesheet">

<title>Shopping_cart</title>
</head>
<body id="main">
	<div id="content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp"/>
	</div>
	
	<div id="order_contents_wrap">
		<div id="order_contents">
			<div class="order_titleArea">
    			<h2>Shopping Cart </h2> 
			</div>
		
	
	<div class="xans-element- xans-order xans-order-basketpackage "><!-- 혜택정보 -->
	<!-- 장바구니 비어있을 때 -->
	<div class="xans-element- xans-order xans-order-empty "><p>장바구니가 비어 있습니다.</p>
	</div>
	<!-- 할인금액 노출 : 삭제 시 할인금액이 노출되지 않습니다.-->
	<!-- 일반상품 -->
	<div class="orderListArea"> 
	
	        <!-- 일반상품 (기본배송) -->
	        <!-- 일반상품 (업체기본배송) --><!-- 일반상품 (개별배송) -->
	        <!-- 일반상품 (해외배송) -->
	        </div>
	<!-- 무이자상품 -->
	<div class="orderListArea">
	        
	        <!-- 무이자상품 (기본배송)-->
	        <!-- 무이자상품 (개별배송)-->
	        <!-- 무이자상품 (해외배송) -->
	        </div>
	<!-- 무이자할부 정보 (카드이미지 등) -->
	<!-- 선택상품 제어 버튼 -->
	<!-- 총 주문금액 : 국내배송상품 -->
	<!-- 총 주문금액 : 해외배송상품 -->
	<!-- 주문 버튼 -->
	<div class="xans-element- xans-order xans-order-totalorder"><a href="#none" onclick="Basket.orderAll(this)" link-order="/order/orderform.html?basket_type=all_buy" link-login="/member/login.html" class="order_total_btn ">전체상품주문</a>
	<a href="#none" onclick="Basket.orderSelectBasket(this)" link-order="/order/orderform.html?basket_type=all_buy" link-login="/member/login.html" class="order_select_btn">선택상품주문</a><span class="right">
	            <a href="/" style="padding:7px 22px 7px 22px; background:#f7f7f7; border:1px solid #e7e7e7; color:#000; font-size:11px;">쇼핑계속하기</a>
	        </span>
	<!-- 네이버 체크아웃 구매 버튼  -->
	<div id="NaverChk_Button"></div>
	</div>
	</div>
		
	</div>
	</div>

</body>
</html>