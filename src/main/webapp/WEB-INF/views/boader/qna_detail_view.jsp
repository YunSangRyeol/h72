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
						<br><c:url var="goNotice" value="/boader/notice" >
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
			<!-- 글 내용-->
			<form id="QnADel" name="QnADel" action="../qna_delete.do"
				method="get">
				<tr><input type="text" style="display:none;" id="qNo" name="qNo" value="${list.qNo }"></tr>
									<tr><input type="text" style="display:none;" id="qTitle" name="qTitle" value="${list.qTitle }"></tr>
									<tr><input type="text" style="display:none;" id="qContent" name="qContent" value="${list.qContent }"></tr>
									<tr><input type="text" style="display:none;" id="answerContent" name="answerContent" value="${list.answerContent }"></tr>
			<div
					class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002">

					<div class="boardView ">
						<table border="1" summary="">
							<caption>공지 상세</caption>
							<tbody>
							
									<tr>
									<th scope="row">제목</th>
									<td class = "QTitle"><a
									href="qna_detail_view?qNo=${list.qNo}">${list.qTitle}</a>
									</td>
								</tr>
								<%-- <tr>
									<th scope="row">작성자</th>
									<td class="qWriter">${list.qWriter}</td>
								</tr> --%>								
								<tr>
									<th scope="row">작성일</th>
									<td class="qDate">${list.qDate}</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="detail"
											style="text-align: left; line-height: 1.8; padding: 40px;">
											<p align="center">
											${list.qContent}</p>
											<br><br><br><br>


											<c:if test="${!(list.answerContent eq null)}">
											<p align="center">
											${list.answerContent}</p>
										
											</c:if>

										</div>
									</td>
								</tr>
	
							</tbody>
						</table>
					</div>
					<div class="btnArea ">
				<span class="left"><a href="<c:url value="/boader/qna_list"/>"
							style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;">목록</a></span>
						&nbsp;&nbsp;
						<c:if test="${loginUser.userid eq 'ADMIN' }">
						<a  href="<c:url value="/boader/qna_answer?qNo=${list.qNo}"/>"
							type="button"  class="btn btn-primary btn-block"
							style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;">답변</a>
							</c:if>
							<c:if test="${loginUser.userid eq 'ADMIN'}">
							<%-- <c:if test="${loginUser.userid eq 'ADMIN' || loginUser.userid eq qWriter }"> --%>
						<input type="submit" value="삭제" class="btn btn-primary"
							style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;"/>
						<%-- <a
							href="<c:url value="/boader/qna_update_view?qNo=${list.qNo}"/>"type="button"
							class="left"
							style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;">수정</a>
				 --%>
						
					</c:if>
					</div>
				</div>
			</form>
		</div>

	<!-- 	<div
			class="xans-element- xans-board xans-board-commentpackage-1002 xans-board-commentpackage xans-board-1002 ">
			코멘트 리스트
			코멘트 페이징
			댓글 수정
			<form id="commentForm" name=""
				action="/exec/front/Board/CommentUpdate/1" method="post"
				enctype="multipart/form-data" style="display: none;">
				<input id="board_no" name="board_no" value="1" type="hidden">
				<input id="no" name="no" value="620208" type="hidden"> <input
					id="comment_no" name="comment_no" value="" type="hidden"> <input
					id="member_id" name="member_id" value="" type="hidden">
				<div
					class="xans-element- xans-board xans-board-commentform-1002 xans-board-commentform xans-board-1002 ">
					<fieldset>
						<legend>댓글 수정</legend>
						<p>
							password <input id="comment_password" name="comment_password"
								fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value=""
								type="password"> <span class="secret displaynone"><label>
									비밀댓글</label></span>
						</p>
						<div class="view">
							<textarea id="comment_modify" name="comment_modify"
								fw-filter="isFill" fw-label="댓글내용" fw-msg=""></textarea>
							<span class="submit"> <a href="#none"
								onclick="BOARD_COMMENT.comment_update_ok('commentForm');"
								style="display: inline-block; padding: 17px 27px 17px 27px; background: #fff; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;">수정</a>
								<a href="#none"
								onclick="BOARD_COMMENT.comment_cancel_ok('commentForm');"
								style="display: inline-block; padding: 17px 27px 17px 27px; background: #fff; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;">취소</a>
							</span>
						</div>
						<p class="displaynone">/ byte</p>
					</fieldset>
				</div>
			</form>
			비밀글 확인
			<form id="commentSecretForm" name=""
				action="/exec/front/Board/CommentSecret/1" method="post"
				enctype="multipart/form-data" style="display: none;">
				<input id="board_no" name="board_no" value="1" type="hidden">
				<input id="comment_no" name="comment_no" value="" type="hidden">
				<input id="pass_check" name="pass_check" value="F" type="hidden">
				<div
					class="xans-element- xans-board xans-board-commentformsecret-1002 xans-board-commentformsecret xans-board-1002 ">
					<p>
						비밀번호 : <input id="secure_password" name="secure_password"
							fw-filter="isFill" fw-label="댓글비밀번호" fw-msg="" value=""
							type="password"> <a href="#none"
							onclick="BOARD_COMMENT.show_secret_comment('commentSecretForm');"><img
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_ico_submit.gif"
							alt="확인"></a> <a href="#none"
							onclick="BOARD_COMMENT.hide_secret_comment_form('commentSecretForm');"><img
							src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_ico_cancel.gif"
							alt="취소"></a>
					</p>
				</div>
			</form>

		</div>
 -->
<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>