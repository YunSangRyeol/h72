<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
				<h2>FIND ID</h2>
			</div>
			<div class="mSearch_input">
				<form class="findId" action="../searchId.do" method="post">
					<p id="mSearch_name_view" class="findIdName">
						<strong id="name_lable">이름</strong> <input id="findIdName"
							name="name" class="lostInput" type="text">
					</p>
					<p id="mSearch_birth_view" class="findIdBirth"
						style="display: block;">
						<strong>생년월일</strong> <input id="findIdBirth" name="birthdate"
							type="date"> 입력 예) 2000/01/01
					</p>
					<br> <input type="submit" class="searchBtn" value="확인"
						style="width: 120px; height: 40px; cursor: pointer; padding: 7px 22px 7px 22px; background: #000; border: 1px solid #000; color: #fff; font-size: 11px;" />

				</form>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>