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
		//ȸ�� �˻��� �˻� text�� submit��ư ����
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
		//��ü���� üũ�ڽ� Ŭ��
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
	//üũ�ڽ� ���ý� tr �� ����
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
					//��λ��� ������ ���� Ȯ�� �� Ȯ��â
					function checkAlldel(){
						if(confirm("üũ�� ȸ�� ��θ� �����Ͻðڽ��ϱ�?")){
							mypage_alldelete_form.submit();
						}else{
							return;
						}
					}
</script>
<body>


</body>
</html>