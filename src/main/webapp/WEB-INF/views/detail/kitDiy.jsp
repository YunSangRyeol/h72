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
<link rel="stylesheet" href="../css/kitdiy.css">
<script type="text/javascript" src="../js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="../js/tabs.js"></script>
<script type="text/javascript" src="../js/kitDiy.Checkbox.js"></script>
<script type="text/javascript" src="../js/kitDiy.menu.js"></script>
<title>kitDiy</title>
<meta name="path_role" content="PRODUCT_LIST">
<meta name="description" content="10대, 20대 여성의류 쇼핑몰, 데일리 케쥬얼룩, 티셔츠, 니트, 원피스 등 판매. 코디 제공.">
<script type="text/javascript">
$(document).ready(function(){
	$(window).scroll(function(){
		if($(document).scrollTop()>=70){
			$("#sunny_header").addClass("fixed");
		}else if($(document).scrollTop()<70){
			$("#sunny_header").removeClass("fixed");
	 	}
		
	});
});
</script>
</head>
<body id="main">
	<div id="sunny_top">
		<li><a href="#" id="scrollup" style="display: none;">TOP</a></li>
	</div>
	<!-- START -->
	<div id="sunny_wrap" >
		<div class="titleArea">
		    <h2>KIT DIY</h2> 
		</div>
		<div id="sunny_header" class="">
			<div class="line1">
			</div>
			<div class="line2">
			</div>
			<!-- 메뉴바 시작 -->
			<div id="kitDiy_nav" >
				<div id="kitDiy_selectWrap">
					<div id="kitDiy_Title">
					</div>
					<div id="kitDiy_product" >
					<% for(int menuNum=1;  menuNum<6; menuNum++){%>
						<div id="select_product<%=menuNum %>" class="kitDiy_productList" >
							<ul id="kitDiy_mainList<%=menuNum %>">
								<li><img src="../image/icon<%=menuNum %>.png"/></li>
								<li>-</li>
								<li></li> 
								<li>-</li>
								<li><input type="text" name="product_stock" value="-" class="select_input"> 개</li>
								<li>-</li>
								<li class="checkboxClear">X</li>
								<li><span class="subMenu" >∨</span></li>
								<li class="product_code"></li>
							</ul>
						</div>
					<%} %>
					</div>
					<div id="kitDiy_imageNbutton">
						<div id="kitDiy_image">
							<div id="select_tab1Image" style=""><img src="../image/backpack.png"/></div>
							<div id="select_tab2Image" style=""><img src="../image/blanket.png" /></div>
							<div id="select_tab3Image" style=""><img src="../image/food.png" /></div>
							<div id="select_tab4Image" style=""><img src="../image/electronic.png" /></div>
							<div id="select_tab5Image" style=""><img src="../image/etc.png" /></div>
						</div>
						<div id="kitDiy_button">
							<div id="select_button1"><img src="" /></div>
							<div id="select_button2"><img src="" /></div>
						</div>
					</div>	
					<div id="kitDiy_level">
						<div id="select_tab1"></div>
						<div id="select_tab2"></div>
						<div id="select_tab3"></div>
						<div id="select_tab4"></div>
						<div id="select_tab5"></div>
					</div>		
							
				</div>
			</div>
		</div>

		<div id="sunny_contents">
		<!-- 리스트 부분 시작 -->
			<div id="sunny_in">
				<div class="xans-element- xans-product xans-product-menupackage ">
					<div class="xans-element- xans-product xans-product-headcategory title ">
						<ul id="kitdiy_tabs" class="tabs">
							<li>배낭</li>
							<li>방한</li>
							<li>식료</li>
							<li>도구</li>
							<li>기타</li>
						</ul>
					</div>
				</div>

				<!-- 일반상품 -->
				<%  for(int j=1; j< 6; j++){  %>
				<div style="width: 1270px; padding-top:10px;"
					class="xans-element- xans-product xans-product-normalpackage tab<%=j%>">
					<div class="xans-element- xans-product xans-product-listnormal ">
						<ul class="prdList column5">
						
							<% for(int i=0; i< 30; i++){ 
								String tabList = "tab"+j+"_"+i;
							%>
								<li id="product_<%=j%>_<%=i%>" style="margin-bottom: 20px;" class="item xans-record-">
									<div class="box">
										<input type="hidden" name="product_name" value="product_name<%=i %>">
										<%-- <input type="hidden" name="product_option" value="product_option<%=i %>"> --%>
										<input type="hidden" name="product_price" value="product_price<%=i %>">
										<input type="checkbox" name="tab<%=j %>" id="<%=tabList %>" class="check_box"/><label for="<%=tabList %>"></label>
										<select name="product_option" id="kitDiy_select">
										  <option selected>옵션 선택</option>
										  <option value="product_option1">product_option1</option>
										  <option value="product_option2">product_option2</option>
										  <option value="product_option3">product_option3</option>
										</select>
										<a href="" name="anchorBoxName_8879" onclick="window.open('test.htm','new','resizable=no channelmode');return false">
											<img src="../image/content_0<%=j %>.jpg" class="thumb" style="width: 238px;"></a>
										<p class="name"></p>
										<p style="letter-spacing: -1px; text-align: left; border-bottom: 1px solid #e7e7e7; padding-bottom: 5px; margin: 20px 0px;">
											<a href="#">x
											<span style="font-size: 11px; color: #000000;" >버튼 라운드 가디건</span></a>
										</p>
										<p class="price" style="font-family: 'Lato', sans-serif; font-weight: 400; color: #333; font-size: 14px; padding: 0; text-align: left; line-height: 20px;">
											<span style="text-decoration: line-through; color: #a2a2a2; font-family: 'Lato', sans-serif; font-weight: 300;"></span>
											19500
										</p>
										<p class="desc"	style="text-align: left; padding: 0; margin: 0;">
											아방한 핏이 매력적인 가디건<br> 도톰한 두께감과 유니크한 컬러감
										</p>
										<p style="padding-top: 10px; text-align: left;">
										</p>
								
									</div>
								</li>
								<%} %>
						</ul>
					</div>
					<div class="xans-element- xans-product xans-product-normalpaging">
						<p>
							<a href="#none"><img src="../image/btn_page_prev.png" alt="이전 페이지"></a>
						</p>
						<ol>
							<li class="xans-record-"><a href="?cate_no=169&amp;page=1"
								class="this">1</a></li>
						</ol>
						<p>
							<a href="#none"><img
								src="../image/btn_page_next.png" alt="다음 페이지"></a>
						</p>
					</div>
				</div>
				<%} %>
			</div>
			<!-- 리스트 부분 끝 -->
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