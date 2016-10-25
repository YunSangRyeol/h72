<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID/PASSWORD FIND</title>
<link href="/h72/resources/css/mSearch.css" type="text/css"
	rel="stylesheet">
</head>
<body id="mSearch">
	<div id="mSearch_content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp" flush="false" />

		<div class="mSearch_contents" align="center">
			<div class="mSearch_titleArea">
				<h2>FIND PASSWORD</h2>
			</div>
			<div class="mSearch_input">
			<p id="mSearch_name_view" class="userid">
					<strong id="userid_lable">아이디</strong> <input id="userid" name="userid"
						fw-filter="" fw-label="아이디" fw-msg="" class="lostInput" value=""
						type="text">
				</p>
				<p id="mSearch_name_view" class="name">
					<strong id="name_lable">이름</strong> <input id="name" name="name"
						fw-filter="" fw-label="이름" fw-msg="" class="lostInput" value=""
						type="text">
				</p>
				<p id="mSearch_email_view" class="email" style="display: block;">
					<strong>이메일</strong> <input id="email" name="email"
						fw-filter="isEmail" fw-label="이메일" fw-msg="" class="lostInput"
						value="" type="text">
				</p><br>
				<p class="mSearch_button">
					<a href="#none"
						onclick="findId.action('jjukbbang1' , 'kcp'); return false;"
						style="padding: 7px 22px 7px 22px; background: #000; border: 1px solid #000; color: #fff; font-size: 11px;">확인</a>
				</p>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>