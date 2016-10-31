$(document).ready(function(){
	/*option add*/
	$("#productEnroll_priceBtnWrap").click(function(){
		var subListNum = 1;
		var subOption = "<ul id='productEnroll_subList"+subListNum+"'>"+$("#productEnroll_priceInputWrap ul:first-child").html()+
						"<li><span class='productEnroll_deleteOption'>x</span></li></ul>";
		
		$("#productEnroll_priceInputWrap").append(subOption);
		
		var height = $("#productEnroll_table tr:nth-child(3)").height();
		height += 30;
		$("#productEnroll_table tr:nth-child(3)").css("height", height);
	});
	
	/*option delete*/
	$(document).on('click', ".productEnroll_deleteOption", function() {
		  var subListId= $(this).closest('ul').attr('id');
		  $("#"+subListId).remove();
		  
			var height = $("#productEnroll_table tr:nth-child(3)").height();
			height -= 30;
		  $("#productEnroll_table tr:nth-child(3)").css("height", height);
	});
	
	OptionExplanationOpen = function() {
		$("#productEnroll_explanation p").css("display","block");
	} 
	OptionExplanationclose = function() {
		$("#productEnroll_explanation p").css("display","none");
	} 
	
	
	
	/*상점 정보 변경*/
	$("#productEnroll_provider").change(function(){
		var index = $("#productEnroll_provider option").index($("#productEnroll_provider option:selected"))+1;
		$("#productEnroll_providerInfoWrap ul").css("display","none");
		var providerInfoId = "#productEnroll_providerInfoWrap ul:nth-child("+index+")";
		$(providerInfoId).css("display","block");
		
	});
	
	

});