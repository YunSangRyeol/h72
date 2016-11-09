<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<title>detail_view</title>
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
			class="xans-element- xans-board xans-board-readpackage-1002 xans-board-readpackage xans-board-1002 ">
			<div
				class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
				<div class="title">
					<h2
						style="font-family: 'Helvetica', sans-serif; font-weight: 700; letter-spacing: 2px; text-transform: uppercase;">
						<span
							style="font-family: 'Helvetica', sans-serif; font-weight: 700; letter-spacing: 2px; text-transform: uppercase;">NOTICE</span>
						<br> <a href="<c:url value="/boader/notice_list"/>">공지사항</a>
						<a href="<c:url value="/boader/qna_list"/>">Q&A</a><br> <br>
				</div>
			</div>
			<!-- 글 내용-->
			<form id="NoticeDel" name="NoticeDel" action="../notice_delete.do"
				method="get" >
				<tr><input type="text" style="display:none;" id="noticeNo" name="noticeNo" value="${list.noticeNo }"></tr>
									<tr><input type="text" style="display:none;" id="noticeTitle" name="noticeTitle" value="${list.noticeTitle }"></tr>
									<tr><input type="text" style="display:none;" id="noticeContent" name="noticeContent" value="${list.noticeContent }"></tr>
					<div
					class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002">

					<div class="boardView ">
						<table border="1" summary="">
							<caption>게시판 상세</caption>
							<tbody>
									
								<tr>
									<th scope="row">제목</th>
									<td class="noticeTitle"><a
										href="notice_detail_view?noticeNo=${list.noticeNo}">${list.noticeTitle}</a>
									</td>	</tr>
								<tr>
									<th scope="row">작성일</th>
									<td class="enrolldate">${list.enrolldate}</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="detail"
											style="text-align: left; line-height: 1.8; padding: 40px;">
											<p align="center">
											${list.noticeContent}</p>

										</div>
									</td>
								</tr>
								<!-- <tr class="displaynone">
									<th scope="row">비밀번호</th>
									<td><input id="password" name="password" fw-filter=""
										fw-label="비밀번호" fw-msg=""
										onkeydown="if (event.keyCode == 13 || event.which == 13) { return false; }"
										value="" type="password"> <span class="info"> <img
											src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/ico_warning.gif"
											alt=""> 수정 및 삭제하려면 비밀번호를 입력하세요.
									</span></td>
								</tr> -->
							</tbody>
						</table>
					</div>
					<div class="btnArea ">
						<span class="left"><a href="<c:url value="/boader/notice_list"/>"
							style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;">목록</a></span>
						&nbsp;&nbsp;
						<c:if test="${loginUser.userid eq 'ADMIN' }"> 
					<a
							href="<c:url value="/boader/notice_update_view?noticeNo=${list.noticeNo}"/>"type="button" class="btn btn-primary btn-block"
							style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;">수정</a>
					<input type="submit" value="삭제" class="btn btn-primary"
							style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;"/>&nbsp;&nbsp;
						
							</c:if> 
					</div>
				</div>
			</form>
		</div>


	</div>
	

	</div>
</body>
</html>
