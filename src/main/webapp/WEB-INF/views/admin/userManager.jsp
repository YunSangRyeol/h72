<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function() {
		//회원 검색시 검색 text와 submit버튼 변경
		$('#searchhow').change(
				function() {
					$('#searchID')[($("option[value='searchid']")
							.is(":checked")) ? "show" : "hide"]();
					$('#searchNickname')[($("option[value='searchnick']")
							.is(":checked")) ? "show" : "hide"]();
					$('#searchDate')[($("option[value='searchdate']")
							.is(":checked")) ? "show" : "hide"]();
				});
	});

</script>
<body>



				<div id="mypage_usersearch">
					<div  id="searchhow">
						<select class="searchhow_select">
							<option value="searchid" selected> &nbsp; I &nbsp;D  </option>
							<option value="searchnick">닉네임</option>
							<option value="searchdate">가입일</option>
						</select>
					 	&nbsp; 
					</div> 
					
					<div id="searchID">
						<form action="/easyStudy/searchuserid" method="post">
							<input type="text" name="userid" size="30"> &nbsp; <input
								type="submit" value="검색" class="mypage_userM_searchBtn">
						</form>
					</div>

					<div id="searchNickname" style="display: none">
						<form action="/easyStudy/searchnickname" method="post">
							<input type="text" name="nickname" size="30"> &nbsp; <input
								type="submit" value="검색" class="mypage_userM_searchBtn">
						</form>
					</div>

					<div id="searchDate" style="display: none">
						<form action="/easyStudy/searchenroll_date" method="post">
							<input type="date" name="start"> ~ <input type="date"
								name="end"> &nbsp; <input type="submit" value="검색"
								class="mypage_userM_searchBtn">
						</form>
					</div>
				</div>


</body>
</html>