$(document).ready(function(){
	
	//배송지 정보 주문자 정보와 동일
	$("input[name=sameaddr]").change(function(){
		var sameadd = $(this).val();
		
		if(sameadd == 'T'){
			var name = $("#oname").val();
			var post = $("#postnum").val();
			var add = $("#address").val();
			var addDtail = $("#addressDetail").val();
			var phone2_1 = $("#ophone2_1").val();
			var phone2_2 = $("#ophone2_2").val();
			var phone2_3 = $("#ophone2_3").val();
			
			$('#rname').val(name);
			$('#rpostnum').val(post);
			$('#raddress').val(add);
			$('#raddressDetail').val(addDtail);
			$('#rphone2_1').val(phone2_1).prop("selected",true);
			$('#rphone2_2').val(phone2_2);
			$('#rphone2_3').val(phone2_3);
			
			
		}else{
			$('#rname').val("");
			$('#rpostnum').val("");
			$('#raddress').val("");
			$('#raddressDetail').val("");
			$("#rphone2_1 option:eq(0)").attr("selected", "selected");
			$('#rphone2_2').val(phone2_2);
			$('#rphone2_3').val(phone2_3)
			
		}	
			
	});
	
	
	
	//결제 부분
	$("input[name=addr_paymethod]:checked").each(function(){
		$("#payment_input_tcash").each(function() {
			$(this).css('display', 'none');
		});
	});
	
$("input[name=addr_paymethod]").change(function(){
	var radioValue = $(this).val();
	var paylabel = $(this).next("label").text();
	console.log(paylabel);
	
	if (radioValue == "cash") {
		hideExclude('payment_input_cash', paylabel);
	} else if (radioValue == "cell") {
		hideExclude('pg_paymethod_info_pg', paylabel);
	} else if (radioValue == "tcash") {
		hideExclude('payment_input_tcash', paylabel);
	}	else if (radioValue == "card") {
			hideExclude('pg_paymethod_info_pg', paylabel);
	}	
});


function hideExclude(excludeId ,paylabel) {
	console.log(paylabel);
	$("#payment_input_cash").each(function() {
		$(this).css('display', 'none');
	});
	
	$("#payment_input_tcash").each(function() {
		$(this).css('display', 'none');
	});
	// 파라미터로 넘겨 받은 id 요소는 show
	$("#" + excludeId).css('display','table');
	
	$('#current_pay_name').text(paylabel);
	/* <strong id="current_pay_name">무통장 입금</strong> */
}

/*  $('#oemail3').change(function(){
	var option = $(this).val();
	console.log(option);
	$('#oemail2').text(option);
	$('#inputId').attr('readonly', true);
});
  */
  
  

});



function sample5_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
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



function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
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
							.getElementById('rpostnum').value = data.zonecode; //5자리 새우편번호 사용
					document
							.getElementById('raddress').value = fullRoadAddr;

					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if (data.autoRoadAddress) {
						//예상되는 도로명 주소에 조합형 주소를 추가한다.
						var expRoadAddr = data.autoRoadAddress
								+ extraRoadAddr;
						document
								.getElementById('raddress').innerHTML = '(예상 도로명 주소 : '
								+ expRoadAddr
								+ ')';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						document
								.getElementById('raddress').innerHTML = '(예상 지번 주소 : '
								+ expJibunAddr
								+ ')';

					} else {
						document
								.getElementById('raddress').innerHTML = '';
					}
				}
			}).open();
}