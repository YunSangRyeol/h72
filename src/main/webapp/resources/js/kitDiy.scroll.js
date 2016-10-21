$(window).scroll(function(){
		if($(document).scrollTop()>=400){
			$("#kitDiy_minuMenu").addClass("fixed");
		}else if($(document).scrollTop()<410){
			$("#kitDiy_minuMenu").removeClass("fixed");
	 	}
		
	});