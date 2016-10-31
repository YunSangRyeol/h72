<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board list</title>
<link href="/h72/resources/css/notice.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<div class="content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp" />
	</div>
	<br>
	<br>
	<br>
	<div id="sunny_in">

		<div
			class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
			<div
				class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
				<div class="title">
					<h2
						style="font-family: 'Helvetica', sans-serif; font-weight: 700; letter-spacing: 2px; text-transform: uppercase;">
						<span
							style="font-family: 'Helvetica', sans-serif; font-weight: 700; letter-spacing: 2px; text-transform: uppercase;">NOTICE</span>
						<br> 
						<a href="<c:url value="/boader/notice_list"/>">공지사항</a>
						<a href="<c:url value="/boader/qna_list"/>">Q&A</a>
				</div>
			</div>
			<div class="boardSort">
				<span
					class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002 "></span>
			</div>
			<div class="boardList">
				<table border="1" summary="">
					<caption>게시판 목록</caption>
					<colgroup
						class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
						<col style="width: 100px;">
						<col style="width: 135px;" class="displaynone">
						<col style="width: auto;">
						<col style="width: 100px;">
						<col style="width: 100px;" class="">
						<col style="width: 100px;" class="displaynone">
						<col style="width: 100px;" class="displaynone">
						<col style="width: 100px;" class="displaynone">
					</colgroup>
					<thead
						class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
						<tr style="">
							<th scope="col">NO</th>

							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col" class="">작성일</th>


						</tr>
					</thead>
					<tbody
						class="xans-element- xans-board xans-board-notice-1002 xans-board-notice xans-board-1002 notice">
						<!--
                $count = 20
                $login_page_url = /member/login.html
                $deny_access_url = /index.html
            -->
						<tr style="background-color: #FFFFFF; color: #000000;"
							class="xans-record-">
							<td><span
								style="color: #ef4141; font-family: 'Lato', sans-serif; font-weight: 700; font-size: 12px;">!</span>
							</td>

							<td class="subject"><a
								href="/board/free/read.html?no=559012&amp;board_no=1"
								style="color: #000000;"><font color="ff0000">회원등급별혜택</font></a>
								<span class="comment"></span></td>
							<td><img src="/web/upload/sunny/images/icon_10world.png"></td>
							<td class="txtLess ">2015-07-28</td>


						</tr>
						<tr style="background-color: #FFFFFF; color: #000000;"
							class="xans-record-">
							<td><span
								style="color: #ef4141; font-family: 'Lato', sans-serif; font-weight: 700; font-size: 12px;">!</span>
							</td>

							<td class="subject"><a
								href="/board/free/read.html?no=484087&amp;board_no=1"
								style="color: #000000;"><font color="ff0000">장기간 연락이
										안되는 품절건 자동환불처리</font></a> <span class="comment"></span></td>
							<td><img src="/web/upload/sunny/images/icon_10world.png"></td>
							<td class="txtLess ">2014-07-03</td>


						</tr>
					</tbody>
					<tbody
						class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002">
						<!--
                $login_page_url = /member/login.html
                $deny_access_url = /index.html
            -->
						<tr style="background-color: #FFFFFF; color: #000000;"
							class="xans-record-">
							<td>146</td>

							<td class="subject"><a
								href="/board/free/read.html?no=622218&amp;board_no=1"
								style="color: #000000;">10월 3일 개천절 휴무 안내</a> <span
								class="comment"></span></td>
							<td><img src="/web/upload/sunny/images/icon_10world.png"></td>
							<td class="txtLess ">2016-09-30</td>


						</tr>

					</tbody>
				</table>
			</div>
			<div
				class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 boardListEmpty displaynone ">
				<p></p>
			</div>
			<div
				class="xans-element- xans-board xans-board-buttonlist-1002 xans-board-buttonlist xans-board-1002 ">
				<a href="/board/free/write.html?board_no=1"
					style="padding: 7px 22px 7px 22px; background: #000; border: 1px solid #000; color: #fff; letter-spacing: 1px; font-size: 11px;">글쓰기</a>
			</div>
		</div>

		<div
			class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002">
			<p>
				<a href="?board_no=1&amp;page=1"><img
					src="/web/upload/sunny/images/btn_page_prev.png" alt="이전 페이지"></a>
			</p>
			<ol>
				<li class="xans-record-"><a href="?board_no=1&amp;page=1"
					class="this">1</a></li>
				<li class="xans-record-"><a href="?board_no=1&amp;page=2"
					class="other">2</a></li>
				<li class="xans-record-"><a href="?board_no=1&amp;page=3"
					class="other">3</a></li>
<!-- 				<li class="xans-record-"><a href="?board_no=1&amp;page=4"
					class="other">4</a></li>
				<li class="xans-record-"><a href="?board_no=1&amp;page=5"
					class="other">5</a></li>
				<li class="xans-record-"><a href="?board_no=1&amp;page=6"
					class="other">6</a></li>
				<li class="xans-record-"><a href="?board_no=1&amp;page=7"
					class="other">7</a></li>
				<li class="xans-record-"><a href="?board_no=1&amp;page=8"
					class="other">8</a></li>
				<li class="xans-record-"><a href="?board_no=1&amp;page=9"
					class="other">9</a></li>
				<li class="xans-record-"><a href="?board_no=1&amp;page=10"
					class="other">10</a></li> -->
			</ol>
			<p>
				<a href="?board_no=1&amp;page=2"><img
					src="/web/upload/sunny/images/btn_page_next.png" alt="다음 페이지"></a>
			</p>
		</div>

		<form id="boardSearchForm" name="" action="/board/free/list.html"
			method="get" enctype="multipart/form-data">
			<input id="board_no" name="board_no" value="1" type="hidden">
			<input id="page" name="page" value="1" type="hidden"> <input
				id="board_sort" name="board_sort" value="" type="hidden">
			<div
				class="xans-element- xans-board xans-board-search-1002 xans-board-search xans-board-1002 ">
				<fieldset class="boardSearch">
					<legend>게시물 검색</legend>
					<p>
						<select id="search_date" name="search_date" fw-filter=""
							fw-label="" fw-msg="">
							<option value="week">일주일</option>
							<option value="month">한달</option>
							<option value="month3">세달</option>
							<option value="all">전체</option>
						</select> <select id="search_key" name="search_key" fw-filter=""
							fw-label="" fw-msg="">
							<option value="subject">제목</option>
							<option value="content">내용</option>
							<option value="writer_name">글쓴이</option>
							<option value="member_id">아이디</option>
							<option value="nick_name">별명</option>
						</select> <input id="search" name="search" fw-filter="" fw-label=""
							fw-msg="" class="inputTypeText" value="" type="text"> <a
							href="#none" onclick="BOARD.form_submit('boardSearchForm');"
							style="padding: 3px 12px 6px 12px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px; font-family: 'Roboto', sans-serif;">search</a>
					</p>
				</fieldset>
			</div>
		</form>
		<!-- 관리자 전용 메뉴 -->

		<!-- //관리자 전용 메뉴 -->
	</div>


</body>
</html>