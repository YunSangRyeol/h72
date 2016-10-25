<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
					<li><strong><span>윤상렬</span></strong>님의 비밀번호 찾기 결과
					</li>
					<li><span>ysr9393@naver.com</span></li>
					<li><label>해당 메일로 보내드렸습니다.</label><br></li>
				
				</ul>
			</div>
			<p class="mSearch_result_button">
				<a id="mSearch_result_btn1" href="loginPage"
					style="padding: 7px 22px 7px 22px; background: #000; border: 1px solid #000; color: #fff; font-size: 11px;"
					class="">로그인</a>
			</p>


		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>