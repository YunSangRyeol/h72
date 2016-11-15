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
<link href="/h72/resources/css/notice.css" type="text/css"
	rel="stylesheet">
</head>
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

			</div>
			<div class="boardSort">
				<span
					class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002 "></span>
			</div>
			<div class="boardList">
				<table border="1" summary="">
					<caption>Q&A</caption>
					<colgroup
						class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
						<col style="width: 100px;">
						<col style="width: auto;" >
						<col style="width: 100px;">
						<col style="width: 100px;">
						<col style="width: 100px;">

					</colgroup>
					<thead
						class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
						<tr style="">
							<th scope="col">NO</th>
							<th scope="col">제목</th>
						<!-- 	<th scope="col">작성자</th> -->
							<th scope="col" >작성일</th>
							<th scope="col">답변</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="list" items="${list}">
							<tr>
								<td class="qNo">${list.qNo}</td>
								<td class="qTitle"><a href="qna_detail_view?qNo=${list.qNo}">${list.qTitle}</a>
								</td>
								<%-- <td class="qWriter">${list.qWriter}</td> --%>
								<td class="qDate">${list.qDate}</td>			
								<td class="answer">${list.answer}</td>
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
			<c:if test="${!(loginUser eq null) }">
			<div
				class="xans-element- xans-board xans-board-buttonlist-1002 xans-board-buttonlist xans-board-1002 ">
				<%-- <c:if test="${loginUser.userid eq 'ADMIN' }"> --%>
					
				<a href="<c:url value="/boader/qna_insert"/>"type="button" class="btn btn-primary btn-block"
						style="padding: 7px 22px 7px 22px; background: #000; border: 1px solid #000; color: #fff; letter-spacing: 1px; font-size: 11px;">글쓰기</a>
			
			</div>
			</c:if>
		</div>
		
		<div id="qna_page_list" align="center">
					<c:url var="goQnAfirst" value="/boader/qna" >
					<c:param name="page" value="1" />
					<c:param name="count" value="${count }" />

			</c:url>
				 <a href="${goQnAfirst }" >[처음]</a>
			<c:url var="goQnAMinus" value="/boader/qna" >
			<c:if test="${nowPage -1 ne 0}">
					<c:param name="page" value="${nowPage -1 }" /></c:if>
					<c:param name="count" value="${count }" />

			</c:url>
			
			<c:if test="${nowPage eq 1 }">
				[이전] 
			</c:if>
			<c:if test="${nowPage ne 1 }" >
				 <a href="${goQnAMinus }" >[이전]</a>
			</c:if>
			<c:forEach var="p" begin="1" end="${endPage }" >	
				<c:url var="goQnA" value="/boader/qna" >
					<c:param name="page" value="${p }" />
					<c:param name="count" value="${count }" />
				</c:url>
				<c:if test="${p eq nowPage }">
					<span style="font-size:20px; color:red;">[${p }]</span>
				</c:if>
				<c:if test="${p ne nowPage }">
					<a href="${goQnA }">[${p }]</a>
				</c:if>
			</c:forEach>
			<c:url var="goQnAPlus" value="/boader/qna" >
					<c:param name="page" value="${ nowPage + 1 }" />
					<c:param name="count" value="${count }" />
			</c:url>
             <c:if test ="${nowPage eq endPage }">
             	[다음]
             </c:if>
              <c:if test ="${nowPage ne endPage }">
             	<a href="${goQnAPlus }">[다음]</a>
             </c:if>
		
			<c:url var="goQnAList" value="/boader/qna" >
					<c:param name="page" value="${endPage }" />
					<c:param name="count" value="${count }" />

			</c:url>
				<a href="${goQnAList }">[끝]</a>
		</div>
		</div>	

	<!-- 	
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
						</select> <input id="search" name="search" fw-filter="" fw-label=""
							fw-msg="" class="inputTypeText" value="" type="text"> <a
							href="#none" onclick="BOARD.form_submit('boardSearchForm');"
							style="padding: 3px 12px 6px 12px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px; font-family: 'Roboto', sans-serif;">search</a>
					</p>
				</fieldset>
			</div>
		</form>  -->
		<!-- 관리자 전용 메뉴 -->

		<!-- //관리자 전용 메뉴 -->
		
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>


</body>
</html>