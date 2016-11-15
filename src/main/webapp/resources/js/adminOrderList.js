	
	
/* 	//위치에 따른 옵션바 생성/제거
	$(window).scroll(function(){
		if($(document).scrollTop()<=500){
			$("#optionBtn").addClass("fixed");
		}else if($(document).scrollTop()>410){
			$("#optionBtn").removeClass("fixed");
	 	}
		
	}); */

	//

	
	
	//form 유효성 검사
	$(function(){
		$('#submitBtn').click(
				function(){
					if( $("input:checkbox[name='orderListAll']").is(":checked")){
						adminOrderListFormAll.submit();
					}else{
						alert("변경 내역을 선택해주세요");
					}
				});
		$('#submitBtn1').click(				
				function(){
					if( $("input:checkbox[name='orderListOrder']").is(":checked")){
						adminOrderListFormOrder.submit();
					}else{
						alert("변경 내역을 선택해주세요");
					}
				});
		$('#submitBtn2').click(				
				function(){
					if( $("input:checkbox[name='changeListPaid']").is(":checked")){
						adminOrderListFormPaid.submit();
					}else{
						alert("변경 내역을 선택해주세요");
					}
				});
		$('#submitBtn3').click(				
				function(){
					if( $("input:checkbox[name='changeListDeliver']").is(":checked")){
						adminOrderListFormDeliver.submit();
					}else{
						alert("변경 내역을 선택해주세요");
					}
				});
		
		$('#CancleBtn').click(				
				function(){
					if( $("input:checkbox[name='orderListCancle']").is(":checked")){
						adminOrderListForm1.submit();
					}else{
						alert("변경 내역을 선택해주세요");
					}
				});
		$('#ChnageBtn').click(				
				function(){
					if( $("input:checkbox[name='orderListChange']").is(":checked")){
						adminOrderListForm2.submit();
					}else{
						alert("변경 내역을 선택해주세요");
					}
				});
		$('#BackBtn').click(				
				function(){
					if( $("input:checkbox[name='orderListBack']").is(":checked")){
						adminOrderListForm3.submit();
					}else{
						alert("변경 내역을 선택해주세요");
					}
				});
		
	});

	//탭 변경	
	function openTab(evt, tabname) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace("active", "");
		}
		document.getElementById(tabname).style.display = "block";
		evt.currentTarget.className += " active";
	}
	
	//검색시 검색 text와 submit버튼 변경
 	$(function() {
		$('#adminSearchhow').change(
				function(){
					$('#searchDate')[($("option[value='date']").is(":checked")) ? "show" : "hide"]();
					$('#searchID')[($("option[value='user']").is(":checked")) ? "show" : "hide"]();
				});
	}); 
 	
 	//전체선택 체크박스 클릭-결제완료
 	$(function() {		
		$("[name=allCheck1]").click(						
			function() {			
				if ($("[name=allCheck1]").prop("checked")) {					
					$("input[name=changeListPaid]").prop("checked", true);
					$("input[name=transportNumberPaid]").attr("name", "transportNumberPaid"); 
				}else {
					$("input[name=changeListPaid]").prop("checked", false);
					$("input[name=changeNot]").attr("name", "changeNot"); 
				}
				$("input[name=" + $(this).val() + "]").change();
		})
	});
 	
 	//전체선택 체크박스 클릭-배송중
 	$(function() {		
		$("[name=allCheck2]").click(						
			function() {			
				if ($("[name=allCheck2]").prop("checked")) {					
					$("input[name=changeListDeliver]").prop("checked", true);
					$("input[name=transportNumberPaid]").attr("name", "transportNumberPaid"); 
				}else {
					$("input[name=changeListDeliver]").prop("checked", false);
					$("input[name=changeNot]").attr("name", "changeNot"); 
				}
				$("input[name=" + $(this).val() + "]").change();
		})
	});
 	
 	//전체선택 체크박스 클릭 -all
 	$(function() {		
		$("[name=allCheck]").click(						
			function() {	
				if ($("[name=allCheck]").prop("checked")) {
					$("input[name=" + $("[name=allCheck]").val() + "]").prop("checked", true);
				}else {
					$("input[name=" + $("[name=allCheck]").val() + "]").prop("checked", false);
				}
				$("input[name=" + $(this).val() + "]").change();
		})
	})
	
	$(function() {		//order
		$("#allCheck").click(						
			function() {	
				if ($("#allCheck").prop("checked")) {
					$("input[name=" + $(this).val() + "]").prop("checked", true);
				}else {
					$("input[name=" + $(this).val() + "]").prop("checked", false);
				}
				$("input[name=" + $(this).val() + "]").change();
		})
	})
	
	$(function() {		//취소
		$("#allCheckA").click(						
			function() {	
				if ($("#allCheckA").prop("checked")) {
					$("input[name=orderListCancle]").prop("checked", true);
				}else {
					$("input[name=" + $(this).val() + "]").prop("checked", false);
				}
				$("input[name=orderListCancle]").change();
		})
	})
	
	$(function() {		//교환
		$("#allCheckB").click(						
			function() {	
				if ($("#allCheckB").prop("checked")) {
					$("input[name=orderListChange]").prop("checked", true);
				}else {
					$("input[name=orderListChange]").prop("checked", false);
				}
				$("input[name=" + $(this).val() + "]").change();
		})
	})
	
	$(function() {		//반품
		$("#allCheckC").click(						
			function() {	
				if ($("#allCheckC").prop("checked")) {
					$("input[name=orderListBack]").prop("checked", true);
				}else {
					$("input[name=orderListBack]").prop("checked", false);
				}
				$("input[name=" + $(this).val() + "]").change();
		})
	})
 	
	
	//체크박스 선택시 tr 색 변경
	$(function() {
		$("input[type=checkbox]").change(function() {
			if ($(this).is(":checked")) {
				$(this).closest("tr").find("td").each(function() {
					$(this).css("background", "#f6f6f6");
				});
				$(this).closest("tr").find("input[type=text]").each(function() {
					$(this).css("background", "#f6f6f6");
				});
			} else {
				$(this).closest("tr").find("td").each(function() {
					$(this).css("background", "white");
				});
				$(this).closest("tr").find("input[type=text]").each(function() {
					$(this).css("background", "white");
				});
			}
		
		} );
	});
 	

 	//날짜 선택 버튼시 inputd의 날짜 변경
	 	
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
			var startDate = new Date(new Date().setDate(new Date().getDate()-3)); // 3일전 날짜
			
			// YYYY-MM-DD로 형식변환
			var prevMon = dateToYYYYMMDD(startDate);
			var currMon = dateToYYYYMMDD(currDate);		
			document.getElementById("startDate").value = prevMon;
			document.getElementById("endDate").value = currMon;
					
			$('a[days=00]').click(
			function(){
				document.getElementById("startDate").value = dateToYYYYMMDD(currDate);	
			});		
			$('a[days=03]').click(
					function(){
						var preOneMonth = new Date(new Date().setDate(new Date().getDate()-3));
						document.getElementById("startDate").value = dateToYYYYMMDD(preOneMonth);	
					});
			$('a[days=07]').click(
					function(){
						var preSeven = new Date(new Date().setDate(new Date().getDate()-7));
						document.getElementById("startDate").value = dateToYYYYMMDD(preSeven);							
					});		
			
			$('a[days=14]').click(
					function(){
						var preThreeMonth = new Date(new Date().setDate(new Date().getDate()-14));
						document.getElementById("startDate").value = dateToYYYYMMDD(preThreeMonth);						
					});
	});
	
 	
 	//개별 버튼 변경
 	function updateStatusOne0(orderNo){
 		alert("Asdfasdf");
 		var status = $("[name=selectStatusOne"+ orderNo +"0] option:selected").val();
 		alert(status);
 		if(status == "배송중"){
 			var transportNo =$("[name=transportNumber"+ orderNo +"0]" ).val();
 			goAjax3(orderNo, status, transportNo);
 		}else{
 			alert("aaaa");
 			goAjax1(orderNo, status);
 		}
	}
 	
 	function updateStatusOne1(orderNo){
 		var status = $("[name=selectStatusOne"+ orderNo +"1] option:selected").val();
 		if(status == "배송중"){
 			var transportNo =$("[name=transportNumber"+ orderNo +"1]" ).val();
 			goAjax3(orderNo, status, transportNo);
 		}else{
 			goAjax1(orderNo, status);
 		}
	}
 	
 	function updateStatusOne2(orderNo){
 		var status = $("[name=selectStatusOne"+ orderNo +"2] option:selected").val();
 		if(status == "배송중"){
 			var transportNo =$("[name=transportNumber"+ orderNo +"2]" ).val();
 			goAjax3(orderNo, status, transportNo);
 		}else{
 			goAjax1(orderNo, status);
 		}
	}
 	
 	function updateStatusOne3(orderNo){
 		var status = $("[name=selectStatusOne"+ orderNo +"3] option:selected").val();
 		if(status == "배송중"){
 			var transportNo =$("[name=transportNumber"+ orderNo +"3]" ).val();
 			goAjax3(orderNo, status, transportNo);
 		}else{
 			
 			goAjax1(orderNo, status);
 		}
	}
 	
 	//ajax
 	function goAjax1(orderNo, status){ 		
		$.ajax({
			type:'POST',
			url: "/h72/updateStatusOne.do",
			data :{"orderNo":orderNo, "status":status},
			success: function(data) {
				if(data.result > 0){
					alert("주문번호 [" + orderNo + "]를 '" + status + "'(으)로 변경하였습니다.");			
				}
			},
			error: function(data) {
				alert("에러발생! 변경에 실패하였습니다.");
			}			
		});	
 	}
 	
 	function goAjax3(orderNo, status, transportNo){ 		
		$.ajax({
			type:'POST',
			url: "/h72/updateStatusOne1.do",
			data :{"orderNo":orderNo, "status":status, "transportNo":transportNo},
			success: function(data) {
				if(data.result > 0){
					alert("주문번호 [" + orderNo + "]의 운송장번호 '" + transportNo + "번으로 입력하였습니다.");			
				}
			},
			error: function(data) {
				alert("에러발생! 변경에 실패하였습니다.");
			}			
		});	
 	}
 	
 	//취소.반품.교환 관련 개별 변경 버튼
 	function updateChangeOne1(orderNo){
 		var change = $("[name=selectChangeOne"+ orderNo +"1] option:selected").val();
 		goAjax2(orderNo, change);
 	}
 	
 	function updateChangeOne2(orderNo){
 		var change = $("[name=selectChangeOne"+ orderNo +"2] option:selected").val();
 		goAjax2(orderNo, change);
 	}
 	
 	function updateChangeOne3(orderNo){
 		var change = $("[name=selectChangeOne"+ orderNo +"3] option:selected").val();
 		goAjax2(orderNo, change);
 	}
 	
 	//ajax
 	function goAjax2(orderNo, change){ 		
 		alert("ddd" + orderNo + ", " + change);
		$.ajax({
			type:'POST',
			url: "/h72/updateChangeOne.do",
			data :{"orderNo":orderNo, "change":change},
			success: function(data) {
				if(data.result > 0){
					alert("주문번호 [" + orderNo + "]를 '" + change + "'(으)로 변경하였습니다.");			
				}
			},
			error: function(data) {
				alert("에러발생! 변경에 실패하였습니다.");
			}			
		});	
 	}
 	
 
 	
 	 	