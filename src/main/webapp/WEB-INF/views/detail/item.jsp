<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
ul {
	list-style : none;
}
a {
	text-decoration : none;
	color : black;
}
#wrapper {
	padding-top: 200px;
	padding-bottom: 200px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page='../main_header.jsp' flush="false" />
<div id="wrapper">
<CENTER>
	<h1>TEST 페이지 입니다</h1>
	<ul>
		<li><a href="/h72/detail/selectItem">[Rothco] 로스코 폴라쉴드 서바이벌 슬리핑백 보온포 생존용품 - Rothco Polarshield Survival Sleeping Bag</a></li>
		<li><a href="/h72/detail/selectDetailItem">[Rothco] 로스코 폴라쉴드 서바이벌 블랭킷 비상 담요 침낭 생존용품</a></li>
		<li><a href="/h72">[UST] 유에스티 서바이벌 판초 보온포 - Survival Poncho</a></li>
		<li><a href="/h72/detail/selectReview">[UST] 유에스티 서바이벌 블랭킷 비상용 침낭 - Survival Blanket</a></li>
		<li><a href="#">[SOL] 비상 응급 담요 2인용 서바이벌 블랭킷 생존 보온 용품 - Adventure Medical Kits Survival Blanket</a></li>
		<li><a href="#">[Ace Camp] 에이스 캠프 고체연료 핸드워머 손난로</a></li>
		<li><a href="#">[Ace Camp] 에이스 캠프 핸드워머용 고체연료 12개</a></li>
		<li><a href="#">[듀플렉스] 극세사 방한 마스크 국내산 검정 마스크</a></li>
		<li><a href="#">방한용 귀마개</a></li>
		<li><a href="#">다기능 방한 목도리</a></li>
		<li><a href="#">카르닉 멀티 워머</a></li>
		<li><a href="#">방한모자</a></li>
		<li><a href="#">방한장갑</a></li>
		<li><a href="#">남여공용 깔깔이(방한내피)</a></li>
		<li><a href="#">남녀노소 발열내의</a></li>
	</ul>
	<hr><hr>
	<h2>${itemList.size() }</h2>
	<hr>
	<a href="/h72/detail/selectItem">안녕!!!</a><br>
	
	<c:if test="${itemList != null}">
	
	<c:forEach var="i" begin="0" end="${itemList.size() - 1}" step="1">
	
	<c:url var="url" value="selectItem"><!-- h72/detail/selectItem -->
	<c:param name="ItemDetailId" value="${itemList.get(i).ITEM_DETAIL_ID }" />
	<c:param name="ItemDetailName" value="${itemList.get(i).ITEM_NAME }" />
	<c:param name="ItemPrice" value="${itemList.get(i).MIN_PRICE }" />
	</c:url>
	
	<div style="display: inline" >
		<a href="${url }" style="color: green">${itemList.get(i).ITEM_DETAIL_ID }</a>${itemList.get(i).ITEM_NAME }
	</div>
	<br>
	
	</c:forEach>
	
	</c:if>
	
	<c:if test="${itemList == null }">
		리스트가 없습니다.
	</c:if>
</CENTER>
</div>

<jsp:include page="../main_footer.jsp" flush="false" />
</body>
</html>