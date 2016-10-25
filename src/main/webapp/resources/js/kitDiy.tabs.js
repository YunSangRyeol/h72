//tabs
$(document).ready(function(){
	$(".tabs li").click(function(){
		
		for (var i = 1; i < $(".tabs li").length+1; i++) {
			$(".tab" + i).css("display","none");
			
			/* 개인 추가 작업 */
		}
		$(".tabs li").css("background","white");
		$(".tabs li").css("color","black");
		
/*		var selectTab = ".tabs li:nth-child("+(index+1)+")";

		$(selectTab).css("background","black");
		$(selectTab).css("color","white");*/
		
		$(this).css("background","black");
		$(this).css("color","white");
		
		var index = $( ".tabs li" ).index( this );
		var tabNum = ".tab" + (index+1);
		$(tabNum).css("display","block");
		
		/* 개인 추가 작업 */
		$(".kitDiy_productList").removeClass("selected");
		 var listId = "#select_product" + (index+1);
		 $(listId).addClass("selected");
		
		});
	});
	

	
	
