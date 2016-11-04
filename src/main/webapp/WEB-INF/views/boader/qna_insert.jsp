<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>qInsert title here</title>
<link href="/h72/resources/css/notice.css" type="text/css"
	rel="stylesheet">
</head>
<body>
	<div class="content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp" />
	</div><br><br><br>
	
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
					<!-- <div class="boardView "> -->
					<table border="1" summary="">
						<caption>Q&A등록</caption>

						<tr>
							<td>제목</td>
							<td><input type="text" name="insertqTitle"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea cols="50" rows="7" name="insertqContent"></textarea></td>
						</tr>

					</table>
				</div>
				<div class="btnArea">
					<input type="submit" value="등록" class="btn btn-primary"
						style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;" />&nbsp;&nbsp;
					<span><a href="<c:url value="/boader/qna_list"/>"
						style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;">뒤로</a></span>

				</div></div>
			</form>
		</div>
	</div>
	
	
	
</body>
</html>