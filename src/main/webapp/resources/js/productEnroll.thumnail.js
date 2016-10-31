// 사진파일 다중 업로드
$(document).ready(function() {
	 var num = 1;
	
	 $('#productEnroll_photo').click(function(e){
			e.preventDefault();
			if(num < 3){
				$("#upBtn" + num).click();         
				$("input:file").val().toLowerCase();
			}else{
				alert("사진은 최대 2장까지만 업로드할 수 있습니다.")
			}
			 
		});    
	/* function inputThumbnail(){*/
	 $(document).on('change', ".file_input_hidden", function(){
	/*$(".file_input_hidden").change(function() {*/
		console.log("변화된 n값 : " + num);
		/*확장자를 얻기 위한 것*/
			var ext = $("#upBtn"+num).val().split(".").pop();
			console.log($("#upBtn"+num).val().split(".").pop());
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
			 		$("input[name='img"+(num+1)+"']").show();              
				}
			}
	 });
	/* }*/
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				var thumnailId = "thumnail"+ num;
				$('#'+thumnailId).css("width","67px");
				$('#'+thumnailId).css("height","67px");
				$('#'+thumnailId).attr('src', e.target.result);
				var thumnailWrapId = "thumnailWrap"+num;
				$('#'+thumnailWrapId+" span").css("display","block");
				num++;
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	/*thumbnail 이미지 삭제*/
	$(document).on('click', ".productEnroll_thumDelete", function() {
		/*img div감싸고 있는거*/
		var thumnailWrapId = $(this).closest("div").attr("id");
		/*img 태그 */
		var thumnailId = $(this).closest("div").find("img").attr("id");

		/* var fileWrap = $(".fileWrap").html();*/
		/*사진이 두개일때 첫번째 이미지를 지웠을 경우*/
		if(num>2 && thumnailId == "thumnail1"){
				var srcSource = $('#thumnail2').attr('src');
				$('#thumnail1').attr('src', srcSource);
				/*사진, x 안보이게 */
				$('#thumnailWrap2 span').css("display","none");
				
				/*thumnail 스타일, 경로 지우기*/
				$('#thumnail2').removeAttr('style');
				$('#thumnail2').attr('src', '');
				
				/*<input type="file"> 초기화*/
			
		}else{
			/*사진, x 그리기 */
			$('#'+thumnailWrapId+" span").css("display","none");
			
			/*thumnail 스타일, 경로 지우기*/
			$('#'+thumnailId).removeAttr('style');
			$('#'+thumnailId).attr('src', '');
			
		}
		
		num--;
		/*$(".fileWrap").html(fileWrap);*/
		
	});
	
});

// 리뷰쓰기 사진 올리기 버튼
/*var n = 1;
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
	
			
});*/
