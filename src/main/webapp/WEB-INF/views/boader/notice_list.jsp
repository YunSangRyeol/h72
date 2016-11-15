<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%--  	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board list</title>
<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<link href="/h72/resources/css/notice.css" type="text/css"
	rel="stylesheet">
</head>
<script type="text/javascript">
	
</script>
<body>

		<jsp:include page="/WEB-INF/views/main_header.jsp" />
	<br><br><br>
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
						<c:url var="goNotice" value="/boader/notice" >
								<c:param name="page" value="1" />
								<c:param name="count" value="10" />
								</c:url>
						<a href="${goNotice}">공지사항</a>
						
							<c:url var="goQnA" value="/boader/qna" >
								<c:param name="page" value="1" />
								<c:param name="count" value="10" />
							</c:url>
						<a href="${goQnA} ">Q&A</a>
				</div>
c
<%-- 				<c:if test="${loginUser.id == 'ADMIN' }">
					<a href="new" type="button" class="btn btn-primary btn-block"
						style="margin-bottom: 20px">공지사항 등록</a>
				</c:if> --%>
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

					</colgroup>
					
					
					<thead
						class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
						<tr style="">
							<th scope="col">NO</th>
							<th scope="col">제목</th>
							<th scope="col" class="">작성일</th>

					</thead>
					<tbody>
					        
						 <c:forEach var="list" items="${list}">
                  <tr>
                    <td class="noticeNo">${list.noticeNo}
                    </td>
                    <td class="noticeTitle">
                        <a href="notice_detail_view?noticeNo=${list.noticeNo}">${list.noticeTitle}</a>
                    </td>
                    <td class="enrolldate">${list.enrolldate}</td>
                </tr>
                
            </c:forEach>
<%--             <c:if test="${count==0}">
                <tr>
                    <td colspan="5" class="align-center">등록된 게시물이 없습니다.</td>
                </tr>
            </c:if> --%>           
					</tbody>
					<!-- <tbody
						class="xans-element- xans-board xans-board-list-1002 xans-board-list xans-board-1002">
						
                $login_page_url = /member/login.html
                $deny_access_url = /index.html
           
 

					</tbody> -->
				</table>
			</div>
			<div
				class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 boardListEmpty displaynone ">
				<p></p>
			</div>
			<c:if test="${loginUser.userid eq 'ADMIN' }">
			<div
				class="xans-element- xans-board xans-board-buttonlist-1002 xans-board-buttonlist xans-board-1002 ">
				
					<a href="<c:url value="/boader/notice_insert"/>"type="button" class="btn btn-primary btn-block"
						style="padding: 7px 22px 7px 22px; background: #000; border: 1px solid #000; color: #fff; letter-spacing: 1px; font-size: 11px;">공지사항 등록</a>
						
			</div>
				</c:if>
		</div>

	<!-- 	<div
			class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002">
			<p> -->
			
<!-- 			<div id="selectNumdDiv">
		 	<select id="selectNum">
				<option value="10"> 10</option>
				<option value="20"> 20</option>
				<option value="30">  30</option>
			</select>
	 	</div> -->
			
			<div id="notice_page_list"  align="center">
					<c:url var="goNoticefirst" value="/boader/notice" >
					<c:param name="page" value="1" />
					<c:param name="count" value="${count }" />

			</c:url>
				 <a href="${goNoticefirst }" >[처음]</a>
			
			
			<c:url var="goNoticeMinus" value="/boader/notice" >
					<c:if test="${nowPage -1 ne 0}">
					<c:param name="page" value="${nowPage -1 }" /></c:if>
					<c:param name="count" value="${count }" />
			</c:url>
		
			<c:if test="${nowPage eq 1 }">
				[이전] 
			</c:if>
			<c:if test="${nowPage ne 1 }" >
				 <a href="${goNoticeMinus }" >[이전]</a>
			</c:if>
			<c:forEach var="p" begin="1" end="${endPage }" >	
				<c:url var="goNotice" value="/boader/notice" >
					<c:param name="page" value="${p }" />
					<c:param name="count" value="${count }" />
				</c:url>
				<c:if test="${p eq nowPage }">
					<span style="font-size:20px; color:red;">[${p }]</span>
				</c:if>
				<c:if test="${p ne nowPage }">
					<a href="${goNotice }">[${p }]</a>
				</c:if>
			</c:forEach>
			<c:url var="goNoticePlus" value="/boader/notice" >
					<c:param name="page" value="${ nowPage + 1 }" />
					<c:param name="count" value="${count }" />
			</c:url>
             <c:if test ="${nowPage eq endPage }">
             	[다음]
             </c:if>
              <c:if test ="${nowPage ne endPage }">
             	<a href="${goNoticePlus }">[다음]</a>
             </c:if>
		
			<c:url var="goNoticeList" value="/boader/notice" >
					<c:param name="page" value="${endPage }" />
					<c:param name="count" value="${count }" />

			</c:url>
				<a href="${goNoticeList }">[끝]</a>
		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
		</div>	
		
		

	<!-- 	<form id="boardSearchForm" name="" action="/board/free/list.html"
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
						
						</select> <input id="search" name="search" fw-filter="" fw-label=""
							fw-msg="" class="inputTypeText" value="" type="text"> <a
							href="#none" onclick="BOARD.form_submit('boardSearchForm');"
							style="padding: 3px 12px 6px 12px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px; font-family: 'Roboto', sans-serif;">search</a>
					</p>
				</fieldset>
			</div>
		</form> -->
	<!-- 
	</div> -->


</body>
</html>