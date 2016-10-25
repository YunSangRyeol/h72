<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>MemberJoin</title>
<link href="/h72/resources/css/mJoin.css" type="text/css"
	rel="stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	
</script>
</head>
<body id="mjoin">
	<div id="mjoin_content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp" flush="false" />
		<div class="mjoin_contents" align="center">
			<div class="mjoin_titleArea">
				<h2>Member Update</h2>
			</div>
			<div class="mjoin_form">
			<form id="" action="">
				<h3>기본정보</h3>
				<p class="mjoin_required">
					<span id="mjoin_red">*</span> 필수입력사항
				</p>
				<div class="mjoin_boardWrite">
					<table border="1" summary="">
						<tbody>
							<tr>
								<th scope="row">기존 비밀번호 <span id="mjoin_red">*</span></th>
								<td><input id="userpass" name=""
									userpass""
									fw-filter="isFill&amp;isMin[4]&amp;isMax[16]"
									fw-label="비밀번호" fw-msg="" autocomplete="off" maxlength="16"
									0="disabled" value="" type="password"> (영문
									대소문자/숫자/특수문자, 10~16자)</td>
							</tr>
							<tr>
								<th scope="row">비밀번호 <span id="mjoin_red">*</span></th>
								<td><input id="userpass" name=""
									userpass""
									fw-filter="isFill&amp;isMin[4]&amp;isMax[16]"
									fw-label="비밀번호" fw-msg="" autocomplete="off" maxlength="16"
									0="disabled" value="" type="password"> (영문
									대소문자/숫자/특수문자, 10~16자)</td>
							</tr>
							<tr>
								<th scope="row">비밀번호 확인 <span id="mjoin_red">*</span></th>
								<td><input id="userpass_confirm" name="userpass_confirm"
									fw-filter="isFill&amp;isMatch[passwd]" fw-label="비밀번호 확인"
									fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16"
									0="disabled" value="" type="password"></td>
							</tr>
							<tr>
								<th scope="row">이름 <span id="mjoin_red">*</span></th>
								<td><input id="nickName" name="nickName"
									fw-filter="isFill&amp;isFill&amp;isMin[2]&amp;isMax[10]&amp;isIdentity"
									fw-label="닉네임" fw-msg="" class="inputTypeText" value=""
									type="text"> (한글/영문/숫자 2~10자, 특수문자 불가능)</td>
							</tr>
							<tr class="">
								<th scope="row">생년월일 <span id="mjoin_red">*</span></th>
								<td><input id="birthDate" name="birthDate"
									fw-filter="isFill" fw-label="생년월일" fw-msg=""
									class="inputTypeText" type="date"></span></td>
							</tr>
							<tr>
								<th scope="row">주소 <span id="mjoin_red">*</span></th>
								<td><input type="text" id="postnum" placeholder="우편번호">
									<input type="button" id="postFindBtn"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" id="address" placeholder="주소" readonly><br>
									<input type="text" id="addressDetail" placeholder="상세주소">
									<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
									<script>
										function sample6_execDaumPostcode() {
											new daum.Postcode(
													{
														oncomplete : function(
																data) {
															// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

															// 각 주소의 노출 규칙에 따라 주소를 조합한다.
															// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
															var fullAddr = ''; // 최종 주소 변수
															var extraAddr = ''; // 조합형 주소 변수

															// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
															if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
																fullAddr = data.roadAddress;

															} else { // 사용자가 지번 주소를 선택했을 경우(J)
																fullAddr = data.jibunAddress;
															}

															// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
															if (data.userSelectedType === 'R') {
																//법정동명이 있을 경우 추가한다.
																if (data.bname !== '') {
																	extraAddr += data.bname;
																}
																// 건물명이 있을 경우 추가한다.
																if (data.buildingName !== '') {
																	extraAddr += (extraAddr !== '' ? ', '
																			+ data.buildingName
																			: data.buildingName);
																}
																// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
																fullAddr += (extraAddr !== '' ? ' ('
																		+ extraAddr
																		+ ')'
																		: '');
															}

															// 우편번호와 주소 정보를 해당 필드에 넣는다.
															document
																	.getElementById('postnum').value = data.zonecode; //5자리 새우편번호 사용
															document
																	.getElementById('address').value = fullAddr;

															// 커서를 상세주소 필드로 이동한다.
															document
																	.getElementById(
																			'addressDetail')
																	.focus();
														}
													}).open();
										}
									</script></td>
							</tr>

							<tr>
								<th scope="row">휴대전화 <span id="mjoin_red">*</span></th>
								<td><select id="phone1" name="phone[]"
									fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N"
									fw-msg="">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select>-<input id="phone2" name="phone[]" maxlength="4"
									fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N"
									fw-msg="" value="" type="text">-<input id="phone3"
									name="phone[]" maxlength="4" fw-filter="isNumber&amp;isFill"
									fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text"></td>
							</tr>

							<tr>
								<th scope="row">이메일 <span id="mjoin_red">*</span></th>
								<td><input id="email1" name="email1" fw-filter="isFill"
									fw-label="이메일" fw-alone="N" fw-msg="" value="" type="text">@<input
									id="email2" name="email2" fw-filter="isFill" fw-label="이메일"
									fw-alone="N" fw-msg="" readonly="readonly" value="" type="text"><select
									id="email3" fw-filter="isFill" fw-label="이메일" fw-alone="N"
									fw-msg="">
										<option value="" selected="selected">- 이메일 선택 -</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="yahoo.com">yahoo.com</option>
										<option value="empas.com">empas.com</option>
										<option value="korea.com">korea.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="etc">직접입력</option>
								</select></td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="mjoin_btnArea">
					<a href="#none" onclick="">변경하기</a>
				</div>
				<div class="mjoin_btnArea">
					<a href="#none" onclick="memberJoinAction()">탈퇴하기</a>
				</div>
			</div>
			</form>
		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>
