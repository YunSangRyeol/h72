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
<link rel="stylesheet" href="/h72/resources/css/kitdiy.css">
<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="/h72/resources/js/kitDiy.tabs.js"></script>
<script type="text/javascript" src="/h72/resources/js/kitDiy.Checkbox.js"></script>
<script type="text/javascript" src="/h72/resources/js/kitDiy.menu.js"></script>
<script type="text/javascript" src="/h72/resources/js/kitDiy.scroll.js"></script>
<title>72hours::국내 최대 재난대비 용품샵</title>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
</head>
<body id="main" class="kitDiy_wrap">
	<div id="kitDiy_top">
		<jsp:include page="../main_header.jsp" flush="false" />
	</div>
	<!-- START -->
	<div id="kitDiy_wrap" >
		<div class="titleArea">
		    <h2>KIT DIY</h2> 
		</div>
		
		<div id="kitDiy_header" >
			<div class="line1">
			</div>
			<div class="line2">
			</div>
			<!-- 메뉴바 시작 -->
			<div id="kitDiy_nav" >
				<div id="kitDiy_selectWrap">
					<div id="kitDiy_Title">
					</div>
					<div id="kitDiy_menuAndPicture">
						<div id="kitDiy_product" >
						<% for(int menuNum=1;  menuNum<6; menuNum++){%>
							<div id="select_product<%=menuNum %>" class="kitDiy_productList" >
								<ul id="kitDiy_mainList<%=menuNum %>">
									<li><img src="/h72/resources/image/icon<%=menuNum %>.png"/></li>
									<li>-</li>
									<li></li> 
									<li>
										<select name="" class="kitDiy_subSelect">
										</select>
									</li>
									<li><input type="text" name="product_stock" value="-" class="select_input"> 개</li>
									<li>-</li>
									<li><span class="checkboxClear">X</span></li>
									<li><span class="subMenu" >∨</span></li>
									<li class="product_code"></li>
								</ul>
							</div>
						<%} %>
						</div>
						<div id="kitDiy_imageAndbutton">
							<div id="kitDiy_image">
								<div id="select_tab1Image" style=""><img src="/h72/resources/image/backpack.png"/></div>
								<div id="select_tab2Image" style=""><img src="/h72/resources/image/blanket.png" /></div>
								<div id="select_tab3Image" style=""><img src="/h72/resources/image/food.png" /></div>
								<div id="select_tab4Image" style=""><img src="/h72/resources/image/electronic.png" /></div>
								<div id="select_tab5Image" style=""><img src="/h72/resources/image/etc.png" /></div> 
							</div>
							<div id="kitDiy_button">
								<div id="select_button1">BUY IT NOW<br>구매하기</div>
								<div id="select_button2">ADD TO CART<br>장바구니</div>
							</div>
						</div>	
					</div>
					<div id="kitDiy_level">
					<% for(int i=1; i<6; i++){ %>
						<div id="select_tab<%= i%>"></div>
					<% } %>
					</div>
					
					<div id="kitDiy_minuMenu">
						<% for(int i=1; i<6; i++){ %>
						<div id="select_minuMenu<%=i%>"><img src="/h72/resources/image/icon<%=i %>.png"/><span></span><span></span></div>
					<% } %>	
					</div>			
							
				</div>
			</div>
		</div>

		<div id="kitDiy_contents">
		<!-- 리스트 부분 시작 -->
			<div id="kitDiy_in">
				<div class="">
					<ul id="kitdiy_tabs" class="tabs">
						<li>배낭</li>
						<li>방한</li>
						<li>식료</li>
						<li>도구</li>
						<li>기타</li>
					</ul>
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
										<select name="product_option" class="kitDiy_select">
										  <option value="product_option1">option1</option>
										  <option value="product_option2">option2</option>
										  <option value="product_option3">option3</option>
										</select>
										<a href="" name="anchorBoxName_8879" onclick="window.open('test.htm','new','resizable=no channelmode');return false">
											<img src="/h72/resources/image/content_0<%=j %>.jpg" class="thumb" style="width: 238px;"></a>
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
							<a href="#none"><img src="/h72/resources/image/btn_page_prev.png" alt="이전 페이지"></a>
						</p>
						<ol>
							<li class="xans-record-"><a href="?cate_no=169&amp;page=1"
								class="this">1</a></li>
						</ol>
						<p>
							<a href="#none"><img
								src="/h72/resources/image/btn_page_next.png" alt="다음 페이지"></a>
						</p>
					</div>
				</div>
				<%} %>
			</div>
			<!-- 리스트 부분 끝 -->
		</div>
		
		<div id="kitDiy_footer">
			
		<jsp:include page="../main_footer.jsp" flush="false" />
		</div>
	</div>
	<!-- END -->
	<!-- External Script End -->


</body>

</html>