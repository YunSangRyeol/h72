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
			<form id="BoardDelForm" name="" action="/exec/front/Board/del/1"
				method="post" enctype="multipart/form-data">
				<input id="no" name="no" value="620208" type="hidden"> <input
					id="bulletin_no" name="bulletin_no" value="403413" type="hidden">
				<input id="board_no" name="board_no" value="1" type="hidden">
				<input id="member_id" name="member_id" value="jjukbbang1"
					type="hidden"> <input id="list_url" name="list_url"
					value="/board/free/list.html?board_no=1" type="hidden"> <input
					id="bdf_modify_url" name="bdf_modify_url"
					value="/board/free/modify.html?board_act=edit&amp;no=620208&amp;board_no=1"
					type="hidden"> <input id="bdf_del_url" name="bdf_del_url"
					value="/exec/front/Board/del/1" type="hidden"> <input
					id="bdf_action_type" name="bdf_action_type" value="" type="hidden">
				<div
					class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002">
					<!--
            $login_page_url = /member/login.html
            $deny_access_url = /board/free/list.html
        -->
					<div class="boardView ">
						<table border="1" summary="">
							<caption>게시판 상세</caption>
							<tbody>
								<tr>
									<th scope="row">제목</th>
									<td class="noticeTitle"><a
										href="notice.do?noticeNo=${list.noticeNo}">${list.noticeTitle}</a>
									</td>
								</tr>

								<tr>
									<th scope="row">작성일</th>
									<td class="enrolldate">${list.enrolldate}</td>
								</tr>

								<tr>
									<td colspan="2">
										<div class="detail"
											style="text-align: left; line-height: 1.8; padding: 40px;">

											<p align="center">
											${list}
												
											</p>

										</div>
									</td>
								</tr>
								<tr class="displaynone">
									<th scope="row">비밀번호</th>
									<td><input id="password" name="password" fw-filter=""
										fw-label="비밀번호" fw-msg=""
										onkeydown="if (event.keyCode == 13 || event.which == 13) { return false; }"
										value="" type="password"> <span class="info"> <img
											src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/ico_warning.gif"
											alt=""> 수정 및 삭제하려면 비밀번호를 입력하세요.
									</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btnArea ">
						<span class="left"><a href="?board_no=1&amp;page=1"
							style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;">목록</a></span>
						<a href="#none"
							onclick="BOARD_READ.article_delete('BoardDelForm','1');"
							class="displaynone"
							style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;">삭제</a>
						<a
							href="/board/free/modify.html?board_act=edit&amp;no=620208&amp;board_no=1"
							class="displaynone"
							style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;">수정</a>
					</div>
				</div>
			</form>
		</div>


		<!-- 비밀글 확인 -->
		<!-- 	<form id="commentSecretForm" name=""
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
			</form> -->

	</div>
	<!-- 
		<div
			class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002 ">
			<ul>
				<li class="prev "><strong>이전글</strong><a
					href="/board/product/read.html?no=622218&amp;board_no=1&amp;page=">10월
						3일 개천절 휴무 안내</a></li>
				<li class="next "><strong>다음글</strong><a
					href="/board/product/read.html?no=613760&amp;board_no=1&amp;page=">10대월드
						프리마켓 공지</a></li>
			</ul>
		</div> -->


	</div>
</body>
</html>
