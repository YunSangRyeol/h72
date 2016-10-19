$(document).ready(function(){
	/*checkBox 클릭시*/
	$("input[type=checkbox]").click(function(){
		var checkboxName = $(this).attr("name");
		var inputCheckboxName = "input[name="+checkboxName+"]:checked";
		var select_item ="select_"+$(this).attr("name");
		var submenuIdNum = $(".kitDiy_subList").length+1;
		
		/*checkbox 갯수*/
		var checkboxLength = $(inputCheckboxName).length ;
		
		/*이미지 효과*/
		$("#"+select_item+"Image img").css("opacity","1");

		/*단계별 효과*/
		var color = "#FF9999";
		$("#"+select_item).css("background",color);
		
		/*checkbox 체크시 */
		if($(this).is(":checked")){
			
			/*서브메뉴 추가를 위한 변수들*/
			var categoryIndex= checkboxName.substring(3,4); //tab 번호만 가져오기
			var selector = '#kitDiy_product #select_product'+categoryIndex;
			var selectList = '<ul id="kitDiy_subList'+submenuIdNum+'" class="kitDiy_subList" style="display:none">'
								+'<li>Product Name</li>'
								+'<li>red</li>'
								+'<li><input type="text" value="1" class="select_input"> 개</li>'
								+'<li>120000 원</li>'
								+'<li class="checkboxClear">X</li>'
								+'<li class="product_code"></li>'
							+'</ul>';
			
			var subMenu_li = "#select_product"+categoryIndex+" .subMenu";
			
			/*check 박스  정보 상단메뉴에 보내기*/
			var product_code = $(this).closest("li").attr('id');
			/*alert(product_code);*/
			var product_name = "#"+product_code+" [name='product_name']";
			/*alert($(product_name).val());*/
			var product_option = "#"+product_code+" [name='product_option']";
			/*alert($(product_option).val());*/
			var product_price = "#"+product_code+" [name='product_price']";
			/*alert($(product_price).val());*/
			
			var select_productId= "#select_product"+ checkboxName.substring(3,4)
			+" ul:nth-child("+checkboxLength+")"; 
			
			/*alert(select_productId);*/
			
			/*체크된 checkBox가 2개 이상일 경우 서브메뉴생성 */
			if (checkboxLength > 1) {
				/*서브메뉴 버튼 보이기*/
				$(subMenu_li).css("display","block");
				
				/*서브메뉴 추가*/
				$(selector).append(selectList);
				submenuIdNum++;
				
				/*메뉴에 서브메뉴 추가 된거 알리기(ex: 상품명 외 1)*/
				$(product_li).text("");
				$(product_li).append(" 외 "+stock+"개");
				
				/*상품코드 메뉴에 추가*/
				$(select_productId+" li:nth-child(6)").text(product_code);
				/*상품이름 메뉴에 추가*/
				$(select_productId+" li:nth-child(1)").text($(product_name).val());
				/*상품옵셥 메뉴에 추가*/
				$(select_productId+" li:nth-child(2)").text($(product_option).val());
				/*상품가격 메뉴에 추가*/
				$(select_productId+" li:nth-child(4)").text($(product_price).val());
				/*상품수량 메뉴에 추가*/
				$(select_productId+" .select_input").val(1);
				
			
			/*체크된 checkBox가 1개 이상일 경우 */
			}else if (checkboxLength > 0) {
				
				/*메뉴에 서브메뉴 추가 된거 알리기 위한 변수들(ex: 상품명 외 1)*/
				var stock = $(inputCheckboxName).length-1;
				var product_li = "#select_product"+categoryIndex
								+" ul:first-child li:nth-child(3)"; 
				
				/*상품코드 메뉴에 추가*/
				$(select_productId+" li:nth-child(9)").text(product_code);
				/*상품이름 메뉴에 추가*/
				$(select_productId+" li:nth-child(2)").text($(product_name).val());
				/*상품옵셥 메뉴에 추가*/
				$(select_productId+" li:nth-child(4)").text($(product_option).val());
				/*상품가격 메뉴에 추가*/
				$(select_productId+" li:nth-child(6)").text($(product_price).val());
				/*상품수량 메뉴에 추가*/
				$(select_productId+" .select_input").val(1);
				
				/*서브메뉴 버튼 숨기기*/
				$(subMenu_li).css("display","none");
				/*ex: 상품명 외 1 - 삭제*/
				$(product_li).text("");
				
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
						
					}else{
						/*mainmenu 정보삭제*/
						/*상품코드 메뉴에 삭제*/
						$(select_productId+" ul:first-child li:nth-child(9)").text("");
						/*상품이름 메뉴에 삭제*/                                        
						$(select_productId+" ul:first-child li:nth-child(2)").text("-");
						/*상품옵셥 메뉴에 삭제*/                                        
						$(select_productId+" ul:first-child li:nth-child(4)").text("-");
						/*상품가격 메뉴에 삭제*/                                        
						$(select_productId+" ul:first-child li:nth-child(6)").text("-");
						/*상품수량 메뉴에 삭제*/
						$(select_productId+" ul:first-child .select_input").val("-");
					
						/*submenu가 존재 하는데 mainmenu가 삭제된 경우*/
						if(submenuIdNum > 0){
							var product_code = $(select_productId+" ul:nth-child(2) li:nth-child(6)").text();
							/*alert(product_code);*/
							var product_name = $(select_productId+" ul:nth-child(2) li:nth-child(1)").text();
							/*alert(product_name);*/
							var product_option = $(select_productId+" ul:nth-child(2) li:nth-child(2)").text();
							/*alert(product_option);*/
							var product_price = $(select_productId+" ul:nth-child(2) li:nth-child(4)").text();
							/*alert(product_price);*/
							var product_stock = $(select_productId+" ul:nth-child(2) .select_input").val();
							/*alert(product_stock);*/
							
							
							/*submenu정보를  mainmenu로 옮기기*/
							/*상품코드 메뉴에 추가*/
							$(select_productId+" ul:first-child li:nth-child(9)").text(product_code);
							/*상품이름 메뉴에 추가*/                                        
							$(select_productId+" ul:first-child li:nth-child(2)").text(product_name);
							/*상품옵셥 메뉴에 추가*/                                        
							$(select_productId+" ul:first-child li:nth-child(4)").text(product_option);
							/*상품가격 메뉴에 추가*/                                        
							$(select_productId+" ul:first-child li:nth-child(6)").text(product_price);
							/*상품수량 메뉴에 추가*/
							$(select_productId+" ul:first-child .select_input").val(product_stock);
							
							/*2번째 있는 submeny 삭제*/
							$(select_productId+" ul:nth-child(2)").remove();
							
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
			
			}	
			/*$(select_productId+" product_code")*/
			if(checkboxLength <1){
				/*이미지 효과*/
				$("#"+select_item+"Image img").css("opacity","0.3");
				
				/*단계별 효과*/
				$("#"+select_item).css("background","#e9e9e9");
			}
				
		}
		
		
		
		
	});
});
	

	
	
