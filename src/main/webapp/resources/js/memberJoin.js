$(function() {
	$('#chkDupId').click(function() {
		var userid = $("#userid").val();
		var cnt = 0;
	
		 if (userid == "") {
			alert("아이디를 입력하세요");
		} else if(userid.length < 5 || userid.length > 12){
			alert("아이디는 5~12글자 사이만 가능합니다");
	
		}else {
			for(var i = 0; i<userid.length; i++){
				/*var checkId = /[0-9A-Za-z]{5,12}/;
				if(userid.charAt(i) != checkId)*/
						  if( !(userid.charAt(i) >= '0' && userid.charAt(i) <= '9') 
						&& !(userid.charAt(i) >= 'a' && userid.charAt(i) <= 'z') 
						&& !(userid.charAt(i) >= 'A' && userid.charAt(i) <= 'Z')
						)
				
				{
					alert("아이디는 영문자/숫자만 가능합니다");
					break;
				}else if(userid.charAt(i) >= '0' && userid.charAt(i) <= '9'){
					cnt = cnt-1;
					if(cnt < -4){
						alert("아이디를 숫자로만 만들 수 없습니다.");
						break;
					}
				}else{
					$.ajax({
						type:"POST",
						url:"/h72/chkDupId.do",
						data:{
							"userid":userid
						},
						success:function(result){
							if(result == 1){
								alert("이미 사용중인 아이디 입니다.");
							}else if(result==0){
								alert("사용 가능합니다.");
								$('#chkYN').val('y');
							}
						}
					});break;
				}
				
				}
			}
		}); 
});
