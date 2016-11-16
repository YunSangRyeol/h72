//[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자  
//[0-9] => \d , [^0-9] => \D
var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
var rgx2 = /(\d+)(\d{3})/; 

function getNumber(obj){
     var num01;
     var num02;
     num01 = obj.value;
     num02 = num01.replace(rgx1,"");
     num01 = setComma(num02);
     obj.value =  num01;

}

function setComma(inNum){
     var outNum;
     outNum = inNum; 
     while (rgx2.test(outNum)) {
          outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
      }
     return outNum;

}
$(document).ready(function(){
	$("#productEnroll_enrollBtn").click(function(){
	/*	alert($("#itemName").val());*/
		if($("#itemName").val()== ""){
			$("#itemName").focus();
			return;
		}
		if($("#productEnroll_option").val()== ""){
			$("#productEnroll_option").focus();
			return;
		}
		if($("#productEnroll_optionId").val()== ""){
			$("#productEnroll_optionId").focus();
			return;
		}
		if($("#productEnroll_option").val()== ""){
			$("#productEnroll_option").focus();
			return;
		}
		if($("#cost").val()== ""){
			$("#cost").focus();
			return;
		}
		if($("#price").val()== ""){
			$("#price").focus();
			return;
		}
		if($("#sailPrice").val()== ""){
			$("#sailPrice").focus();
			return;
		}
		if($("#upBtn1").val()== ""){
			alert("Title 사진을 선택해주세요");
			return;
		}
		if($("#upBtn2").val()== ""){
			alert("상세 사진을 선택해주세요");
			return;
		}
		
		
		$( "form" ).submit();
	});
	$("#productEnroll_updateBtn").click(function(){
		/*	alert($("#itemName").val());*/
		if($("#itemName").val()== ""){
			$("#itemName").focus();
			return;
		}
		if($("#productEnroll_option").val()== ""){
			$("#productEnroll_option").focus();
			return;
		}
		if($("#productEnroll_optionId").val()== ""){
			$("#productEnroll_optionId").focus();
			return;
		}
		if($("#productEnroll_option").val()== ""){
			$("#productEnroll_option").focus();
			return;
		}
		if($("#cost").val()== ""){
			$("#cost").focus();
			return;
		}
		if($("#price").val()== ""){
			$("#price").focus();
			return;
		}
		if($("#sailPrice").val()== ""){
			$("#sailPrice").focus();
			return;
		}
	/*	if($("#upBtn1").val()== ""){
			alert("Title 사진을 선택해주세요");
			return;
		}
		if($("#upBtn2").val()== ""){
			alert("상세 사진을 선택해주세요");
			return;
		}*/
		
		$( "form" ).attr("action", "/h72/productEnroll/productEnrollUpdate");
		$( "form" ).submit();
	});
	
	
});



