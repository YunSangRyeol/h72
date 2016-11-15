<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/h72/resources/css/detail.css" />
<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<!-- <script type="text/javascript">
function ResizeFrame(name)
{
  // IFRAME 내부의 body 개체
  var fBody  = document.frames(name).document.body;
  alert(fBody);
  // IFRAME 개체
  var fName  = document.all(name);

  // IFRAME 내부의 body개체의 넓이를 계산하여 IFRAME의 넓이를 설정해 준다.
  fName.style.width 
    = fBody.scrollWidth + (fBody.offsetWidth - fBody.clientWidth);
  // IFRAME 내부의 body개체의 높이를 계산하여 IFRAME의 높이를 설정해 준다.
  fName.style.height 
    = fBody.scrollHeight + (fBody.offsetHeight - fBody.clientHeight);

  // 만약 IFRAME의 크기 설정에 실패 하였다면 기본크기로 설정한다.
  if (Frame_name.style.height == "0px" || Frame_name.style.width == "0px")
  {
    fName.style.width = "700px";     //기본 iframe 너비
    fName.style.height = "300px";    //기본 iframe 높이
  }
}
</script> -->
<script>

  // iframe 높이 자동맞춤
  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
  }
</script>
<title>Insert title here</title>
</head>


<body id="main">
<div id="detail_top">
    <!-- <li><a href="#" id="scrollup" style="display: none;">TOP</a></li> -->
    
    
    <jsp:include page='../main_header.jsp' flush="false" />
    
 
</div>  

<!-- START -->
    
<div id="detail_wrap">

    
	<div id="detail_contents">
    	<div id="detail_in">
		
			<!-- 상단 제품 정보  --> 

			<div class="xans-element- xans-product xans-product-detail">
				<div class="detailArea">
				
        	<!-- 이미지 영역 -->
        			<div class="xans-element- xans-product xans-product-image imgArea ">
        				<div class="keyImg"> 
                		<img src="/h72/resources${itemDetailList.get(0).MAIN_IMG }" alt="" class=" ">
               			&nbsp;
               		
            <!-- LOGGER SCRIPT FOR SETTING ENVIRONMENT V.27 :  / FILL THE VALUE TO SET. -->
					<script type="text/javascript">
					_TRK_PN_URL = "http://10world.co.kr/web/product/medium/201610/2921_shop1_357825.jpg";
					</script>
			<!-- END OF ENVIRONMENT SCRIPT -->
     
            <!-- Facebook Pixel Code -->
					<script>
					!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
					n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
					n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
					t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
					document,'script','https://connect.facebook.net/en_US/fbevents.js');
					
					fbq('init', '716848241786083');
					fbq('track', "ViewContent");
					</script>
					
					<noscript>&lt;img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=716848241786083&amp;amp;ev=PageView&amp;amp;noscript=1"/&gt;</noscript>
			<!-- End Facebook Pixel Code -->
                
                
			<!-- Withpang Tracker v3.0 start -->
			 <script src="http://cdn.megadata.co.kr/js/enliple_min2.js"></script>
			 <script type="text/javascript">
			<!--
			   var sh = new EN();
			   // [상품상세정보]
			   sh.setData("sc", "2aeda194ced0f8223b633c0c1b9af419");
			   sh.setData("pcode","2921");
			   sh.setData("price","9900");
			   sh.setData("pnm",encodeURIComponent(encodeURIComponent("2016ver. 데일리 MTM")));
			   sh.setData("img",encodeURIComponent("http://10world.co.kr/web/product/medium/201610/2921_shop1_357825.jpg"));
			   sh.setData("userid", "kkkyu00");
			   sh.setData("cate1",encodeURIComponent(encodeURIComponent(sh.getParam(location.href, "cate_no"))));
			   sh.sendRfShop();
			 //-->
			 </script>
			<!-- Withpang Shop Log Tracker v3.0 end -->


            			</div>
					</div>
			<!-- //이미지 영역 -->

        	<!-- 상세정보 내역 -->
        <div class="infoArea">   
        
        <h3 class="resize">${itemDetailList[0].ITEM_NAME}<span class="bookmark mouse_on"> 
            <div id="cssmenu1">
            <ul>
			<li class="has-sub" style="padding:3px 10px 3px 10px; float:right; font-size:11px;">
				<a href="http://10world.co.kr/board/free/read.html?no=559012&amp;board_no=1"><img src="/h72/resources/image/icon_detailtop1.png" style="margin:-1px 5px 0 0;">회원등급별혜택보기</a>
            	<ul>
                <li><a href=""><span class="title">SILVER</span>구매금액의 <span class="blue">3%</span> 적립</a></li> 
                <li><a href=""><span class="title">GOLD</span>구매금액의 <span class="blue">5%</span> 적립</a></li>
                <li class="last"><a href=""><span class="title">DIAMOND</span>구매금액의 <span class="red">10%</span> 적립</a></li>
                </ul>
			</li> 
            </ul>
			</div>
			<script>
			var _itemDetailId = "${itemDetailId}";
			
			$(document).ready(function(){
				//.has-sub ul li ul
				
				$("#cssmenu1 ul li").hover(function(){
						$("#cssmenu1 > ul > li > ul").css({'left':'0px', 'opacity':'1'});
				},function(){
						$("#cssmenu1 > ul > li > ul").css({'left':'-9999px', 'opacity':'0'});
				});
				
				
			});
			</script>    
			<script>
            $(document).ready(function(){
            	alert();
            	var itemFullNameTrim = '${itemDetailList.get(0).ITEM_NAME}';
    			console.log("111 : " + itemFullNameTrim);
    			itemFullNameTrim = itemFullNameTrim.trim();
    			console.log("222 : " + itemFullNameTrim);
            	//$("#span_mileage_text").text();            	
            	var mileage = numberWithCommas(Math.floor(Number('${itemDetailList[0].SAIL_PRICE}')*Number('${loginUser.pointRate}')/100));
            	$("#span_mileage_text").text(mileage + "원"); 
            	var price = Number($("#span_product_price_text").next().text());
            	var totalprice = 0;
            	var totalcount = 0;
            	var remain = 0; // 총재고량 ( 재고량 - quantity )
            	//alert(typeof(remain));
            	
            	var hiddenLength = $(".hiddenRemain").length;
            	var arrRemain = new Array(hiddenLength);
            	var arrDataName = new Array(hiddenLength);//data-name 배열 
            	//alert("hiddenLength : " + hiddenLength);
            	//alert("arrRemain.length : " + arrRemain.length);
            	
            	//각 상품 옵션의 재고량 배열에 입력
             	for(var i = 0; i < hiddenLength; i++){
	            	arrRemain[i] = $("#hiddenRemain" + i).val(); //옵션 각각 상품 재고량
	            	arrDataName[i] = $("#hiddenRemain" + i ).attr("data-name"); //옵션 각각 상품 data-name
	            	remain += Number(arrRemain[i]); //총 재고량
            	}
             	//console.log("총 재고량: " + remain);
             	
             	/*배열 값 잘 들어왔는지 확인
             	for(i = 0; i < arrRemain.length; i++){
             		if(!arrRemain[i]) continue; // null, undefined, 빈 원소일 때 건너뜀
             		alert("arrRemain["+i+"] :" + arrRemain[i]);
             	}
             	*/
            	
            	
            	//총 재고량 function
            	/* function remaincal(quantity){
            		remain -= quantity;
            	} */
            	
            	
            	var itemPrice = document.getElementById('itemPrice').value;
            	itemPrice = numberWithCommas(itemPrice);
            	$("#span_product_price_text").text(itemPrice + "원");
            	
            	
            	//옵션 '+' 클릭
            	$(document).on("click", ".numbtn_plus", function(){
            		symbol = "plus";
            		var papaid = $(this).parent().parent().parent().parent().attr("id");//클릭시 해당하는 버튼의 부모 div 아이디
            		var inputtext = $(this).prev().prev().attr("id");//클릭시 input text의 수량 아이디 --> quantity
            		var quantity = $("#"+inputtext).val();//input 태그의 value 수량 값
            		var pc = $(this).parent().next().children().attr("class")//클릭시 해당되는 버튼요소로부터 선택된 옵션의 가격 글자 
            		quantity = priceCal(quantity, symbol, inputtext, pc);
            		console.log(quantity);
            		
            	});
            	//옵션 '-' 클릭
           		$(document).on("click", ".numbtn_minus", function(){
            		var symbol = "minus";
            		var papaid = $(this).parent().parent().parent().parent().attr("id");//클릭시 해당하는 버튼의 부모 div 아이디
            		var inputtext = $(this).prev().attr("id");//클릭시 input text의 수량 아이디 --> quantity
            		var quantity = Number($("#"+inputtext).val());//input 태그의 value 수량 값
            		var pc = $(this).parent().next().children().first().attr("class")//클릭시 해당되는 버튼요소로부터 선택된 옵션의 가격 글자 
            		quantity = priceCal(quantity, symbol, inputtext, pc);
            		console.log(quantity);
            		
            	});
            	
           		//옵션 +,- 금액합계
            	function priceCal(quantity, symbol, inputtext, pc){
            		if(symbol == "plus"){
	            		quantity++;
	            		$("#"+inputtext).val(quantity);//선택된 옵션에 수량 변경
	            		console.log(totalprice);
	            		//totalprice += (price * quantity);//전체 가격
	            		totalprice += price;//전체 가격
	            		//$("#span_product_price_text").text(price * quantity + "원");//상품정보 가격
	            		$("."+pc).children().first().text(numberWithCommas(price * quantity));//선택된 옵션에 가격 변경
	            		totalcal ( quantity - ( quantity - 1 ) ); //총 금액
            		}else if(symbol == "minus"){
            			if((quantity-1) < 1){
            				alert("1개 이상 선택해주세요");
            			}else{
	            			$("#" + inputtext).val(quantity - 1);
	            			totalprice -= (price * (quantity - (quantity - 1)));
	            			//$("#span_product_price_text").text(totalprice + "원");
	            			$("." + pc).children().first().text(numberWithCommas(price * (quantity - 1)));
	            			totalcal( - (quantity - (quantity - 1))); //총 금액
	            			quantity--;
            			}
            		}
            		//totalcal ( quantity - ( quantity - 1 ) );
            		return quantity;
            	}
            	
           		//총금액 합계
            	function totalcal(quantity){
            		//totalprice = totalprice1; //총합계
            		remain -= quantity; //총 재고량
            		totalcount += quantity;//주문수량
            		$(".ui_total_price").text(numberWithCommas(totalprice));
            		$(".ui_total_count").text(totalcount);
            		
            		console.log("총 재고량 : " + remain);
            		//alert("remain : " + remain);
            	}
            	
            	//////////////////////////////////////////////////////////////////////////////
            	var opnum = 1;
				var op = null;
				var remainop = null;
				var remainindex = null;
				var temp = null;
				
				//옵션 선택시
				$("#product_option_id1").change(function(){
					// 옵션선택 시 총 금액 div show()
					$(".prdc_total").show();
					
					console.log("opnum: " + opnum);
					op = $(this).val();
					console.log("op: " + op);
					console.log("op.length: " + op.length);
					console.log("remainop_before: " + remainop);
					
					//옵션선택 시 동일한 옵션이 선택되어있으면 alert(), 없으면 옵션div 추가
					for(var i = 1; i < opnum+1; i++){
						remainop = $("#option_mini_wrap" + i + " > ul > #option_mini > em").text();
						console.log("remainop_after: " + remainop);
						remainindex = remainop.indexOf(op);
						console.log("remainindex: " + remainindex);
						if(remainindex >= 0){temp = "exist"; break;}
						if(remainindex == -1) temp = "no-exist";
					}
					console.log("temp: " + temp);
					if(temp == "exist"){
						alert("이미 선택되어있습니다.");
						//opnum--;
					}else if(temp == "no-exist"){
						$("#option_mini").after(
								"<div id='option_mini_wrap" + opnum + "' class='option_mini ui_optSelWrapper position_top'>"
								+"<ul><li id='option_mini' data-amount='1' data-price='9900'>"
								+"		<em>" + op + "</em>"
								+"		<div class='plusminus_wrap'>"
								+"			<input id='quantity" + opnum + "' type='text' name='prdcAmount' class='text' title='수량설정' value='1' readonly>"
								+"			<button type='button' class='numbtn_minus'><span class='hide'>수량감소</span></button>"
								+"			<button type='button' class='numbtn_plus'><span class='hide'>수량증가</span></button>"
								+"		</div>"
								+"		<div class='sel_price'>"
								+"			<p class='pc" + opnum + "'><strong>" + itemPrice + "</strong>원</p>"
								+"	        <button type='button' class='btn_cc' id='btn_cc"+opnum+"'><span class='hide'>취소</span></button>"
								+"		</div>"
								+"</li></ul></div>"
						);
						console.log(totalprice);
						var addprice = Number(uncomma($(".pc"+opnum).children().first().text()));
						var addcount = Number($("#quantity" + opnum).val());
						totalprice += addprice;
						totalcal(addcount);
						console.log(totalprice);
						
						opnum++;
						//totalcal 추가해줘야함 1개씩 여러 종류가 선택만 되도...
					}
					console.log("opnum: " + opnum);
					console.log("-----------------------");
					
				});
				
				// 취소 btn 클릭시 선택된 옵션 삭제
				$(document).on("click", ".btn_cc", function(){
					var papaid = $(this).parent().parent().parent().parent().attr("id");
					
            		$(this).parent().parent().parent().parent().remove();
            		console.log("delete click after opnum: " + opnum);
            		//opnum--;
            		//옵션선택 삭제 시 남아있는 옵션이 없을 시 총합계 div invisible 
            		var leg = $(".option_mini.ui_optSelWrapper.position_top");
            		if(leg.length == 0){//배열로 갖고와서 해당하는 div가 남아있으면 남아있는 갯수를 반환
            			$(".prdc_total").css("display", "none");
            			var price = Number($("#span_product_price_text").next().text());
            			$(".ui_total_price").text(numberWithCommas(price));
            		}
            		//total금액이 product금액과 같으면if(opnum )
            		
            		//취소버튼 눌렀을 때 totalprice에서 취소되는 상품가격만큼 뺴주는 작업
            		var price = Number(uncomma($(this).prev().children().first().text()));
            		var quantity = Number($(this).prev().parent().siblings().eq(1).children().first().val());//input 태그의 value 수량 값
            		totalprice -= price;
            		
            		totalcal(-quantity);
            		
            		
            		console.log(totalprice);
            		console.log(totalcount);
            		//$(".ui_total_price").text(price);
           		});
				
				// 장바구니 버튼 클릭 시 호출 메소드
				document.getElementById("cartBtn").onmousedown = sendCart;
				document.getElementById("purBtn").onmousedown = sendCart;
			    function sendCart() {
			    	console.log("thisthisthisthis");
			    	var kinds = $(this).attr('data-type');//purchase(구매) or cart(카트)
			    	var loginUser = '${loginUser.name }';
			    	var loginUserId = '${loginUser.userid}';
			    	var arrSelect = $(".option_mini.ui_optSelWrapper.position_top");//추가된 옵션 div 배열
			    	var arrSelectNum = new Array();//추가된 옵션 div 배열에서 각각 id 끝자리에 있는 num을 담을 배열
			    	//alert("arrSelect length : " + arrSelect.length);
			    	for(var i = 0; i < arrSelect.length; i++){
			    		arrSelectNum.push($(arrSelect[i]).attr("id").substring( $( arrSelect[i] ).attr( "id" ).length - 1 ) );// 추가된 옵션 div 마지막 num 뽑아내기
			   			//$(a[0]).attr("id").substring($(a[0]).attr("id").length-1)
			    	}
			    	var arrQuantity = "";
			    	var arrCost = "";
			    	var arrOpName = "";
			    	var op_count = $(".option_mini.ui_optSelWrapper.position_top").length;
			    	//var arrQuantity = new Array(); //quantity
		    		//var arrCost = new Array(); //cost
		    		//var arrOpName = new Array(); //itemOptionName
		    		
		    		//비회원일 시 장바구니 클릭 시 고유의 세션 아이디 가져옴
		    		if(loginUserId == ""){
		    			loginUserId = '<%= session.getId()%>';
		    		}
		    		
		    		
		    		
		    		
			    	if(op_count == 0){
			    		alert("필수 옵션을 선택해주세요.");
			    	}else{
			    		
			    		//if(loginUser != ""){
			    			//로그인했을 때 장바구니 담기 기능//로그인안했을 때는 컨트롤러에서 ip주소를 저장
			    			
			    			//배열로 보내는 방법이 잘 안되서 구분자를 이용해서 선택된 옵션들을 문자열합치기 하고 있음
				    		for(var i = 0; i < op_count; i++){
				    			if(i < (op_count - 1)){
					    			arrQuantity += $( "#option_mini_wrap" + arrSelectNum[i] + "> ul > li #quantity" + arrSelectNum[i] ).val();
					    			arrQuantity += ";";
					    			arrCost += uncomma($("#option_mini_wrap" + arrSelectNum[i] + "> ul > li div.sel_price > p > strong").text());
					    			arrCost += ";";
					    			arrOpName += $("#option_mini_wrap" + arrSelectNum[i] + "> ul > #option_mini > em").text();
					    			arrOpName += ";";
				    			}else{
				    				arrQuantity += ($( "#option_mini_wrap" + arrSelectNum[i] + "> ul > li #quantity" + arrSelectNum[i] ).val());
				    				arrCost += uncomma($("#option_mini_wrap" + arrSelectNum[i] + "> ul > li div.sel_price > p > strong").text());
				    				arrOpName += $("#option_mini_wrap" + arrSelectNum[i] + "> ul > #option_mini > em").text();
				    			}
				    		}
				    		
			    			
			    			
					    	$.ajax({
					    		url : '/h72/detail/insertCart' ,
					    		type : 'post' , 
					    		data : {quantity : arrQuantity ,
					    				cost : arrCost ,
					    				itemOptionName : arrOpName , 
					    				op_count : op_count ,
					    				userid : loginUserId ,
					    				itemFullName : '${itemDetailList.get(0).ITEM_NAME}' , //155번 low 참조
					    				itemDetailid : '${itemDetailList.get(0).ITEM_DETAIL_ID}' ,
					    				mainImg : '${itemDetailList.get(0).MAIN_IMG}' ,
					    				message : null ,
					    				KitYN : 'N' ,
					    				kinds : kinds},
					    		// 리턴 받는 dataType이 json이면 dataType을 json으로 변경
					    		dataType : 'json' ,
					    		success : function(data) {
					    			if(kinds == 'cart'){
						    			alert("return : " + data.result + "\ncount(추가된 상품 수) : " + data.count);
						    			if(data.result > 0) {alert(data.result + "개 insert 성공!"); $("#confirmLayer").css("display", "block");}
						    			if(data.result == 0) {alert("insert 실패!");}
						    			if(data.result == -1) {alert("해당 상품이 카트에 이미 있습니다."); $("#confirmLayer").css("display", "block");}
					    			}else if(kinds == 'purchase'){
					    				purchase(data.cartId);
					    			}
					    		} ,
					    		error : function(){
					    			alert("error : 추가옵션을 선택하세요");
					    		}
					    	});
			    	}
			    }

			    
            });
            
           
            //콤마 찍기
            function numberWithCommas(x) {
                return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }
            
          	//콤마풀기
            function uncomma(str) {
                str = String(str);
                return str.replace(/[^\d]+/g, '');
            }
          	
          	function purchase(cartId){
				alert("구매합니다.");
          		location.href = "/h72/directOrder?cartAll=" + cartId; 
          	}
          	
            </script>
			        
            <!-- <a href="javascript:BookMarkNow();" style="font-size:11px; padding:2px 10px 3px 10px; float:right; cursor:pointer; margin-right:0px;"><img src="/web/upload/sunny/image/icon_detailtop2.png" style="margin:-1px 5px 0 0;"><span style="color:#4da1bd; font-size:11px;">즐겨찾기추가</span></a></span> -->
        </h3>      
        
        <p class="displaynone">() 해외배송 가능</p> 
        <table id="pdInfo" border="1" summary="">
			<caption>${itemDetailList[0].ITEM_NAME }</caption>
            <tbody>
            <tr class="custom0">
				<th scope="row">소비자가</th>
                    <td>
                        <strong id="product_custom" class="" style="font-size:12px; font-weight:400;"><span style="text-decoration:line-through;">0원</span></strong> 
                    </td>
                </tr>
			<tr class="price">
				<th scope="row" class="resize">판매가</th>
				
                <td class="td-color2 mem_lv_wrap">
                	<strong id="span_product_price_text" class="ProductPrice" style="color:#ef4141;">9,900원</strong><label style="display: none">${itemDetailList[0].SAIL_PRICE }</label>
                    <a href="#none" class="displaynone" sms_restock_login_display="1" name="btn_restock" id="btn_restock" onclick="alert('');"><img src="http://img.echosting.cafe24.com/design/skin/default/product/btn_sms.gif" alt="재입고 알림 SMS"></a>
                    <!-- input hidden ITEM_PRICE -->
                    
                    <input type="hidden" id="itemPrice" name="itemPrice" value="${itemDetailList[0].SAIL_PRICE }" style="width:0; height:0">
                </td>
            </tr>
			<tr class="resize">
				<th scope="row">적립금</th>
                <td class="td-color1">
                	<ul class="mileage">
					<li class="">
						<span id="span_mileage_text">${itemDetailList[0].SAIL_PRICE}*(${loginUser.pointRate}/100)</span> <span class="">(${loginUser.pointRate}%)</span>
					</li>
                    <li class="displaynone">
						<img src="" alt="무통장 결제시 적립금"> 0 원<span class="displaynone">( %)</span>
					</li>
                    <li class="displaynone">
						<img src="" alt="카드 결제시 적립금"> 0 원<span class="displaynone">( %)</span>
					</li>
                    <li class="displaynone">
						<img src="" alt="실시간 계좌 이체시 적립금"> 0 원 <span class="displaynone">( %)</span>
					</li>
                    <li class="displaynone">
						<img src="/h72/resources/image/icon_201403181204001600.gif" alt="적립금 결제시 적립금"> 0 원<span class="displaynone">( %)</span>
					</li>
                    <li class="displaynone">
						<img src="" alt="휴대폰 결제시 적립금"> 0 원<span class="displaynone">( %)</span>
					</li>
                    <li class="displaynone">
						<img src="" alt="예치금 결제시 적립금">0 원<span class="displaynone"> %)</span>
					</li>
                    </ul>
				</td>
			</tr>
			<tr class="displaynone">
				<th scope="row">제휴적립금</th>
                <td class="td-color1">
                      	 네이버 마일리지  적립
                	<img src="" id="imgNaverMileageHelp" onclick="">
                    &nbsp;
                </td>
            </tr>
			</tbody>
			
			<tbody>
			<tr class="displaynone">
				<th scope="row">구매tip</th>
                <td style="line-height:20px;"></td>
            </tr>
			</tbody>
			
			<tbody class="xans-element- xans-product xans-product-option xans-record-">
			<tr class="xans-element- xans-product xans-product-option xans-record-">
				<th>옵션선택</th>
				<td>
					<select option_product_no="2921" option_select_element="ec-option-select-finder" option_sort_no="1" option_type="T" item_listing_type="S" option_title="색상선택" product_option_area="product_option_2921_0" name="option1" id="product_option_id1" class="ProductOption0" option_style="select" required="true">itemDetai
						<option disabled value="*" selected="selected">- [필수] 옵션을 선택해 주세요 -</option>
						<option disabled value="**">------------------------------------</option>
						<c:forEach var="i" begin="0" end="${itemDetailList.size() - 1 }" step="1">
						<option value="${itemDetailList.get(i).ITEM_OPTION_NAME }">${itemDetailList.get(i).ITEM_OPTION_NAME }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			</tbody>
		</table>
		
			<!-- 옵션 -->
			<div id="option_mini" class="option_mini ui_optSelWrapper position_top_ex" style="display:none" >
    		<!-- 기본옵션 선택한 정보 : 1 -->
				<ul>
				    <li id="option_mini" data-amount="1" data-addprc="-3000" data-price="9900">
				        <em>2016ver. 데일리 MTM / </em>
				        <div class="plusminus_wrap">
				            <input id="quantity" type="text" name="prdcAmount" data-prdstckno="6145046693" class="text" title="수량설정" value="1" readonly>
				            <button type="button" class="numbtn_minus"><span class="hide">수량감소</span></button>
				            <button type="button" class="numbtn_plus"><span class="hide">수량증가</span></button>
				        </div>
				        <div class="sel_price">
				            <p class="pc"><strong>9900</strong>원</p>
				            <button type="button" class="btn_cc_ex" ><span class="hide">취소</span></button>
				        </div>
				    </li>
				</ul>
			</div>
			
			<div class="prdc_total" name="divPrdcTotalPrcArea" style="display: none">
			    <!-- [16-08-19 hhj] 수정 -->
			    <!-- 가격 -->
			    <div class="total_price">
			        <strong class="txt_tt">총 합계금액(수량)</strong><!-- [16-08-29 ckh] strong 태그로 수정 -->
			        <span class="total_pr"><strong class="ui_total_price" name="totalPriceArea">9,900</strong>원(<span class="ui_total_count">1</span>개)</span>
			    </div>
			    <!-- //[16-08-19 hhj] 수정 -->
			</div>
			
			<c:forEach var="i" begin="0" end="${itemDetailList.size() - 1 }" step="1">
				<input type="hidden" id="hiddenRemain${i}" class="hiddenRemain" value="${itemDetailList.get(i).STOCK }" data-name="${itemDetailList.get(i).ITEM_OPTION_NAME }"/>
			</c:forEach>
			
            
		
		<!-- 
		
		<div id="zoom_wrap"></div>
 
        <p class="displaynone "><img src="http://img.echosting.cafe24.com/design/skin/default/product/txt_naver.gif" alt="개인결제창을 통한 결제 시 네이버 마일리지 적립 및 사용이 가능합니다."></p>
        <p class="displaynone "><img src="/design/product/txt_naver.gif" alt="개인결제창을 통한 결제 시 네이버 마일리지 적립 및 사용이 가능합니다."></p>
        <p class="displaynone "><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/txt_naver.gif" alt="개인결제창을 통한 결제 시 네이버 마일리지 적립 및 사용이 가능합니다."></p> 
        
        -->
            <!-- //상세정보 내역 -->


            <!-- 참고 : 뉴상품관리 전용 모듈입니다. 뉴상품관리 이외의 곳에서 사용하면 정상동작하지 않습니다. -->
            <!-- //참고 -->
 
 

            <!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
            <div class="xans-element- xans-product xans-product-action ">
            	<div class="btnArea" style="width:500px;">
                    <a id="purBtn" data-type="purchase" href="#none" class="first " onclick="product_submit(1, '/exec/front/order/basket/', this)">
                    	<img src="/h72/resources/image/btn_buy.png" onmouseover="this.src='/h72/resources/image/btn_buy_h.png'" onmouseout="this.src='/h72/resources/image/btn_buy.png'" style="float:left;">
                    </a>
                    <a id="cartBtn" data-type="cart" href="#none" class="" onclick="product_submit(2, '/exec/front/order/basket/', this)">
                    	<img src="/h72/resources/image/btn_cart.png" onmouseover="this.src='/h72/resources/image/btn_cart_h.png'" onmouseout="this.src='/h72/resources/image/btn_cart.png'" style="float:left;">
                    </a>
                    
                    <span class="displaynone">SOLD OUT</span>
                </div>





				<input id="loginUser" type="hidden" value="${loginUser.name }" />
                
				<!-- Withpang Tracker v3.0 [장바구니&관심상품] start -->
				
				<script type="text/javascript">
				  
				  
				      //sh.sendCart();
				      
				    
				  
				</script>
				<!-- Withpang Tracker v3.0 [장바구니&관심상품] end -->

				<!-- 네이버 체크아웃 구매 버튼 -->
				<div id="NaverChk_Button"></div>
				<!-- //네이버 체크아웃 구매 버튼 -->
                            
			</div>
			<!-- //참고 -->
        </div>
    </div>
    
    
	</div>
	<!-- //상단 제품 정보 -->


	<div class="xans-element- xans-product xans-product-additional ">
	
	<!-- 상품상세정보 -->
	
	<div id="prdDetail"> 
		<div class="cont"> 
			<center>
			
			<p><img src="/h72/resources${itemDetailList.get(0).DETAIL_IMG01 }"></p>
			
			<c:if test="${not empty itemDetailList.get(0).DETAIL_IMG02}">
				<p><img src="/h72/resources/${itemDetailList.get(0).DETAIL_IMG02 }"></p>
			</c:if>
			<c:if test="${empty itemDetailList.get(0).DETAIL_IMG02}">
			</c:if>
			
			
			</center> 
		</div>
	</div>
	
	<!-- //상품상세정보 -->
	<div class="xans-element- xans-prddetail ">
		<div class="conttext">
			<div style="margin:0 auto; width:800px; padding:0px 0 20px 0;">
	        	<h3 style="margin-bottom:20px;">CHECK IT</h3> 
	            <h4>결제방법</h4>
			            결제는 무통장입금 / 실시간 계좌이체 / 카드결제 / 휴대폰결제 / 에스크로결제를 이용하실 수 있습니다.<br>
			            무통장입금 주문시 입력한 입금자명과 실제 입금자의 성명이 꼭 일치해야 합니다.<br>
			            주문자명과 입금자명이 다를시에는 고객센터나 게시판으로 연락주시길 바랍니다.<br>
			            주문서 작성 후 <strong>4일이내</strong>에 입금확인이 되지 않을 경우 자동으로 주문서가 취소됩니다.<br><br><br><h4>교환반품안내</h4>
			            상품구매 전 색상 및 사이즈를 꼭 확인해 주시고 구매 부탁드립니다.<br>
			            교환 및 반품은 상품을 수령 후 <strong>7일이내</strong> h72로 보내주셔야 합니다.<br>
			            상품 수령 후 <strong>3일이내</strong>에 교환 및 반품을 진행해 주시길 바랍니다.<br>
			            상품하자 및 h72의 실수로 인한 교환은 h72에서 배송비를 부담해서 교환처리 해드립니다.<br>
			            단, 동일상품/동일옵션의 상품으로 교환이 아닌 경우 변심으로 간주되어 배송비는 고객님께서 부담하셔야 합니다.<br>
			            반품 및 교환 상품이 소비자의 책임으로 훼손 또는 변경된 상품으로 판명 될 경우 전자상거래법 및 소비자 보호에 관한 법률에 의해<br>
			            손해배상을 청구할 수 있습니다.<br><br><br><h4>교환 및 반품이 불가능한 경우</h4>
			            교환 및 반품접수시일이 지난 경우<br>
			            교환 및 반품양식을 위반한 경우<br>
			            택, 라벨을 제거한 경우<br>
			            교환/반품 불가를 표시한 상품<br>
			            h72에 도착한 상품의 가치가 훼손된 경우<br><br><br><h4>배송안내</h4>
			            제주도를 포함한 전국 지역 배송요금은 <strong>2,500원</strong>입니다.<br>
			            h72의 <strong>기본 배송일은 1-5일</strong> 까지 입니다.<br>
			            공장의 생산지연, 거래처의 입고지연 등 물량확보 및 리오더기간으로 인해 상품의 배송이 지연되는 경우 공지 또는 개별연락 드립니다.<br><br><br><h4>A/S관련 및 품질보증기준</h4>
			            상품의 불량, 또는 원단불량, 치수의 부정확 부당표시 및 소재부적합으로 인한 세탁사고로 인한 부분은 <strong>검수 → 수리 → 교환 → 반품</strong>의 순서로 처리해 드리며,<br>
			            고객님의 변심에 의한 교환 및 반품은 제품 구입 후 <strong>7일이내</strong>로서 제품에 손상이 없는 경우 처리해 드립니다.<br>
			            # h72 <strong>Customer Service 1688-8441</strong><br>
			            품질보증기준에 관하여, 전자상거래 등에서의 소비자 보호에 관한 법률로 규정되어 있는 소비자 청약철회 기능범위에 해당하는 경우<br>
			            교환/반품처리 해드리고 있습니다.<br>
			            교환 및 반품기준은 구입가격 기준을 원칙으로 하며, 좀 더 자세한 내용은 고객센터의 배송/반품/교환/게시판의 공지사항 안내를 참고해 주세요.<br><br><br><h4>TIP</h4>
			            이상 h72의 운영방침입니다.<br>
			            추가 문의사항 및 불편사항이 있으신 경우 고객센터 또는 게시판을 통해 문의해 주시길 부탁드리며,<br>
			            언제나 고객님의 입장에서 생각하고 행동할 수 있도록 노력하는 h72가 되도록 하겠습니다. 즐거운 쇼핑되세요!<br>
			</div>
	    </div>
	</div>


	<!-- 상품사용후기 -->
       		<c:if test="${reviewListCount ne 0}">
       			<c:set var="reviewList" value="${reviewList }" scope="request" />
       		</c:if>
       		<c:if test="${reviewListCount eq 0}">
       			<c:set var="reviewList" value="" scope="request" />
       		</c:if>
      			<c:set var=" " value="${itemDetailId }" scope="request" />
			<c:import url="review.jsp" />
	<!-- //상품사용후기 -->
	

	</div>



	<!-- crema.me / 팝업을 띄우는 코드 / 스크립트를 수정할 경우 연락주세요 (support@crema.me) -->
	<div class="crema-popup crema-applied"></div>

	<!-- crema.me / PC 리뷰 초기화 / 스크립트를 수정할 경우 연락주세요 (support@crema.me) -->
	<script>(function(i,s,o,g,r,a,m){if(s.getElementById(g)){return};a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.id=g;a.async=1;a.src=r;m.parentNode.insertBefore(a,m)})(window,document,'script','crema-jssdk','//widgets.cre.ma/reviews/init.js?domain=10world.co.kr');</script>
	
	<!-- Withpang Tracker v3.0 [공용] start -->
	<script src="http://cdn.megadata.co.kr/js/enliple_min2.js"></script>
	<script type="text/javascript">
	<!--
		var rf = new EN();
		rf.setData("sc", encodeURIComponent(""));
		rf.sendRf();
	//-->
	</script>
	<!-- Withpang Tracker v3.0 [공용] end -->


	    </div>
	</div>  
    
	<div style="clear:both;"></div>    
	
	<div id="confirmLayer" style="display: none">

	<title>H72</title>
	<meta name="path_role" content="ETC">
	<meta name="description" content="재난  용품 판매.">
	
		<div class="xans-element- xans-product xans-product-basketadd ">
			<h1>장바구니 담기</h1>
			<div class="content">
		        <p>장바구니에 상품이 정상적으로 담겼습니다.</p>
		    </div>
			<div class="btnArea center">
		        <a href="/h72/order/shopping_cart" style="padding:7px 22px 7px 22px; background:#000; border:1px solid #000; color:#fff; font-size:11px; text-decoration:none; ">장바구니보기</a>
		        <a href="#none" onclick="$('#confirmLayer').hide();" style="padding:7px 22px 7px 22px; background:#f7f7f7; border:1px solid #e7e7e7; color:#000; font-size:11px; text-decoration:none; ">쇼핑계속하기</a>
		    </div>
			<div class="close">
				<a onclick="$('#confirmLayer').hide();">
					<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/common/btn_close.png" alt="닫기">
				</a>
			</div>
		</div>

	</div>
	
	
<jsp:include page='../main_footer.jsp' flush="false" />
<!-- END --> 
    


	<div id="mask">
			<div id="maskInner">
			</div>
	</div>
	
	



<!-- detail 상품 수정 : admin -->

<form action="" method="POST" id="product_updateForm">
   <div id="product_UpdateWrap">
      <div id="product_Update">수정하기</div>
   </div>
   <c:forEach items="${itemDetailList }" varStatus="i">
      <input type="hidden" name="itemId${i.count}" value="${itemDetailList[i.index].ITEM_ID }">
   </c:forEach>
</form>
   
   <script>
      $(document).ready(function(){
         $("#product_UpdateWrap").click(function(){
            $('#product_updateForm').submit();
         });
      });
   </script>
	
	
	
	
	
	
	
	


</body>
</html>
