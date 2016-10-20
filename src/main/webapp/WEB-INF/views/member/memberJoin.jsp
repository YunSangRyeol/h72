<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>MemberJoin</title>
<style type="text/css">
html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre,
	code, form, fieldset, legend, input, textarea, p, blockquote, th, td,
	img {
	margin: 0 auto;
	padding: 0;
	border: none;
}
</style>
</head>
<body id="main">
		<jsp:include page="/WEB-INF/views/main_header.jsp" flush="false" />
		<div class="main_contents" align="center">
		회원가입
		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
</body>
</html>