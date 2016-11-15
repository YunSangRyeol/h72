<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID/PASSWORD FIND</title>
<link href="/h72/resources/css/mSearch.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript"
	src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<script>
	$(function() {

		$('#FindsearchBtn')
				.click(
						function() {
							var userid = $(".findId").val();
							var username = $(".findName").val();
							var useremail = $(".findEmail").val();
							var yn = ${"#hiddenOk"}.val();
							var re_mail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*[\w-]{0,66})\.([a-zA-Z]{2,6}(?:\.[a-zA-Z]{2})?)$/; // 이메일검사식

							if (userid == "" || username == ""
									|| useremail == "") {
								alert("아이디, 이름, 이메일을 정확하게 입력하세요");
								return false;
							} else if (!re_mail.test(useremail)) {
								alert('이메일 주소가 유효하지 않습니다');
								return false;
							} else if (yn == null || yn=="") {
								alert('일치하는 정보가 존재하지 않습니다.');
							} else {
								findPwd.submit();
							}
						});
	});
</script>
</head>
<body id="mSearch">
	<div id="mSearch_content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp" flush="false" />

		<div class="mSearch_contents" align="center">
			<div class="mSearch_titleArea">
				<h2>FIND PASSWORD</h2>
			</div>
			<div class="mSearch_input">
				<form id="findPwd" class="findPwd" action="../searchPw.do"
					method="post">
					<input type="hidden" id="hiddenOk" value="${user }">
					<p id="mSearch_name_view" class="userid">
						<strong id="userid_lable">아이디</strong> <input id="userid"
							name="userid" class="findId" type="text">
					</p>
					<p id="mSearch_name_view" class="name">
						<strong id="name_lable">이름</strong> <input id="name" name="name"
							class="findName" type="text">
					</p>
					<p id="mSearch_email_view" class="email" style="display: block;">
						<strong>이메일</strong> <input id="email" name="email"
							class="findEmail" type="text">
					</p>
					<br> <input type="button" id="FindsearchBtn"
						class="
						searchBtn" value="확인"
						style="width: 120px; height: 40px; cursor: pointer; padding: 7px 22px 7px 22px; background: #000; border: 1px solid #000; color: #fff; font-size: 11px;" />

				</form>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>