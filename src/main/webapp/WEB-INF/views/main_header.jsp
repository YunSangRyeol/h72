<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>main_header</title>
<link href="/h72/resources/css/main_header.css" type="text/css"
	rel="stylesheet">
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
						</c:if>
						<c:if test="${!(loginUser eq null) }">
							<li style="color: #fff;"><strong> ${loginUser.name }</strong>
								님</li>
							<li><a href="<c:url value="/logout.do" />">LOGOUT</a></li>
							<li><a href="<c:url value="/member/memberUpdate" />">MyInfo</a></li>

						</c:if>
						<li><a href="<c:url value="/order/shopping_cart"/>">CART</a></li>
						<li><a href="<c:url value="/order/order_list"/>">ORDER</a></li>
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
								<li><a href="<c:url value="/boader/notice_list"/>">공지사항</a></li>
								<li><a href="<c:url value="/boader/qna_list"/>">Q&A</a></li>
								<li><a href="#">생존키트란?</a></li>
							</ul></li>
					</ul>
				</div>

				<div class="main_search">
					<form id="main_searchBarForm" action="<c:url value="/search" />">
						<input id="main_keyword" name="keyword" fw-filter=""
							fw-label="검색어" fw-msg="" class="main_inputTypeText" value=""
							type="text" placeholder=" Search"> <input type="submit"
							class="main_searchBtn" value=" " style="cursor: pointer;">
						<!-- <img
								src="/h72/resources/image/topmenu_search.png" alt="검색"
								onclick="SEARCH_BANNER.submitSearchBanner(this); return false;"
								style="float: right; margin-right: 5px; cursor: pointer;"> -->
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