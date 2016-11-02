$(document).ready(function(){
	/*checkBox 클릭시*/
	$("input[type=checkbox]").click(function(){
		var checkboxName = $(this).attr("name");
		var inputCheckboxName = "input[name="+checkboxName+"]:checked";
		var select_item ="select_"+$(this).attr("name");
		var submenuIdNum = $(".kitDiy_subList").length+1;
		
		var categoryIndex= checkboxName.substring(3,4); //tab 번호만 가져오기
		
		/*checkbox 갯수*/
		var checkboxLength = $(inputCheckboxName).length ;
	
		/*이미지 효과*/
		$("#"+select_item+"Image img").css("opacity","1");

		/*단계별 효과*/
		var color = "#FF9999";
		$("#"+select_item).css("background",color);
		
		/*메인 메뉴 취소 버튼 변수*/
		var checkboxClear_li = "#select_product"+categoryIndex+" ul:first-child .checkboxClear";
		
		/*미니 메뉴 변수*/
		var miniMenuId= "#select_minuMenu"+ checkboxName.substring(3,4); 
		
		/*메인 메뉴 외 1*/
		/*메인 메뉴 변수*/
		var stock_li= "#select_product"+ checkboxName.substring(3,4)
		+" ul:first-child li:nth-child(3)"; 
		
		/*checkbox 체크시 */
		if($(this).is(":checked")){
			
			/*서브메뉴 추가를 위한 변수들*/
			var selector = '#kitDiy_product #select_product'+categoryIndex;
			var selectList = '<ul id="kitDiy_subList'+submenuIdNum+'" class="kitDiy_subList" style="display:none">'
								+'<li>Product Name</li>'
								+'<li><select name="" class="kitDiy_subSelect"></select></li>'
								+'<li><input type="text" value="1" class="select_input"> 개</li>'
								+'<li></li>'
								+'<li class="checkboxClear">X</li>'
								+'<li class="product_code"></li>'
							+'</ul>';
			var subMenu_li = "#select_product"+categoryIndex+" .subMenu";
			
			/*서브메뉴 x버튼 보이기*/
			$(checkboxClear_li).css("display","block");
			
			/*check 박스  정보 메인메뉴에 보내기 위한 변수 */
			var product_code = $(this).closest("li").attr('id');
			var product_name = "#"+product_code+" [name='product_name']";
			/*var product_option = "#"+product_code+" [name='product_option']";*/
			var product_option = "#"+product_code+" .kitDiy_select";
			var product_price = "#"+product_code+" [name='product_price']";
			/*메인 메뉴 변수*/
			var select_productId= "#select_product"+ checkboxName.substring(3,4)
			+" ul:nth-child("+checkboxLength+")"; 
			
			/*체크된 checkBox가 2개 이상일 경우 서브메뉴생성 */
			if (checkboxLength > 1) {
				/*서브메뉴 x버튼 보이기*/
				$(checkboxClear_li).css("display","block");
				
				/*서브메뉴 버튼 보이기*/
				$(subMenu_li).css("display","block");
				
				/*서브메뉴 추가*/
				$(selector).append(selectList);
				submenuIdNum++;
				
				/*메뉴에 서브메뉴 추가 된거 알리기(ex: 상품명 외 1)*/
				$(stock_li).text("");
				$(stock_li).text(" 외 "+(checkboxLength-1)+"개");
				
				/*상품이름 미니메뉴에 추가*/
				$(miniMenuId+" span:nth-child(3)").html("");
				$(miniMenuId+" span:nth-child(3)").html(" 외"+(checkboxLength-1)+"개");
				
				/*상품코드 메뉴에 추가*/
				$(select_productId+" li:nth-child(6)").text(product_code);
				/*상품이름 메뉴에 추가*/
				$(select_productId+" li:nth-child(1)").text($(product_name).val().substr(0,20));
				/*상품옵셥 메뉴에 추가*/
				/*$(select_productId+" li:nth-child(2) .kitDiy_subSelect").text($(product_option).val());*/
				/*상품가격 메뉴에 추가*/
				$(select_productId+" li:nth-child(4)").text($(product_price).val());
				/*상품수량 메뉴에 추가*/
				$(select_productId+" .select_input").val(1);
			
				/*상품옵셥 메뉴에 추가*/
				$(select_productId+" li:nth-child(2) .kitDiy_subSelect").append($(product_option).html());
				$(select_productId+" li:nth-child(2) .kitDiy_subSelect").val($(product_option).val());
				
			/*체크된 checkBox가 1개 이상일 경우 */
			}else if (checkboxLength > 0) {
				
				/*메뉴에 서브메뉴 추가 된거 알리기 위한 변수들(ex: 상품명 외 1)*/
				var stock = $(inputCheckboxName).length-1;
				var product_li = "#select_product"+categoryIndex
								+" ul:first-child li:nth-child(3)"; 
				
				/*상품코드 메뉴에 추가*/
				$(select_productId+" li:nth-child(9)").text(product_code);
				/*상품이름 메뉴에 추가*/
				$(select_productId+" li:nth-child(2)").text($(product_name).val().substr(0,20));
				/*상품옵셥 메뉴에 추가
				$(select_productId+" li:nth-child(4)").text($(product_option).val());*/
				/*상품가격 메뉴에 추가*/
				$(select_productId+" li:nth-child(6)").text($(product_price).val());
				/*상품수량 메뉴에 추가*/
				$(select_productId+" .select_input").val(1);
				/*상품옵셥 메뉴에 추가*/
				$(select_productId+" li:nth-child(4) .kitDiy_subSelect").append($(product_option).html());
				$(select_productId+" li:nth-child(4) .kitDiy_subSelect").val($(product_option).val());
				
				/*상품이름 미니메뉴에 추가*/
				$(miniMenuId+" span:first").html($(product_name).val().substr(0,25));
				
				/*서브메뉴 버튼 숨기기*/
				$(subMenu_li).css("display","none");
				
				
			/*체크된 checkBox가 0개 이상일 경우 */
			}else if(checkboxLength <1){
				/*이미지 효과*/
				/*$("#"+select_item+"Image img").css("opacity","0.3");*/
				
				/*단계별 효과*/
				/*$("#"+select_item).css("background","#e9e9e9");*/
			}
		/*checkbox 해제시 */
		}else{
			var select_productId = "#select_product"+checkboxName.substr(checkboxName.length-1,1);
			var product_code= $(this).closest("li").attr("id");
			var product_codeClassLength = $(select_productId+" .product_code").length;
			var menuProduct_code="";
			var submenuIdNum = $(select_productId+" .kitDiy_subList").length;
			
			for (var i = 1; i < product_codeClassLength+1; i++) {
				menuProduct_code = $(select_productId+" ul:nth-child("+i+") .product_code").text();
				if(menuProduct_code == product_code){
					if(i!=1){
						$(select_productId+" ul:nth-child("+i+")").remove();
						
						/*상품갯수 메인메뉴에 숫자 삭제(ex: 상품명 외 1)*/
						$(stock_li).text("");
						$(stock_li).text(" 외 "+(checkboxLength-1)+"개");
						
						/*상품이름 미니메뉴에 추가*/
						$(miniMenuId+" span:nth-child(3)").html("");
						$(miniMenuId+" span:nth-child(3)").html(" 외"+(checkboxLength-1)+"개");
						
					}else{
						/*mainmenu 정보삭제*/
						/*상품코드 메뉴에 삭제*/
						$(select_productId+" ul:first-child li:nth-child(9)").text("");
						/*상품이름 메뉴에 삭제*/                                        
						$(select_productId+" ul:first-child li:nth-child(2)").text("-");
						/*상품옵셥 메뉴에 삭제*/                                        
						/*$(select_productId+" ul:first-child li:nth-child(4)").text("-");*/
						/*상품가격 메뉴에 삭제*/                                        
						$(select_productId+" ul:first-child li:nth-child(6)").text("-");
						/*상품수량 메뉴에 삭제*/
						$(select_productId+" ul:first-child .select_input").val("-");
						/*상품옵셥 메뉴에 삭제*/                                        
						$(select_productId+" ul:first-child .kitDiy_subSelect option").remove();
						
						/*submenu가 존재 하는데 mainmenu가 삭제된 경우*/
						if(submenuIdNum > 0){
							var product_code = $(select_productId+" ul:nth-child(2) li:nth-child(6)").text();
							/*alert(product_code);*/
							var product_name = $(select_productId+" ul:nth-child(2) li:nth-child(1)").text();
							/*alert(product_name);*/
							/*var product_option = $(select_productId+" ul:nth-child(2) li:nth-child(2)").text();*/
							/*alert(product_option);*/
							var product_price = $(select_productId+" ul:nth-child(2) li:nth-child(4)").text();
							/*alert(product_price);*/
							var product_stock = $(select_productId+" ul:nth-child(2) .select_input").val();
							/*alert(product_stock);*/
							var product_option = $(select_productId+" ul:nth-child(2) .kitDiy_subSelect").html();
							var optionVal = $(select_productId+" ul:nth-child(2) .kitDiy_subSelect").val();
							
							
							/*submenu정보를  mainmenu로 옮기기*/
							/*상품코드 메뉴에 추가*/
							$(select_productId+" ul:first-child li:nth-child(9)").text(product_code);
							/*상품이름 메뉴에 추가*/                                        
							$(select_productId+" ul:first-child li:nth-child(2)").text(product_name);
							/*상품옵셥 메뉴에 추가*/                                        
							/*$(select_productId+" ul:first-child li:nth-child(4)").text(product_option);*/
							/*상품가격 메뉴에 추가*/                                        
							$(select_productId+" ul:first-child li:nth-child(6)").text(product_price);
							/*상품수량 메뉴에 추가*/
							$(select_productId+" ul:first-child .select_input").val(product_stock);
							/*상품옵셥 메뉴에 추가*/                                        
							$(select_productId+" ul:first-child .kitDiy_subSelect").append(product_option);
							$(select_productId+" ul:first-child .kitDiy_subSelect").val(optionVal);
							
							/*2번째 있는 submenu 삭제*/
							$(select_productId+" ul:nth-child(2)").remove();
							
							/*상품이름 미니메뉴에 추가*/
							$(miniMenuId+" span:first").html(product_name);
						}
					}
				}
			}
			/*submenu 갯수 구하기*/
			submenuIdNum = $(select_productId+" .kitDiy_subList").length;
			/*submenu가 없을 경우*/
			if(submenuIdNum == 0){
				/*리스트 바 숨기기*/
				$(select_productId+" ul:first-child .subMenu").css("display","none");
				
				/*상품갯수 메인메뉴에 숫자 삭제(ex: 상품명 외 1)*/
				$(stock_li).text("");
				
				/*상품갯수 미니메뉴에 숫자 삭제*/
				$(miniMenuId+" span:nth-child(3)").html("");
			
			}	
			/*$(select_productId+" product_code")*/
			/*체크바스가 모두 해지 됬을 때*/
			if(checkboxLength <1){
				/*이미지 효과*/
				$("#"+select_item+"Image img").css("opacity","0.3");
				
				/*단계별 효과*/
				$("#"+select_item).css("background","#e9e9e9");
				
				/*메인 메뉴 X버튼 숨기기*/
				$(checkboxClear_li).css("display","none");
				
				/*상품이름 미니메뉴에 삭제*/
				$(miniMenuId+" span").html(" ");
				
			}
				
		}
		
	});
	
	
	/* 옵션 변경 이벤트 */
	$(document).on('change', ".kitDiy_select", function() {
		/*선택한 옵션 value*/
		var selectOption = $(this).val();
		/*상품 코드번호를 확인하기 위한 변수*/
		var productId = $(this).closest("li").attr("id");
		/*alert(productId);*/
		for (var i = 0; i < $(".product_code").length; i++) {
			/*해당 select menu 위치를 확인하기 위한 변수*/
			if($(".product_code:eq("+i+")").html() ==  productId){
				var menuId = $(".product_code:eq("+i+")").closest("ul").attr("id");
			}
		}
		
		/*selectMenu에 해당 상품 코드번호를 가진 옵셥 내용 적용*/
		var selectmenuOption = $("#"+menuId + " .kitDiy_subSelect").val(selectOption);
		
		
	});
});
	

	
	
