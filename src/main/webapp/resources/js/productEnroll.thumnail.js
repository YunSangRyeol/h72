// 사진파일 다중 업로드
$(document).ready(function() {
	 var num = 1;
	 
	$(".file_input_hidden").change(function() {
		console.log("변화된 n값 : " + n);
		
		var ext = $("#upBtn"+n).val().split(".").pop();
		console.log($("#upBtn"+n).val().split(".").pop());
		ext.toLowerCase();
		
		if(ext.length > 0){
			if($.inArray(ext,['gif','png','jpg','jpeg']) == -1) { 
				alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
				this.value = "";
				return;  
			} else {
				readURL(this);	
				if(num != 6){	
					$(this).hide();	
				}
		 		$("input[name='reviewPhoto"+(num+1)+"']").show();              
			}
		}
		n++;
		
	 });
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				var thumnailId = "thumnail"+ num;
				$('#'+thumnailId).css("width","74px");
				$('#'+thumnailId).css("height","74px");
				$('#'+thumnailId).attr('src', e.target.result);
				num++;
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
});
// 리뷰쓰기 사진 올리기 버튼
var n = 1;
$(function(){          
	console.log("ok");
	console.log(n);
	$('#productEnroll_photo').click(function(e){
		e.preventDefault();
		
		if(n < 3){
			$("#upBtn" + n).click();         
			$("input:file").val().toLowerCase();
		}else{
			alert("사진은 최대 2장까지만 업로드할 수 있습니다.")
		}
	});       
	
			
});
