<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function() {
		//회원 검색시 검색 text와 submit버튼 변경
		$('#searchhow').change(
				function() {
					$('#searchID')[($("option[value='searchid']")
							.is(":checked")) ? "show" : "hide"]();
					$('#searchNickname')[($("option[value='searchnick']")
							.is(":checked")) ? "show" : "hide"]();
					$('#searchDate')[($("option[value='searchdate']")
							.is(":checked")) ? "show" : "hide"]();
				});
	});
	$(function() {
		//전체선택 체크박스 클릭
		$("#allCheck")
				.click(
						function() {
							if ($("#allCheck").prop("checked")) {
								$(
										"table.mypage_userManager input[type=checkbox]")
										.prop("checked", true);

							} else {
								$(
										"table.mypage_userManager input[type=checkbox]")
										.prop("checked", false);
							}
							$("table.mypage_userManager input[type=checkbox]")
									.change();
						})
	})
	//체크박스 선택시 tr 색 변경
	$(function() {
		$("table.mypage_userManager input[type=checkbox]").change(function() {
			if ($(this).is(":checked")) {
				$(this).closest("tr").find("td").each(function() {
					$(this).css("background", "#e0e0e0");
				});
			} else {
				$(this).closest("tr").find("td").each(function() {
					$(this).css("background", "white");
				});
			}
		
		} );
	});

</script>
				<script type="text/javascript">
					//모두삭제 실행전 조건 확인 밑 확인창
					function checkAlldel(){
						if(confirm("체크된 회원 모두를 정리하시겠습니까?")){
							mypage_alldelete_form.submit();
						}else{
							return;
						}
					}
</script>
<body>


</body>
</html>