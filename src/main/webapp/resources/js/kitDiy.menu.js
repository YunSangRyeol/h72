$(document).ready(function(){
	var parentId = "";
	var subMenu ="";
	var open = false;
	 $("#select_product1").addClass("selected");
	/*메뉴 클리하면 서브메뉴 열기*/
	/*$(".subMenu").click(function(){
		if(!open){
			parentId = "#"+$(this).closest('div').attr('id');
			subMenu = parentId + " .kitDiy_subList"
			$(".kitDiy_subList").css("display","none");
			$(subMenu).css("display","block");
			open = true;
		}else{
			$(".kitDiy_subList").css("display","none");
			open = false;
		}
		
	});*/
	/*마우스 벗어나면 서브메뉴 닫기*/
	$('.kitDiy_productList').mouseleave(function() {
		$(".kitDiy_subList").css("display","none");
	});
	$(".subMenu").mouseover(function() {
		parentId = "#"+$(this).closest('div').attr('id');
		subMenu = parentId + " .kitDiy_subList"
		$(".kitDiy_subList").css("display","none");
		$(subMenu).css("display","block");
	});
	
	/*마우스 클릭시 메뉴 변경하기*/
	$('.kitDiy_productList').click(function() {
		/*클릭한 메뉴의 번호 가져오기*/
		var index = $( ".kitDiy_productList" ).index(this)+1;
		
		$(".kitDiy_productList").removeClass("selected");
		 var listId = "#select_product" + (index);
		 $(listId).addClass("selected");
		
		 /*탭 변경하기*/
		for (var i = 1; i < $(".tabs li").length+1; i++) {
			$(".tab" + i).css("display","none");
		}
		
		$(".tabs li").css("background","white");
		$(".tabs li").css("color","black");
		
		var select_li = ".tabs li:nth-child("+index+")";
		$(select_li).css("background","black");
		$(select_li).css("color","white");
		
		var tabNum = ".tab" + index;
		$(tabNum).css("display","block");
	
	});
	/* 옵션 변경 이벤트 */
	$(document).on('change', ".kitDiy_subSelect", function() {
		/*선택한 옵션 value*/
		var selectOption = $(this).val();
		/*menuId를 확인하기 위한 변수*/
		var menuId = $(this).closest("ul").attr("id");
		/*상품 코드번호를 확인하기 위한 변수*/
		var productId = $("#"+menuId + " .product_code").html();
		/*checkbox에 해당 상품 코드번호를 가진 옵셥 내용 적용*/
		var chkProductId = $("#"+productId + " .kitDiy_select").val(selectOption);
		
		
	});
	/*main menu 삭제 이벤트*/
	$(document).on('click', ".checkboxClear", function() {
		/*submenu 인지 확인하기 위한 변수*/
		var submenu = $(this).closest("ul").attr("class");
		
		/*sub menu 삭제를 위한 변수*/
		var submenuId = $(this).closest("ul").attr("id");
		var tabnum = submenuId.substr(submenuId.length-1,1);
		var subProduct_code = $("#"+submenuId+" .product_code").text();
		
		/*main menu submenu 보기 삭제를  위한 변수*/
		var select_productId = $(this).closest("div").attr("id");
		var mainProduct_code = $("#"+select_productId+" ul:first-child .product_code").text();
		
		/*main menu 갯수 삭제를 위한 변수*/
		var stock_li= select_productId+" ul:first-child li:nth-child(3)";
		
		/*mini menu 삭제를 위한 변수*/
		var minimenuId = "#select_minuMenu"+tabnum;
			
		/*sub menu 갯수*/
		var submenuIdNum = $("#"+select_productId+" .kitDiy_subList").length;
		/*submemu 일 경우*/
		if(submenu == "kitDiy_subList"){
			/*checkbox 해지*/
			$("#"+subProduct_code+" input:checkbox").prop("checked", false);
			/*submenu 삭제*/
			$("#"+submenuId).remove();
			/*mainmenu 삭제 <외 1> 이부분만 */
			$("#"+stock_li).text(" ");
			$("#"+stock_li).text(" 외 "+(submenuIdNum-1)+"개");
			/*minimenu 삭제 <외 1> 이부분만 */
			$(minimenuId+" span:nth-child(3)").html("");
			
			
		/*mainmemu 일 경우*/
		}else{
			/*checkbox 해지*/
			$("#"+mainProduct_code+" input:checkbox").prop("checked", false);
			/*mainmenu 정보삭제*/
			/*상품코드 메뉴에 삭제*/
			$("#"+select_productId+" ul:first-child li:nth-child(9)").text("");
			/*상품이름 메뉴에 삭제*/                                        
			$("#"+select_productId+" ul:first-child li:nth-child(2)").text("-");
			/*상품갯수 메뉴에 삭제*/                                        
			$("#"+select_productId+" ul:first-child li:nth-child(3)").text(" ");
			/*상품옵셥 메뉴에 삭제*/                                        
			/*$("#"+select_productId+" ul:first-child li:nth-child(4)").text("-");*/
			/*상품가격 메뉴에 삭제*/                                        
			$("#"+select_productId+" ul:first-child li:nth-child(6)").text("-");
			/*상품수량 메뉴에 삭제*/
			$("#"+select_productId+" ul:first-child .select_input").val("-");
			/*상품옵셥 메뉴에 삭제*/                                        
			$("#"+select_productId+" ul:first-child .kitDiy_subSelect option").remove();
			
			
			/*mainmenu 삭제 <외 1> 이부분만 */
			$("#"+stock_li).text(" ");
			
			/*mininenu 삭제 */
			$(minimenuId+" span").html("");
			
			
			/*submenu가 존재 하는데 mainmenu가 삭제된 경우*/
			if(submenuIdNum > 0){
				var product_code = $("#"+select_productId+" ul:nth-child(2) li:nth-child(6)").text();
				var product_name = $("#"+select_productId+" ul:nth-child(2) li:nth-child(1)").text();
				/*var product_option = $("#"+select_productId+" ul:nth-child(2) li:nth-child(2)").text();*/
				var product_price = $("#"+select_productId+" ul:nth-child(2) li:nth-child(4)").text();
				var product_stock = $("#"+select_productId+" ul:nth-child(2) .select_input").val();
				var product_option = $("#"+select_productId+" ul:nth-child(2) .kitDiy_subSelect").html();
				var optionVal = $("#"+select_productId+" ul:nth-child(2) .kitDiy_subSelect").val();
				
				/*submenu정보를  mainmenu로 옮기기*/
				/*상품코드 메뉴에 추가*/
				$("#"+select_productId+" ul:first-child li:nth-child(9)").text(product_code);
				/*상품이름 메뉴에 추가*/                                        
				$("#"+select_productId+" ul:first-child li:nth-child(2)").text(product_name);
				/*상품옵셥 메뉴에 추가                                        
				$("#"+select_productId+" ul:first-child li:nth-child(4)").text(product_option);*/
				/*상품가격 메뉴에 추가*/                                        
				$("#"+select_productId+" ul:first-child li:nth-child(6)").text(product_price);
				/*상품수량 메뉴에 추가*/
				$("#"+select_productId+" ul:first-child .select_input").val(product_stock);
				/*상품옵셥 메뉴에 추가*/
				$("#"+select_productId+" ul:first-child .kitDiy_subSelect").append(product_option);
				$("#"+select_productId+" ul:first-child .kitDiy_subSelect").val(optionVal);
				
				
				/*2번째 있는 submenu 삭제*/
				$("#"+select_productId+" ul:nth-child(2)").remove();
				
				/*mainmenu 수정<외 1> 이부분만 */
				$("#"+stock_li).text(" ");
				$("#"+stock_li).text(" 외 "+(submenuIdNum-1)+"개");
				
				/*minimenu 수정<외 1> 이부분만 */
				$(minimenuId+" span:first").html(product_name);
				
			/*submenu가 존재하지 않고 mainmenu도 삭제될 경우*/	
			}else{
				/*단계별 효과*/
				$("#select_tab"+tabnum).css("background","#e9e9e9");
				
				/*이미지 효과*/
				$("#select_tab"+tabnum+"Image img").css("opacity","0.3");
				
				/*메인 메뉴 X버튼 숨기기*/
				$(this).css("display","none");
				
				/*mininenu 삭제 */
				$(minimenuId+" span").html("");
			}
		}
	
		submenuIdNum = $("#"+select_productId+" .kitDiy_subList").length;
		/*submenu가 없을 경우*/
		if(submenuIdNum == 0){
			/*리스트 바 숨기기*/
			$("#"+select_productId+" ul:first-child .subMenu").css("display","none");
			
			/*메뉴에 서브메뉴 추가 된거 알리기(ex: 상품명 외 1)*/
			$(stock_li).text("");
			
			/*mainmenu 수정<외 1> 이부분만 */
			$("#"+stock_li).text(" ");
		
		}								
	});
	/*sub menu 삭제 이벤트*/
	/*$('.kitDiy_subList').click(function() {
		alert();
	});*/
});
	
