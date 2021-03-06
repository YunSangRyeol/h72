$(document).ready(function() {
	$('#chkDupId').click(function() { // 중복검사 버튼 클릭시
		var userid = $("#userid").val(); // 아이디값 받아옴

		var re_id = /^[a-zA-Z0-9]{5,10}$/; // 아이디 검사식
		var re_id_allNum = /^[0-9]/; // 아이디에 숫자만 있는지 검사
		
		if (userid == "") {
			alert('아이디를 입력하세요.');
			return false;
		} else if (!re_id.test(userid)) {
			alert('5~10자 사이의 영문/숫자만 입력가능합니다.');
			return false;
		} else if (re_id_allNum.test(userid)) {
			alert('아이디는 영문을 포함해야 합니다.\n첫 글자는 영문자로 작성 해주세요.');
			return false;
		} else if (re_id.test(userid) && !re_id_allNum.test(userid)) {
			$.ajax({
				type : "POST",
				url : "/h72/chkDupId.do",
				data : {
					"userid" : userid
				},
				success : function(result) {
					if (result == 1) {
						alert("이미 사용중인 아이디 입니다.");
						return false;
					} else {
						alert('사용 가능한 아이디 입니다.');
						return true;
					}
				}
			});
		}
	});
	var pwResult = false; //입력한 비밀번호가 유효성에 적합한지 체크
	$("#userpass").blur(function(){ //비밀번호 입력칸 옆에 사용가능여부 표시
		var userpass = $("#userpass").val();		
		var re_pwNum = userpass.search(/[0-9]/g); //숫자
		var re_pwEng = userpass.search(/[a-zA-Z]/ig); //영문
		var re_pwSpe = userpass.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); //특문
		var re_pwSpace = userpass.search(/[\s]/gi); //공백
		if(userpass.length !=0){
			if((userpass.length > 0 && userpass.length < 8)){ //길이 체크
				$('#newPwLabel1').hide();
				$('#newPwLabel').show();
				$('#samePw').hide();
				$('#samePw1').hide();
				pwResult = false;

			} else if (re_pwSpace >=0) {	//공백 여부
				$('#newPwLabel1').hide();
				$('#newPwLabel').show();
				$('#samePw').hide();
				$('#samePw1').hide();
				pwResult = false;

			} else if (re_pwNum < 0 || re_pwEng < 0 || re_pwSpe < 0) { //숫자, 영문, 특문 포함되어있는지
				$('#newPwLabel1').hide();
				$('#newPwLabel').show();
				$('#samePw').hide();
				$('#samePw1').hide();
				pwResult = false;

			} else{	//모든 조건 적합할 때
				$('#newPwLabel').hide();
				$('#newPwLabel1').show();
				pwResult = true;
			}
		}
	});
	$("#userpass_confirm").blur(function(){ //비밀번호 확인 옆에 일치 여부 표시
		var userpass = $("#userpass").val();		
		var userpass_confirm = $("#userpass_confirm").val();		
		if(pwResult == true){	//비밀번호가 유효성조건에 적합할 때   
			if(userpass == userpass_confirm){	//비밀번호가 서로 일치하면
				$('#samePw').hide();
				$('#samePw1').show();
			
			}else {	//일치하지 않음
				$('#samePw').show();
				$('#samePw1').hide();
			}
		}else{	//비밀번호가 유효성조건 부적합할때 일치여부 숨김
			$('#samePw').hide();
			$('#samePw1').hide();
		}
	});
	$('#joinBtn').click(function() { // 회원가입 버튼 클릭시
		var userid = $("#userid").val(); // 아이디값 받아옴

		var chkDupId = $("chkYN").val();
		var userpass = $("#userpass").val(); // 비밀번호
		var userpass_confirm = $("#userpass_confirm").val(); // 비밀번호 확인
		var name = $("#name").val(); // 이름
		var birthdate = $("#birthdate").val(); // 생년월일
	        
		var postnum = $("#postnum").val(); // 우편번호
		var addressdetail = $("#addressdetail").val(); // 상세주소
		var phone = $("#phone").val(); // 전화번호
		var email = $("#email").val(); // 이메일 
		var agree_service_check0 = $("#agree_service_check0").val(); // 쇼핑몰이용동의
		var agree_privacy_check0 = $("#agree_privacy_check0").val(); // 개인정보활용동의
	
		var re_pwNum = userpass.search(/[0-9]/g);
		var re_pwEng = userpass.search(/[a-z]/ig);
		var re_pwSpe = userpass.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		var re_pwSpace = userpass.search(/[\s]/gi);
		var re_mail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;  // 이메일검사식
		var re_birth = /^([0-9]{4,4})-([0-9]{2,2})-([0-9]{2,2})$/; //생년월일
		var re_tel = /^([0-9]{3,3})-([0-9]{4,4})-([0-9]{4,4})$/; // 전화번호 검사식
		var mjoinResult = $("#mjoinResult").val();
		
		if (userid == "") {
			alert('아이디를 입력하세요.');
			return false;
		}else if(chkDupId == ""){
        	alert("아이디 중복검사 후 가입이 가능합니다.")   	
        	return false;	
        }else if (userpass == "" || userpass_confirm =="") {
    		alert('비밀번호 또는 비밀번호 확인을 입력해 주세요');
    		return false;
		}else if (userpass.length < 8 || userpass.length > 20) {
			alert('비밀번호는 8~20자로 입력하세요.');
			return false;
		}else if(userpass != userpass_confirm){
			alert('비밀번호 확인이 일치하지 않습니다.');
			return false;
		} else if (re_pwSpace >=0) {
			alert("비밀번호는 공백없이 입력해주세요.");
			return false;
		} else if (re_pwNum < 0 || re_pwEng < 0 || re_pwSpe < 0) {
			alert("영문, 숫자, 특수문자를 모두 혼합하여 입력해주세요.");
			return false;
		} else if(birthdate == "") {
            alert('생년월일을 입력해 주세요.');
            return false;
		} else if(!re_birth.test(birthdate)) {
            alert('생년월일 입력형식이 옳지 않습니다. \n 입력 예) 1999-01-01');
            return false;
		}else if( postnum=="" ){
            alert('주소를 입력해 주세요');
            return false;
        }else if( addressdetail=="" ){
            alert('상세주소를 입력해 주세요');
            return false;
        } else if(phone == "") {
            alert('휴대폰 번호를 입력해 주세요.');
            return false;
        } else if(!re_tel.test(phone)) {
            alert('휴대폰 번호 입력형식이 옳지 않습니다 \n 입력 예)010-1234-1234');
            return false;
        } else if(email =="") {
            alert('이메일 주소를 입력해 주세요.');
            return false;
        } else if(!re_mail.test(email)) {
            alert('이메일 주소가 유효하지 않습니다');
            return false;
        } else if(!($("#agree_service_check0").is(":checked"))){
			alert('이용약관 및 정보수집 활용동의에 모두 동의해 주세요.');
            return false;
        } else if(!($("#agree_privacy_check0").is(":checked"))){
        	alert('이용약관 및 정보수집 활용동의에 모두 동의해 주세요.');
            return false;
		}else {
			
			mJoinForm.submit();
			
		}
		
	});

});