<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ID/PASSWORD FIND</title>
<link href="/h72/resources/css/mSearch.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript"
	src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<script>
	$(function() {

		$('#searchBtn').click(function() {
			var name = $(".inputName").val();
			var birthdate = $(".inputBirth").val();
			var re_birth = /^([0-9]{4,4})-([0-9]{2,2})-([0-9]{2,2})$/; //생년월일

			if (name == "" || birthdate == "") {
				alert("이름, 생년월일을 정확하게 입력하세요");
				return false;
			} else if (!re_birth.test(birthdate)) {
				alert('생년월일 입력형식이 옳지 않습니다. \n 입력 예) 1999-01-01');
				return false;
			} else {
				findIdForm.submit();

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
				<h2>FIND ID</h2>
			</div>
			<div class="mSearch_input">
				<form class="findId" id="findIdForm" action="../searchId.do"
					method="post">
					<p id="mSearch_name_view" class="findIdName">
						<strong id="name_lable">이름</strong> <input id="name" name="name"
							class="inputName" type="text">
					</p>
					<p id="mSearch_birth_view" class="findIdBirth"
						style="display: block;">
						<strong>생년월일</strong> <input id="birthdate" class="inputBirth"
							name="birthdate" type="date"> 입력 예) 2000/01/01
					</p>
					<br> <input type="button" class="searchBtn" id="searchBtn"
						value="확인"
						style="width: 120px; height: 40px; cursor: pointer; padding: 7px 22px 7px 22px; background: #000; border: 1px solid #000; color: #fff; font-size: 11px;" />

				</form>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>