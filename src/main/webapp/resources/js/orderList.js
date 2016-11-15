

//탭 변경	
function openTab(tabname) {
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	
	if(tabname=="orderCategory"){
		location.href="/h72/searchOrder?tab="+tabname+"&start_date="+startDate+"&end_date="+endDate+"&page=1";
	}else{
		
		location.href="/h72/searchOrder?tab="+tabname+"&start_date="+startDate+"&end_date="+endDate+"&page=1";
	}
	
}

//주문취소
function orderChange(orderNo, status, page) {
	if(confirm("주문을 취소하시겠습니까?") == true){
	location.href="/h72/updateStatusCancle?orderNo="+orderNo+"&status="+status+"&page="+page;
	}
}
//구매확정
function orderFinish(orderNo, point, page) {
	if(confirm("구매내역에 대하여 확정하시겠습니까?") == true){
		alert('구매확정 되었습니다. 적립금이 지급 됩니다.');
		location.href="/h72/orderConfirm?orderNo="+orderNo+"&point="+point+"&page="+page;
		
		/* $.ajax({
				type:'get',
				url: "/h72/orderConfirm",
				data :{"orderNo":orderNo, "point":point},
				success: function(data) {
					alert('구매확정 되었습니다. 적립금이 지급 됩니다.');
				},
				error: function(data) {
					alert("에러발생! 변경에 실패하였습니다.");
				}			
			}); */
	}
}

// 날짜포맷 지정하는 함수
function dateToYYYYMMDD(date)
{
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}


//날짜 선택 버튼시 inputd의 날짜 변경
	$(function(){
		
		var currDate = new Date(); // 현재 날짜
		var startDate = new Date(new Date().setMonth(new Date().getMonth()-3)); // 세달전 날짜
		
	/* 	// YYYY-MM-DD로 형식변환
		var prevMon = dateToYYYYMMDD(startDate);
		var currMon = dateToYYYYMMDD(currDate);
		
		document.getElementById("startDate").value = prevMon;
		document.getElementById("endDate").value = currMon;
		
		 */
		$('a[days=00]').click(
		function(){
			document.getElementById("startDate").value = dateToYYYYMMDD(currDate);	
		});
		
		
		$('a[days=07]').click(
				function(){
					var preSeven = new Date(new Date().setDate(new Date().getDate()-7));
					document.getElementById("startDate").value = dateToYYYYMMDD(preSeven);	
						
				});
		
		$('a[days=30]').click(
				function(){
					var preOneMonth = new Date(new Date().setMonth(new Date().getMonth()-1));
					document.getElementById("startDate").value = dateToYYYYMMDD(preOneMonth);	
				});
		$('a[days=90]').click(
				function(){
					var preThreeMonth = new Date(new Date().setMonth(new Date().getMonth()-3));
					document.getElementById("startDate").value = dateToYYYYMMDD(preThreeMonth);	
					
				});
		$('a[days=180]').click(
				function(){
					var preSixMonth = new Date(new Date().setMonth(new Date().getMonth()-6));
					document.getElementById("startDate").value = dateToYYYYMMDD(preSixMonth);	
					
				}); 
		
		
		$('#searchDate').click(
 	 			function(){
 	 					searchDateForm.submit();
 	 		});
		
		
		
	});
	
