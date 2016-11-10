	
	
/* 	//위치에 따른 옵션바 생성/제거
	$(window).scroll(function(){
		if($(document).scrollTop()<=500){
			$("#optionBtn").addClass("fixed");
		}else if($(document).scrollTop()>410){
			$("#optionBtn").removeClass("fixed");
	 	}
		
	}); */

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
 	
 	//전체선택 체크박스 클릭
 	$(function() {		
		$("#allCheck").click(
			function() {
				if ($("#allCheck").prop("checked")) {
					$("#orderList input[type=checkbox]").prop("checked", true);
				} else {
					$("#orderList input[type=checkbox]").prop("checked", false);
				}
				$("#orderList input[type=checkbox]").change();
		})
	})
 	
	//체크박스 선택시 tr 색 변경
	$(function() {
		$("#orderList input[type=checkbox]").change(function() {
			if ($(this).is(":checked")) {
				$(this).closest("tr").find("td").each(function() {
					$(this).css("background", "#f6f6f6");
				});
			} else {
				$(this).closest("tr").find("td").each(function() {
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
			var startDate = new Date(new Date().setMonth(new Date().getDate()-3)); // 한달전 날짜
			
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
						var preOneMonth = new Date(new Date().setMonth(new Date().getDate()-3));
						document.getElementById("startDate").value = dateToYYYYMMDD(preOneMonth);	
					});
			$('a[days=07]').click(
					function(){
						var preSeven = new Date(new Date().setDate(new Date().getDate()-7));
						document.getElementById("startDate").value = dateToYYYYMMDD(preSeven);							
					});		
			
			$('a[days=14]').click(
					function(){
						var preThreeMonth = new Date(new Date().setMonth(new Date().getDate()-14));
						document.getElementById("startDate").value = dateToYYYYMMDD(preThreeMonth);						
					});
	});
	
 	
 	//개별 버튼 변경
 	function updateStatusOne0(orderNo){
 		var status = $("[name=selectStatusOne"+ orderNo +"0] option:selected").val();
 		goAjax1(orderNo, status);
	}
 	
 	function updateStatusOne1(orderNo){
 		var status = $("[name=selectStatusOne"+ orderNo +"1] option:selected").val();
 		goAjax1(orderNo, status);
	}
 	
 	function updateStatusOne2(orderNo){
 		var status = $("[name=selectStatusOne"+ orderNo +"2] option:selected").val();
 		goAjax1(orderNo, status);
	}
 	
 	function updateStatusOne3(orderNo){
 		var status = $("[name=selectStatusOne"+ orderNo +"3] option:selected").val();
		goAjax1(orderNo, status);
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
 	
 	//상세 내역 조회
 	var showNhide = false;
 	function Contents(orderNo){
 		
 		if(!showNhide){
 			$('.Contents' + orderNo).show();
 			showNhide = true;
 		}else{
 			$('.Contents' + orderNo).hide();
 			showNhide = false;
 		}
 	}
 	
 	 	