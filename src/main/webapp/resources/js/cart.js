//전체선택 체크박스 클릭
	$(function() {		
	$("#allCheck").click(
		function() {
			if ($("#allCheck").prop("checked")) {
				$(".xans-record- input[type=checkbox]").prop("checked", true);
			} else {
				$(".xans-record- input[type=checkbox]").prop("checked", false);
			}
			$(".xans-record- input[type=checkbox]").change();		
	});

	
	
});

//수량증가
function addQuantityShortcut(id, index){
	var quantity = $("#"+id).val();
	var result=0;
	console.log(quantity);
	result = parseInt(quantity)+1;
	console.log(result);
	$("#"+id).val(result);
	
	
}

//수량감소
function outQuantityShortcut(id, index){
	var quantity = $("#"+id).val();
	var result=0;
	console.log(quantity);
	if(quantity > 1){
		result = parseInt(quantity)-1;
		console.log(result);
		$("#"+id).val(result);
	}
}

// 수량변경 전송 
/*function modifyQuantity(index){
	
	$('#quantity_'+index).submit();
	
	 $.post("/h72/updateQuantity", {itemId : itemid, quantity : quantity }
		); 
	
	$.ajax({
		type:"post",
		url: "/h72/updateQuantity",
		data :{"itemId":itemid, "quantity":quantity},
		success : function(data){
			$(".total strong")
			
		}
		
	}); 
}
*/
function modifyQuantity(index){
	var itemId = $('#item_id_'+index).val();
	var quantity = $('#quantity_id_'+index).val();
	console.log(itemId);
	$('#quantity_'+index).submit();
	location.href="/h72/updateQuantity?quantity="+quantity+"&itemId="+itemId;
}




//item삭제
function deleteBasketItem(index){
}

//선택삭제  
function deleteBasketChk(){
	
	 $('input[name=basketItem_chk]').each(function() {

	     if($(".xans-record- input[name=basketItem_chk]").is(":checked")){ //값 비교

	    	 var checkId = $(this).val();
				for(var i=0; i<checkId.length; i++){
					console.log(checkId[i]);
				}
	      }

	 });
	
	
		
		
		$.ajax({
			type:"post",
			url: "/h72/deleteBasketChk",
			data :{"cartId":checkId},
			success : function(data){
				alert(data);
				
			}
			
		}); 
	
}

// 장바구니 비우기
function emptyBasket(){
	if(confirm("장바구니를 비우시겠습니까?")){
	location.href="/h72/emptyBasket";}
	
}