<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="/h72/resources/css/notice.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$('#upqTitle').val('${list.qTitle}')
	
});


</script>

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
						<br> <c:url var="goNotice" value="/boader/notice" >
								<c:param name="page" value="1" />
								<c:param name="count" value="10" />
								</c:url>
						<a href="${goNotice}">공지사항</a>
						
							<c:url var="goQnA" value="/boader/qna" >
								<c:param name="page" value="1" />
								<c:param name="count" value="10" />
							</c:url>
						<a href="${goQnA} ">Q&A</a><br> <br>
				</div>
			</div>
			
			
			<form id="QnAUp" name="QnAUp" action="../qna_up.do"
				method="get" >
				
				<div
					class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002">

					<!-- <div class="boardView "> -->
					<table border="1" summary="">
						<caption>qna등록</caption>
						<tr><input type="text" style="display:none;" id="qNo" name="qNo" value="${list.qNo }"></tr>

						<tr>
								<tr>
									<th>제목</th>
									<td><input type="text" name="upqTitle" id="upqTitle" style="width:100%;"></td>
									</tr>
						<tr>
							<td>&nbsp; 내용</td>
							<td><textarea cols="50" rows="7" name="upqContent" id="upqContent"  disabled style="width:100%;">${list.qContent }
					
							
							</textarea></td>
						</tr>
						
						<tr>
							<td>&nbsp; 답변</td>
							<td><textarea cols="100" rows="7" name="answerContent" id="answerContent" style="width:100%;">
							
							</textarea></td>
						</tr>

					</table>
				</div>
				<div class="btnArea" align="center">
					<input type="submit" value="저장" class="btn btn-primary"
						style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; letter-spacing: 1px; font-size: 11px;" />&nbsp;&nbsp;
					<span><a href="<c:url value="/boader/qna_list"/>"
						style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e 7; color: #000; letter-spacing: 1px; font-size: 11px;">취소</a></span>

				</div>
			</form>
		</div>
	</div>
			
			
			
			
			
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>