<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--PG크로스브라우징필수내용 시작-->
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Pragma" content="no-cache">
<!--PG크로스브라우징필수내용 끝-->
<link rel="stylesheet" href="../css/productEnroll.css">
<script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="../js/thumnail.js"></script>
<script type="text/javascript" src="../js/formCheck.js"></script>

<title>productEnroll</title>
<meta name="path_role" content="PRODUCT_LIST">
<meta name="description" content="10대, 20대 여성의류 쇼핑몰, 데일리 케쥬얼룩, 티셔츠, 니트, 원피스 등 판매. 코디 제공.">
</head>
<body id="main">
	<div id="sunny_top">
		<li><a href="#" id="scrollup" style="display: none;">TOP</a></li>
	</div>
	<!-- START -->
	<div id="sunny_wrap" >
		<div id="sunny_header" class="">
			<div class="line1">
			</div>
			<div class="line2">
			</div>
		</div>
		
		<div id="sunny_contents">
			<div id="sunny_in">
				<div class="titleArea">
				    <h2>PRODUCT  ENROLL</h2> 
				</div>
				<div id="productEnroll">
					<form action="" method="post" enctype="multipart/form-data">
						<table id="productEnroll_table">
							<tr>
								<td><p>상 품 명</p></td>
								<td>
									<div class="inputBox3Wrap" id="">
										<input type="text" placeholder="" id="" name="productName" class="inputBox3">
									</div>
								</td>
							</tr>

							<tr>
								<td><p>거래 업체</p></td>
								<td>
									<div class="inputBox3Wrap" id="productEnroll_cate">
										<input type="text" placeholder="" id="" name="productCompany" class="inputBox3">
									</div>
								</td>
							</tr>
							<tr>
								<td><p>옵 션</p></td>
								<td>
								<div class="inputBox3Wrap" id="">
									<input type="text" name="address" class="postcodify_postcode5 inputBox3" value="" />
								</div>
								</td>
							</tr>
							<tr>
								<td><p>매 입 가</p></td>
								<td>
									<div class="productEnroll_price" id="">
										<ul>
											<li>
												<input type="text" id="" name="" 
												min="0" max="1000000000" step="1000" value="1,000" 
												class="inputBox3" onchange="getNumber(this);" onkeyup="getNumber(this);"/>
											</li>
											<li>원</li>	
										</ul>
									</div>
									
								</td>
							</tr>
							<tr>
								<td><p>판 매 가</p></td>
								<td>
									<div class="productEnroll_price" >
										<ul>
											<li>
												<input type="text" id="" name="" 
												min="0" max="1000000000" step="1000" value="1,000" 
												class="inputBox3" onchange="getNumber(this);" onkeyup="getNumber(this);"/>
											</li>
											<li>원</li>	
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<td><p>할 인 가</p></td>
								<td>
									<div class="productEnroll_price" >
										<ul>
											<li>
												<input type="text" id="" name="" 
												min="0" max="1000000000" step="1000" value="1,000" 
												class="inputBox3" onchange="getNumber(this);" onkeyup="getNumber(this);"/>
											</li>
											<li>원</li>	
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<td><p>재고 수량</p></td>
								<td>
									<div class="productEnroll_stock" id="">
										<ul>
											<li>
												<input type="number" placeholder="" id="" name="" class=""
												  min="0" max="500" step="1" value="1">
										  	</li>
											<li>개</li>	
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<td><p>분 류</p></td>
								<td>
									<script>
										$(document).ready(function() {
											$("input[name=productEnroll_category]").change(function() {
												$("input[name=productEnroll_category]").each(function(i) {
												   if (this.checked) {
													   $("input[name=productEnroll_categoryValue]").eq(i).val("Y");
												   }else{
													   $("input[name=productEnroll_categoryValue]").eq(i).val("N");
												   }
												});
											});
										});
									</script>
									<div class="" id="productEnroll_servie">
									<ul>
										<li><input type="radio" name="productEnroll_category" id="productEnroll_cate1"><label for="productEnroll_cate1">배낭</label></li>
										<li><input type="radio" name="productEnroll_category" id="productEnroll_cate2"><label for="productEnroll_cate2">방한</label></li>   
										<li><input type="radio" name="productEnroll_category" id="productEnroll_cate3"><label for="productEnroll_cate3">식료</label></li>  
										<li><input type="radio" name="productEnroll_category" id="productEnroll_cate4"><label for="productEnroll_cate4">도구</label></li>  
										<li><input type="radio" name="productEnroll_category" id="productEnroll_cate5"><label for="productEnroll_cate5">기타</label></li>  
									</ul>
									
									<input type="hidden" name="productEnroll_categoryValue" >
									<input type="hidden" name="productEnroll_categoryValue" >
									<input type="hidden" name="productEnroll_categoryValue" >
									<input type="hidden" name="productEnroll_categoryValue" >
									<input type="hidden" name="productEnroll_categoryValue" >
									
									</div>
								</td>
							</tr>
							
							<tr>
								<td><p class="textarea_text">비 고</p></td>
								<td>
									<div class="textareaBoxWrap" id="">
										<textarea placeholder="" id="" name="etc" class="textareaBox" style="background:aliceblue;"></textarea>
										<div id="review_text_state" class="border_radius soft">
													특이 사항이 있으면 적어주세요!
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>첨부파일</td>
								<td id="farea">
									<div id="itemPhoto" class="item photo">
										<div class="">
											<button type="button" id="productEnroll_photo" class="" tabindex="-1">
												+
											</button>
											<input type="file" multiple name="reviewPhoto1" id="upBtn1" class="file_input_hidden" /> 
											<input type="file" multiple name="reviewPhoto2" id="upBtn2" class="file_input_hidden" style="display:none" /> 
										    <div id="thumnailArea">
										       <img id="thumnail1" name="thumanail" />
										       <img id="thumnail2" name="thumanail" />
										    </div>
										</div>
									</div>
								</td>
							</tr>
						</table>
						<div id="productEnroll_enrollBtnWrap">
							<input type="submit" value="등록하기" id="productEnroll_enrollBtn">
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
		<div id="sunny_footer">
			<div id="sunny_in">
			</div>
		</div>

		<div style="clear: both;"></div>
		<div id="sunny_copy">
		</div>
	</div>
	<!-- END -->

	<!-- BS CTS TRACKING SCRIPT V.20 / 13829 : CTS / DO NOT ALTER THIS SCRIPT. -->
	<!-- COPYRIGHT (C) 2002-2016 BIZSPRING INC. L4AD ALL RIGHTS RESERVED. -->
	<script type="text/javascript">
		(function(b, s, t, c, k) {
			b[k] = s;
			b[s] = b[s] || function() {
				(b[s].q = b[s].q || []).push(arguments)
			};
			var f = t.getElementsByTagName(c)[0], j = t.createElement(c);
			j.async = true;
			j.src = '//fs.bizspring.net/fs4/l4cts.v4.2.js';
			f.parentNode.insertBefore(j, f);
		})(window, '_tcts_m', document, 'script', 'BSAnalyticsObj');
		_tcts_m('13829', 'BIZMP');
	</script>
	<!-- END OF BS CTS TRACKING SCRIPT -->



	<script>
		// Account ID 적용
		if (!wcs_add)
			var wcs_add = {};
		wcs_add["wa"] = "s_67d37f8bfd2";

		/* // 마일리지 White list가 있을 경우
		wcs.mileageWhitelist = [ "jjukbbang1.cafe24.com",
				"www.jjukbbang1.cafe24.com", "m.jjukbbang1.cafe24.com",
				"10world.net", "www.10world.net", "m.10world.net",
				"10world.co.kr", "www.10world.co.kr", "m.10world.co.kr" ];

		// 네이버 페이 White list가 있을 경우
		wcs.checkoutWhitelist = [ "jjukbbang1.cafe24.com",
				"www.jjukbbang1.cafe24.com", "m.jjukbbang1.cafe24.com",
				"10world.net", "www.10world.net", "m.10world.net",
				"10world.co.kr", "www.10world.co.kr", "m.10world.co.kr" ];

		// 레퍼러 (스크립트 인젠션 공격 대응 strip_tags) ECQAINT-15101
		wcs.setReferer("http://www.10world.co.kr/");

		// 유입 추적 함수 호출
		wcs.inflow("10world.co.kr"); */

		// 로그수집
		wcs_do();
	</script>

	<script type="text/javascript">
		var order_no = '';
		var order_amount = '';
	</script>
	<!--광고성과 측정 스크립트 미설정-->

	<!-- External Script Start -->

	<!-- tgg -->
	<!-- CMC script -->
	<div id="tgg_common_bottom_script" style="">
		<!-- WIDERPLANET HOME SCRIPT START 2016.8.24 -->
		<div id="wp_tg_cts" style="display: none;">
			<iframe width="1px" height="1px"
				src="http://astg.widerplanet.com/delivery/wpc.php?ti=27554&amp;v=1&amp;device=web&amp;ver=2_0_mall&amp;ty=Home&amp;charset=UTF-8&amp;tc=1475596208494&amp;ref=http%3A%2F%2Fwww.10world.co.kr%2Findex.html%3Fn_media%3D27758%26n_query%3D10%25EB%258C%2580%25EC%2587%25BC%25ED%2595%2591%25EB%25AA%25B0%26n_rank%3D8%26n_ad_group%3Dgrp-m001-01-000001683297135%26n_ad%3Dnad-a001-01-000000002693241%26n_keyword_id%3Dnkw-m001-01-000000196249914%26n_keyword%3D10%25EB%258C%2580%25EC%2587%25BC%25ED%2595%2591%25EB%25AA%25B0%26NaPm%3Dct%253Ditvnvjq8%257Cci%253D0wzP002yNZbllpDXNeV8%257Ctr%253Dsa%257Chk%253D383d4d14a2219adc0ed8d7274cff06fe87eb9465&amp;loc=http%3A%2F%2Fwww.10world.co.kr%2Fproduct%2Flist_new.html%3Fcate_no%3D169"
				title="tgtracking" style="display: none;"></iframe>
		</div>
		<script type="text/javascript">
			var wp_conf = 'ti=27554&v=1&device=web';
		</script>
		<script type="text/javascript" defer=""
			src="//cdn-aitg.widerplanet.com/js/wp_astg_2.0_mall.js"></script>
		<!-- // WIDERPLANET HOME SCRIPT END 2016.8.24 -->
	</div>
	<!-- CMC script -->

	<!-- External Script End -->


	<script type="text/javascript"
		src="/ind-script/optimizer.php?filename=33ae27e7c271f94e0c9d9b76295e508b31f605eb_1474999854&amp;type=js&amp;"></script>
	<script type="text/javascript">
		var mobileWeb = false;
		var bUseElestic = false;
		var sSearchBannerUseFlag = 'F';
		var SHOP_CURRENCY_INFO = {
			"1" : {
				"aShopCurrencyInfo" : {
					"currency_code" : "KRW",
					"currency_no" : "410",
					"currency_symbol" : "\uffe6",
					"currency_name" : "South Korean won",
					"currency_desc" : "\uffe6 \uc6d0 (\ud55c\uad6d)",
					"decimal_place" : 0,
					"round_method_type" : "F"
				},
				"aShopSubCurrencyInfo" : null,
				"aBaseCurrencyInfo" : {
					"currency_code" : "KRW",
					"currency_no" : "410",
					"currency_symbol" : "\uffe6",
					"currency_name" : "South Korean won",
					"currency_desc" : "\uffe6 \uc6d0 (\ud55c\uad6d)",
					"decimal_place" : 0,
					"round_method_type" : "F"
				},
				"fExchangeRate" : 1,
				"fExchangeSubRate" : null,
				"aFrontCurrencyFormat" : {
					"head" : "",
					"tail" : "\uc6d0"
				},
				"aFrontSubCurrencyFormat" : {
					"head" : "",
					"tail" : ""
				}
			}
		};
		EC_SHOP_FRONT_NEW_OPTION_COMMON.initObject();
		EC_SHOP_FRONT_NEW_OPTION_BIND.initChooseBox();
		EC_SHOP_FRONT_NEW_OPTION_DATA.initData();
		var basket_result = '/product/add_basket.html';
		var basket_option = '/product/basket_option.html';
		var aLogData = {
			"log_server1" : "eclog2-066.cafe24.com",
			"log_server2" : "eclog2-066.cafe24.com",
			"mid" : "jjukbbang1",
			"log_app" : "Eclog"
		};
		var aReviewtt = {
			"env_type" : false,
			"cuk45" : "cuk45_jjukbbang1_e4dabb59513f638f1b2d971c56a7e3f5"
		};
	</script>
	<iframe
		src="/exec/front/Eclog/main/?cate_no=169&amp;rloc=http%3A//www.10world.co.kr/product/list_new.html%3Fcate_no%3D169&amp;rref=http%3A//www.10world.co.kr/index.html%3Fn_media%3D27758%26n_query%3D10%25EB%258C%2580%25EC%2587%25BC%25ED%2595%2591%25EB%25AA%25B0%26n_rank%3D8%26n_ad_group%3Dgrp-m001-01-000001683297135%26n_ad%3Dnad-a001-01-000000002693241%26n_keyword_id%3Dnkw-m001-01-000000196249914%26n_keyword%3D10%25EB%258C%2580%25EC%2587%25BC%25ED%2595%2591%25EB%25AA%25B0%26NaPm%3Dct%253Ditvnvjq8%257Cci%253D0wzP002yNZbllpDXNeV8%257Ctr%253Dsa%257Chk%253D383d4d14a2219adc0ed8d7274cff06fe87eb9465&amp;udim=1920*1080&amp;rserv=eclog2-066.cafe24.com&amp;cid=CID7467e2fed33529551e24d2f3c84e659d"
		id="log_realtime" style="display: none;"></iframe>
	<script
		src="http://eclog2-066.cafe24.com/weblog_ubp.html?uid=jjukbbang1&amp;udim=1920*1080&amp;uref=http://www.10world.co.kr/index.html?n_media=27758&amp;n_query=10%EB%8C%80%EC%87%BC%ED%95%91%EB%AA%B0&amp;n_rank=8&amp;n_ad_group=grp-m001-01-000001683297135&amp;n_ad=nad-a001-01-000000002693241&amp;n_keyword_id=nkw-m001-01-000000196249914&amp;n_keyword=10%EB%8C%80%EC%87%BC%ED%95%91%EB%AA%B0&amp;NaPm=ct%3Ditvnvjq8%7Cci%3D0wzP002yNZbllpDXNeV8%7Ctr%3Dsa%7Chk%3D383d4d14a2219adc0ed8d7274cff06fe87eb9465&amp;uname=jjukbbang1&amp;url=http://www.10world.co.kr/product/list_new.html?cate_no=169&amp;r_ref=http://www.10world.co.kr/index.html?n_media=27758&amp;n_query=10%EB%8C%80%EC%87%BC%ED%95%91%EB%AA%B0&amp;n_rank=8&amp;n_ad_group=grp-m001-01-000001683297135&amp;n_ad=nad-a001-01-000000002693241&amp;n_keyword_id=nkw-m001-01-000000196249914&amp;n_keyword=10%EB%8C%80%EC%87%BC%ED%95%91%EB%AA%B0&amp;NaPm=ct%3Ditvnvjq8%7Cci%3D0wzP002yNZbllpDXNeV8%7Ctr%3Dsa%7Chk%3D383d4d14a2219adc0ed8d7274cff06fe87eb9465&amp;t=1475596208503"></script>
	<script type="text/javascript"
		src="http://eclog2-066.cafe24.com/weblog.js?uid=jjukbbang1&amp;uname=jjukbbang1&amp;r_ref=http://www.10world.co.kr/index.html?n_media=27758&amp;n_query=10%EB%8C%80%EC%87%BC%ED%95%91%EB%AA%B0&amp;n_rank=8&amp;n_ad_group=grp-m001-01-000001683297135&amp;n_ad=nad-a001-01-000000002693241&amp;n_keyword_id=nkw-m001-01-000000196249914&amp;n_keyword=10%EB%8C%80%EC%87%BC%ED%95%91%EB%AA%B0&amp;NaPm=ct%3Ditvnvjq8%7Cci%3D0wzP002yNZbllpDXNeV8%7Ctr%3Dsa%7Chk%3D383d4d14a2219adc0ed8d7274cff06fe87eb9465&amp;t=1475596208503"
		id="log_script"></script>
	<div id="modalBackpanel"></div>
	<div id="modalContainer">
		<iframe id="modalContent" scroll="0" scrolling="no" frameborder="0"></iframe>
	</div>
</body>

</html>