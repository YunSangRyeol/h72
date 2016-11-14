<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>User Info</title>
<link href="/h72/resources/css/mJoin.css" type="text/css" rel="stylesheet">
<link href="/h72/resources/css/admin.css" type="text/css" rel="stylesheet">
</head>
<body id="detail">
	<div id="mjoin_content_wrap">
		<div class="mjoin_contents" align="center">
			<div class="detail_title">
				<h2>user Information</h2>
			</div>
			<div class="userDetail_form">
				<p class="mjoin_required">
				</p>
				<div class="mjoin_boardWrite">
					<table border="1" summary="">
						<tbody>
							<tr>
								<th scope="row">회원 이름</th>
								<td>${user.name }</td>
							</tr>
							<tr><th scope="row">회원 레벨</th>
								<td>${user.levelcode }</td>
							</tr>
							<tr><th scope="row">회원 생일</th>
								<td>${user.birthdate }</td>
							</tr>
							<tr>
								<th scope="row">주소 </th>
								<td>${user.postnum }<br>
									${user.address }<br>
									${user.addressdetail }
									</td>
							</tr>
							<tr>
								<th scope="row">휴대전화 </th>
								<td>${user.phone }</td>
							</tr>
							<tr>
								<th scope="row">이메일 </th>
								<td>${user.email }
								</td>
							</tr>
							<tr><th scope="row">가입일</th>
								<td>${user.enrolldate }</td>
							</tr>
							<tr><th scope="row">포인트</th>
								<td>${user.point }</td>
							</tr>
							<tr><th scope="row">적립비율</th>
								<td>${user.pointRate }</td>
							</tr>							
						</tbody>
					</table>
				</div>
				</div>
</body>
</html>
