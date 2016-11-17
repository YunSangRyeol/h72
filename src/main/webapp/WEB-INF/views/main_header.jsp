<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>main_header</title>
<link href="/h72/resources/css/main_header.css" type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="/h72/resources/js/jquery-3.1.0.min.js"></script>
	
</head>
<body>
	<div id="main_header">
		<div class="main_line1">
			<div id="main_line_in">
				<div class="main_left">
					<a href="/h72"> <img src="/h72/resources/image/logo.png"></a>
				</div>
				<div class="main_right">
					<ul>
						<c:if test="${loginUser eq null }">
							<li><a href="<c:url value="/member/loginPage" />">LOGIN</a></li>
							<li><a href="<c:url value="/member/memberJoin" />">JOIN</a></li>
							<li><a href="<c:url value="/order/shopping_cart"/>">CART</a></li>
							<li><a href="<c:url value="/order/order_list"/>">ORDER</a></li>
						</c:if>
						<c:if test="${!(loginUser eq null) }">
							<li style="color: #fff; font-weight:bold;">${loginUser.name }
								님</li>
							<li><a href="<c:url value="/logout.do" />">LOGOUT</a></li>
							<c:if test="${!(loginUser.levelcode eq 'ADMIN') && !(loginUser.levelcode eq 'STEP') }">
								<li><a href="<c:url value="/member/memberUpdate" />">MYPAGE</a></li>
								<li><a href="<c:url value="/order/shopping_cart"/>">CART</a></li>
								<li><a href="<c:url value="/order/order_list"/>">ORDER</a></li>
							</c:if>
						</c:if>
						<c:if
							test="${loginUser.levelcode eq 'ADMIN' || loginUser.levelcode eq 'STEP' }">
							<c:url var="goUser111" value="/productEnrollgo" >
							</c:url>
							<li><a href="${goUser111 }">상품등록</a></li>
							<c:url var="goUser" value="/admin/users" >
								<c:param name="page" value="1" />
								<c:param name="count" value="10" />
								<c:param name="order" value="USER_ID" />
								<c:param name="where" value="null" />
							</c:url>
							<li><a href="${goUser}">회원관리</a></li>
							<li><a href="<c:url value="/admin/order" />">주문관리</a></li>
							<li><a href="<c:url value="/admin/chart?now=null" />">매출관리</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<div class="main_line2">
			<div id="main_line_in">
				<div class="main_cate">
					<ul>
						<li id="main_cateIdx1"><a href="<c:url value="/bag" />"><span>BAG</span></a></li>
						<li id="main_cateIdx2" style="width: 150px;"><a
							href="<c:url value="/protect" />"><span>PROTECT GOODS</span></a></li>
						<li id="main_cateIdx3"><a href="<c:url value="/food" />"><span>FOOD</span></a></li>
						<li id="main_cateIdx4" style="width: 100px;"><a
							href="<c:url value="/tool" />"><span>TOOL</span></a></li>
						<li id="main_cateIdx5"><a href="<c:url value="/etc" />"><span>ETC</span></a></li>
						<li id="main_cateIdx6" style="width: 105px;"><a
							href="<c:url value="/kitDiy/kitDiyView"/>"><span>KIT</span></a></li>
					</ul>
				</div>
					<div class="main_board">
					<ul>
						<li class="main_has-sub"><img
							src="/h72/resources/image/topmenu_board_title.png" alt="게시판"
							class="main_title"> &nbsp;
							<ul>
							<c:url var="goNotice" value="/boader/notice" >
								<c:param name="page" value="1" />
								<c:param name="count" value="10" />
								</c:url>
								<li><a href="${goNotice}">공지사항</a></li>

								<c:url var="goQnA" value="/boader/qna" >
								<c:param name="page" value="1" />
								<c:param name="count" value="10" />
							</c:url>
								<li><a href="${goQnA} ">Q&A</a></li>
								
								<li><a href="<c:url value="/boader/life_kit_detail"/>">생존키트란?</a></li>
							</ul></li>
					</ul>
				</div>
<script type="text/javascript">
	$(function() {

		$('.main_searchBtn').click(function() {
			var keyword = $("#main_keyword").val();
			if (keyword == "" || keyword == " " ) {
				alert("검색어를 입력하세요");
			} else {
				main_searchBarForm.submit();
			}
		});
	});
</script>
				<div class="main_search">
					<form id="main_searchBarForm" action="<c:url value="/search" />">
						<input id="main_keyword" name="itemName" class="main_inputTypeText" value=""
							type="text" placeholder=" Search"> <input type="button"
							class="main_searchBtn" value=" " style="cursor: pointer;">
					
						&nbsp;
					</form>
				</div>
			</div>
		</div>
	</div>
	<div id="main_go_top">
		<a href="#" id="main_scrollup" style="display: inline;"><li>GO_TOP</li></a>
	</div>
</body>
</html>