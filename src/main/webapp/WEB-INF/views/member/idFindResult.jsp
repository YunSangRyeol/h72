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
					<li>이름 : <strong><span>윤상렬</span></strong>
					</li>
					<li>이메일 : <span>ysr9393@naver.com</span></li>
					<li><label><input type="radio" name="fid"
							onclick="set_findpwdid( 'ysr9393' , 'indi' );" checked="">
							<span class="id">ysr9393</span>(<span class="gaip">2016-10-24
								가입 </span>)</label><br></li>
					<li>고객님 즐거운 쇼핑 하세요!</li>
				</ul>
			</div>
			<p class="mSearch_result_button">
				<a id="mSearch_result_btn1" href="loginPage"
					style="padding: 7px 22px 7px 22px; background: #000; border: 1px solid #000; color: #fff; font-size: 11px;"
					class="">로그인</a> <a id="mSearch_result_btn2" href="pwdFindPage"
					style="padding: 7px 22px 7px 22px; background: #f7f7f7; border: 1px solid #e7e7e7; color: #000; font-size: 11px;"
					class="">비밀번호 찾기</a>
			</p>


		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>