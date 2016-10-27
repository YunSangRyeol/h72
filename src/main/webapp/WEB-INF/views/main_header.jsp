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
							<li style="color:#fff;"><strong> ${loginUser.name }</strong> 님</li>
							<li><a href="<c:url value="logout.do" />">LOGOUT</a></li>
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
						<li id="main_cateIdx1"><a href="#"><span>BAG</span></a></li>
						<li id="main_cateIdx2" style="width: 150px;"><a href="#"><span>PROTECT
									GOODS</span></a></li>
						<li id="main_cateIdx3"><a href="#"><span>FOOD</span></a></li>
						<li id="main_cateIdx4" style="width: 130px;"><a href="#"><span>EQUIPMENT</span></a></li>
						<li id="main_cateIdx5" style="margin-left: 28px;"><a href="#"><span>ETC</span></a></li>
						<li id="main_cateIdx6" style="width: 105px;"><a
							href="<c:url value="/kitDiy/kitDiyView"/>"><span>KIT</span></a></li>
					</ul>
				</div>
				<div class="main_search" style="margin-left: 30px;">
					<form id="main_searchBarForm" name="" action="/product/search.html"
						method="get" enctype="multipart/form-data">
						<input id="main_banner_action" name="banner_action" value=""
							type="hidden">
						<div
							class="main_xans-element- xans-layout xans-layout-searchheader ">

							<input id="main_keyword" name="keyword" fw-filter=""
								fw-label="검색어" fw-msg="" class="main_inputTypeText"
								onmousedown="SEARCH_BANNER.clickSearchForm(this)" value=""
								type="text" placeholder=" Search"><img
								src="/h72/resources/image/topmenu_search.png" alt="검색"
								onclick="SEARCH_BANNER.submitSearchBanner(this); return false;"
								style="float: right; margin-right: 5px; cursor: pointer;">
							&nbsp;
						</div>
					</form>
				</div>
				<div class="main_board">
					<ul>
						<li class="main_has-sub"><img
							src="/h72/resources/image/topmenu_board_title.png" alt="게시판"
							class="main_title"> &nbsp;
							<ul>
								<li><a href="<c:url value="/boader/notice_list"/>">Q&A</a></li>
								<li><a href="<c:url value="/boader/qna_list"/>">공지사항</a></li>
								<li><a href="#">생존키트란?</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="main_go_top">
		<a href="#" id="main_scrollup" style="display: inline;"><li>GO_TOP</li></a>
	</div>
</body>
</html>