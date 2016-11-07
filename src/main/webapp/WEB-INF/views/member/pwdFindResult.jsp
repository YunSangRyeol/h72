<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>H72</title>
<link href="/h72/resources/css/mSearchResult.css" type="text/css"
	rel="stylesheet">
</head>
<body id="mSearch_result">
	<div id="mSearch_result_content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp" flush="false" />

		<div class="mSearch_result_contents" align="center">
			<div class="mSearch_result_titleArea">
				<h2>FIND ID</h2>
			</div>
			<div class="mSearch_result_info">
				<ul>
					<li><strong><u>${user.name }</u></strong>님의 비밀번호 찾기 결과</li>
					<li><strong><u>${user.email }</u></strong></li>
					<li><label>해당 메일로 보내드렸습니다.</label><br></li>
					<li>${user.userpass }</li>

				</ul>
			</div>
			<p class="mSearch_result_button">
				<a id="mSearch_result_btn1" href="<c:url value="member/loginPage" />"
					style="padding: 7px 22px 7px 22px; background: #000; border: 1px solid #000; color: #fff; font-size: 11px;"
					class="">로그인</a>
			</p>


		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>