<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Member Info</title>
<link href="/h72/resources/css/admin.css" type="text/css" rel="stylesheet">
<link href="/h72/resources/css/mJoin.css" type="text/css" rel="stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	//email 주소 변경시 eamil2 값 변경
	$(function(){
		$('#emailSelect').change(function(){
			$('#email2').val( $('#emailSelect').val());
		});
	
	//기본 비밀번호 확인
		var myPwdCheck= false;
	$("#userpass").blur(function(){
		var myPassword = $("#userpass").val();
		var myPasswordCheck = "${loginUser.userpass }";
		if(myPassword.length !=0){
			if(myPassword != myPasswordCheck){
				$('#nowPwLabel').show();
			}else{
				$('#nowPwLabel').hide();
				myPwdCheck = true;
			}
		}
	});	
		
	//새 비밀번호 유효성 검사	
	$("#userpassNew").blur(function(){
		var myPassword = $("#userpassNew").val();				
		if(myPassword.length !=0){
			if((myPassword.length > 0 && myPassword.length < 10)){
				$('#newPwLabel').show();
			}else{
				$('#newPwLabel').hide();
				newPwd = true;
			}
		}
	});
	
	var newPwd = false; //입력한 비밀번호가 유효성에 적합한지 체크
	$("#userpassNew").blur(function(){ //비밀번호 입력칸 옆에 사용가능여부 표시
		var userpass = $("#userpassNew").val();		
		var re_pwNum = userpass.search(/[0-9]/g); //숫자
		var re_pwEng = userpass.search(/[a-z]/ig); //영문
		var re_pwSpe = userpass.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); //특문
		var re_pwSpace = userpass.search(/[\s]/gi); //공백
		if(userpass.length !=0){
			if((userpass.length > 0 && userpass.length < 10)){ //길이 체크
				$('#newPwLabel').show();
				pwResult = false;

			} else if (re_pwSpace >=0) {	//공백 여부
				$('#newPwLabel').show();
				pwResult = false;

			} else if (re_pwNum < 0 || re_pwEng < 0 || re_pwSpe < 0) { //숫자, 영문, 특문 포함되어있는지
				$('#newPwLabel').show();
				pwResult = false;

			} else{	//모든 조건 적합할 때
				$('#newPwLabel').hide();
				pwResult = true;
			}
		}
	});
	
	//새 비밀번호 확인
	var newPwdCheck= false;
	$("#userpass_confirm").blur(function(){
		var newPassword = $("#userpassNew").val();
		var newPasswordCheck = $('#userpass_confirm').val();
		if(newPasswordCheck.length !=0){
			if(newPasswordCheck != newPassword){
				$('#newPwLabelOK').show();
			}else{
				$('#newPwLabelOK').hide();
				newPwdCheck = true;
			}
		}
	});	
	
	//submit 작동 확인
	$('#updateMember').click(function(){
		if (!myPwdCheck) {
			alert("비밀 번호를 확인해주세요.");
			modifyForm.mypage_loginUserPwd.focus();
		} else if(!newPwd){
			alert("변경할 비밀번호를 입력해주세요");
			modifyForm.userpassNew.focus();
		} else if(!newPwdCheck){
			alert("새로운 비밀번호가 일치하지 않습니다.");
			modifyForm.userpass_confirm.focus();
		} else{
			modifyForm.submit();
		}
	});
	
		
	$('#deleteMember').click(function(){
		if(myPwdCheck){
			if(confirm("적립된 포인트는 소멸되며, 더이상 주문 내역을 확인/변경하실 수 없습니다. 정말 탈퇴하시겠습니까?")){
				location.href="/h72/deleteMe.do";
			}else{
				return false;
			}
		}else{
			alert("비밀번호를 확인해주세요");
		}
	});
	
	});//document.ready 
</script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(
							data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g
										.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName
									: data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' ('
									+ extraRoadAddr
									+ ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document
								.getElementById('postnum').value = data.zonecode; //5자리 새우편번호 사용
						document
								.getElementById('address').value = fullRoadAddr;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document
									.getElementById('address').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr
									+ ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document
									.getElementById('address').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr
									+ ')';

						} else {
							document
									.getElementById('address').innerHTML = '';
						}
					}
				}).open();
	}
</script>
</head>
<body id="mjoin">
	<div id="mjoin_content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp" flush="false" />
		<div class="mjoin_contents" align="center">
			<div class="mjoin_titleArea">
				<h2>My Information</h2>
			</div>
			<div class="mjoin_form">
			<form id="modifyForm" method="post" action="/h72/mModify.do">
				<h3>기본정보</h3>
				<p class="mjoin_required">
					<span id="mjoin_red">*</span> 필수입력사항
				</p>
				<div class="mjoin_boardWrite">
					<table border="1" summary="">
						<tbody>
							<tr>
								<th scope="row">기존 비밀번호 <span id="mjoin_red">*</span></th>
								<td><input id="userpass"  maxlength="16" type="password"> 
								<label id="nowPwLabel" style="color:red; display:none;">&nbsp; 비밀번호가 일치하지 않습니다.</label></td>
							</tr>
							<tr>
								<th scope="row">새로운 비밀번호 <span id="mjoin_red">*</span></th>
								<td><input id="userpassNew" name="userpassNew" maxlength="16" type="password"> 
								<label id="newPwLabel" style="color:red; display:none;">&nbsp; 사용불가</label>&nbsp; (영문 대소문자/숫자/특수문자, 10~16자)</td>
							</tr>	
							<tr>
								<th scope="row">새로운 비밀번호 확인 <span id="mjoin_red">*</span></th>
								<td><input id="userpass_confirm" maxlength="16"
									 type="password">
									<label id="newPwLabelOK" style="color:red; display:none;">&nbsp; 비밀번호가 일치하지 않습니다.</label></td>
							</tr>
							<tr>
								<th scope="row">주소 <span id="mjoin_red">*</span></th>
								<td><input type="text" id="postnum" name="postnum" placeholder="우편번호" value="${loginUser.postnum }">
									<input type="button" id="postFindBtn"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
									<input type="text" id="address" name="address" placeholder="주소" value="${loginUser.address }" readonly><br>
									<input type="text" id="addressDetail" name="addressDetail" placeholder="상세주소" value="${loginUser.addressdetail }">
									<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
									</td>
							</tr>

							<tr>
							<c:set var="tempPhone" value="${loginUser.phone }"/>
							<c:set var="phoneF" value="${fn:substring(tempPhone, 0, tempPhone.indexOf('-'))}" />
							<c:set var="phoneM" value="${fn:substring(tempPhone, tempPhone.indexOf('-')+1, tempPhone.lastIndexOf('-'))}" />
							<c:set var="phoneL" value="${fn:substring(tempPhone, tempPhone.lastIndexOf('-')+1, tempPhone.length()) }" />
								<th scope="row">휴대전화 <span id="mjoin_red">*</span></th>
								<td><select id="phone1" name="phone1"
									fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N"
									fw-msg="" >
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select>
								-<input id="phone2" name="phone2" maxlength="4"value="${phoneM }" type="text">
								-<input id="phone3" name="phone3" maxlength="4" type="text" value="${phoneL }"></td>
							</tr>

							<tr>
							<c:set var="tempEmail" value="${loginUser.email }"/>
							<c:set var="emailFront" value="${fn:substring(tempEmail, 0, tempEmail.indexOf('@'))}" />
							<c:set var="emailBack" value="${fn:substring(tempEmail, tempEmail.indexOf('@')+1, tempEmail.length() )}" />
								<th scope="row">이메일 <span id="mjoin_red">*</span></th>
								<td><input id="email1" name="email1" value="${emailFront }" type="text">@
								<input id="email2" name="email2" value="${emailBack }" type="text">
									<select name="email3" id="emailSelect">
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
				<div id="mupdate_btnArea">
				<input type="button" id="updateMember" class="userUpBtn" value="변경하기">
				 &nbsp;  &nbsp;  &nbsp; 
				<input type="button" id="deleteMember" class="userUpBtn" value="탈퇴하기">
				</div>
			</form>
		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>
