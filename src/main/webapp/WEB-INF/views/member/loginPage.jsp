<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>MemberJoin</title>
<link href="/h72/resources/css/loginPage.css" type="text/css"
	rel="stylesheet">

</head>
<body id="login">
	<div id="login_content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp" flush="false" />

		<div class="login_contents" align="center">
			<div class="login_titleArea">
				<h2>MEMBERSHIP LOGIN</h2>
			</div>
			<div class="inner">
				<div class="login_inputArea">
					<form id="login_form" name="" action="/exec/front/Member/login/"
						method="post" enctype="multipart/form-data">
						<br> <br> <label>ID</label> <input type="text"
							class="login_inputData" id="userid" name="userid"><br>
						<label>PW</label><input type="password" class="login_inputData"
							id="userpass" name="userpass">
							<a href="#"><span class="loginBtn">LOGIN</span></a>
						<p class="security">
							<img
								src="http://img.echosting.cafe24.com/design/skin/default/member/ico_access.gif"
								alt="보안접속"> 보안접속
						</p>
						<ul>
							<li><a href="#"><strong>아이디</strong>찾기</a></li>
							<li>/</li>
							<li><a href="#"><strong>패스워드</strong>찾기</a></li>
						</ul>
						<br>
						<div class="login_mjoinArea">
							<span> <strong>H72에 오신것을 환영합니다!</strong><br>지금 회원가입시
								회원만의 <br>특별한 혜택을 받으실 수 있습니다.
							</span>
							<div class="mjoinBtn">
								<a href="#">회원가입</a>
							</div>
						</div>
					</form>

				</div>
				<div class="login_bannerArea"></div>
				<div class="login_titleArea">
				<h2>MEMBERSHIP BENEFIT</h2>
			</div>
			<div class="login_benefit"></div>
			</div>
			 

		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>