<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	$('#select_button1').click(function(){
			var params = $("#kitDiyForm").serialize();
			 $.ajax({
	   		url : 'kitDiyCart' ,
	   		type : 'post' , 
	   		data : params,
	   		// 리턴 받는 dataType이 json이면 dataType을 json으로 변경
	   		dataType : 'json' ,
	   		  success: function(data) {
	   			  $('#kitDiyForm').attr('action', 'kitDiyOrder');
	   			  $('#kitDiyForm').submit(); 
	   		  },
	   		  error: function(data) {
	   		        alert("실패");
	   		  }
	   	});
		
		   $('#kitDiyForm').attr('action', 'page1');
		});

		/*장바구니*/
		$('#select_button2').click(function(){
		
		/* 	$('#kitDiyForm').attr('action','kitDiyCart'); */
			var params = $("#kitDiyForm").serialize();
			 $.ajax({
	    		url : 'kitDiyCart' ,
	    		type : 'post' , 
	    		data : params,
	    		// 리턴 받는 dataType이 json이면 dataType을 json으로 변경
	    		dataType : 'json' ,
	    		  success: function(data) {
						 $("#confirmLayer").css("display","block"); 
	    		  },
	    		  error: function(data) {
	    		        alert("실패");
	    		  }
	    	});
			 
			
			/* $('#kitDiyForm').submit(); */
		});
	
});
</script>
</head>
<body id="main" class="kitDiy_wrap">
	<div id="kitDiy_top">
		<jsp:include page="/WEB-INF/views/main_header.jsp" flush="false" />
	</div>
	<!-- START -->
	<div id="kitDiy_wrap" >
		<div class="titleArea">
		    <h2>KIT DIY</h2> 
		</div>
		<form id="kitDiyForm" method="post">
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
						<input type="hidden" name="userId" value="${loginUser.userid }"/>
						<% for(int menuNum=1;  menuNum<6; menuNum++){%>
							<div id="select_product<%=menuNum %>" class="kitDiy_productList" >
								<ul id="kitDiy_mainList<%=menuNum %>">
									<li><img src="/h72/resources/image/icon<%=menuNum %>.png"/></li>
									<li>-</li>
									<li></li> 
									<li>
										<select name="itemId" class="kitDiy_subSelect">
										</select>
									</li>
									<li><input type="text" value="0" class="select_input"> 개</li>
									<li>-</li>
									<li><span class="checkboxClear">X</span></li>
									<li><span class="subMenu" >∨</span></li>
									<li class="product_code"></li>
									<li class="hiddenName">
										<input type="hidden" class="itemFullName"/>
										<input type="hidden" class="itemDetailId"/>
										<input type="hidden" class="mainImg"/>
										<input type="hidden" class="cost"/>
									</li>
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
		</form>
		<%-- <c:forEach var="item" items="${itemAllView }" varStatus="i">
		
			${item.itemId}
		</c:forEach> --%>
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
				<%-- <c:forEach begin="1" end="5" var="j" step="1"> --%>
				<div style="width: 1270px; padding-top:10px;" class="xans-element- xans-product xans-product-normalpackage tab1">
					<div class="xans-element- xans-product xans-product-listnormal ">
						<ul class="prdList column5">
							<c:forEach var="item" items="${itemDetailView }" varStatus="i">
							<c:set var="tabList" value="tab1_${i.index}"></c:set>
							<c:if test="${item.categoryCode eq 'BAG' }">
							<li id="${item.itemDetailId}" style="margin-bottom: 50px;" class="item xans-record-">
								<div class="box">
									<input type="hidden" name="product_name" value="${item.itemName}">
									<input type="hidden" name="product_price" value="${item.minPrice}">
									<input type="checkbox" name="tab1" id="${tabList}" class="check_box"/><label for="${tabList}"></label>
									<select name="product_option" class="kitDiy_select">
									<c:forEach var="itemAll" items="${itemAllView}" varStatus="k">
									<c:if test="${item.itemDetailId eq itemAll.itemDetailId}">
									  <option value="${itemAll.itemId }">${itemAll.itemOptionName }</option>
									</c:if>
									</c:forEach> 
									</select>
									<a id="kitDiy_imgWrap" href="" onclick="window.open('/h72/detail/selectItem?ItemDetailId=${item.itemDetailId}','new','width=800','top=0');return false">
										<img src="/h72/resources${item.mainImg}"></a>
									<input type="hidden" id="thumbMainImg" value="${item.mainImg}"/>
									<p id="thumbItemName">${fn:substring(item.itemName,0,25)}</p>
									<p id="thumbItemLine"></p>
									<p id="thumbItemMinPrice">
										<span>${item.minPrice}</span>
										${item.minSailPrice}
										
									</p>
									<p class="desc"	style="text-align: left; padding: 0; margin: 0;">
									</p>
									<p style="padding-top: 10px; text-align: left;">
									</p>
							
								</div>
							</li>
							</c:if>
							</c:forEach>
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
						<a href="#none"><img src="/h72/resources/image/btn_page_next.png" alt="다음 페이지"></a>
						</p>
					</div>
				</div>
				
				<div style="width: 1270px; padding-top:10px;" class="xans-element- xans-product xans-product-normalpackage tab2">
					<div class="xans-element- xans-product xans-product-listnormal ">
						<ul class="prdList column5">
							<c:forEach var="item" items="${itemDetailView }" varStatus="i">
						<%-- 	<c:forEach begin="${startLength}" end="${endLength}" var="i" step="1" varStatus="status"> --%>
							<c:set var="tabList" value="tab2_${i.index}"></c:set>
							<c:if test="${item.categoryCode eq 'PROT' }">
							<li id="${item.itemDetailId}" style="margin-bottom: 20px;" class="item xans-record-">
								<div class="box">
									<input type="hidden" name="product_name" value="${item.itemName}">
									<%-- <input type="hidden" name="product_option" value="product_option${i.index }"> --%>
									<input type="hidden" name="product_price" value="${item.minPrice}">
									<input type="checkbox" name="tab2" id="${tabList}" class="check_box"/><label for="${tabList}"></label>
									<select name="product_option" class="kitDiy_select">
									<c:forEach var="itemAll" items="${itemAllView}">
									<c:if test="${item.itemDetailId eq itemAll.itemDetailId}">
									  <option value="${itemAll.itemId }">${itemAll.itemOptionName }</option>
									</c:if>
									</c:forEach> 
									</select>
									<a id="kitDiy_imgWrap" href="" onclick="window.open('/h72/detail/selectItem?ItemDetailId=${item.itemDetailId}','new','width=800','top=0');return false">
										<img src="/h72/resources${item.mainImg}">
									</a>
									<input type="hidden" id="thumbMainImg" value="${item.mainImg}"/>
									<p id="thumbItemName">${fn:substring(item.itemName,0,25)}</p>
									<p id="thumbItemLine"></p>
									<p id="thumbItemMinPrice">
										<span>${item.minPrice}</span>
										${item.minSailPrice}
										
									</p>
									<p class="desc"	style="text-align: left; padding: 0; margin: 0;">
									</p>
									<p style="padding-top: 10px; text-align: left;">
									</p>
							
								</div>
							</li>
							</c:if>
							</c:forEach>
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
						<a href="#none"><img src="/h72/resources/image/btn_page_next.png" alt="다음 페이지"></a>
						</p>
					</div>
				</div>
				<div style="width: 1270px; padding-top:10px;" class="xans-element- xans-product xans-product-normalpackage tab3">
					<div class="xans-element- xans-product xans-product-listnormal ">
						<ul class="prdList column5">
							<c:forEach var="item" items="${itemDetailView }" varStatus="i">
						<%-- 	<c:forEach begin="${startLength}" end="${endLength}" var="i" step="1" varStatus="status"> --%>
							<c:set var="tabList" value="tab3_${i.index}"></c:set>
							<c:if test="${item.categoryCode eq 'FOOD' }">
							<li id="${item.itemDetailId}" style="margin-bottom: 20px;" class="item xans-record-">
								<div class="box">
									<input type="hidden" name="product_name" value="${item.itemName}">
									<%-- <input type="hidden" name="product_option" value="product_option${i.index }"> --%>
									<input type="hidden" name="product_price" value="${item.minPrice}">
									<input type="checkbox" name="tab3" id="${tabList}" class="check_box"/><label for="${tabList}"></label>
									<select name="product_option" class="kitDiy_select">
									<c:forEach var="itemAll" items="${itemAllView}">
									<c:if test="${item.itemDetailId eq itemAll.itemDetailId}">
									  <option value="${itemAll.itemId }">${itemAll.itemOptionName }</option>
									</c:if>
									</c:forEach> 
									</select>
									<a id="kitDiy_imgWrap" href="" onclick="window.open('/h72/detail/selectItem?ItemDetailId=${item.itemDetailId}','new','width=800','top=0');return false">
										<img src="/h72/resources${item.mainImg}"></a>
									<input type="hidden" id="thumbMainImg" value="${item.mainImg}"/>
									<p id="thumbItemName">${fn:substring(item.itemName,0,25)}</p>
									<p id="thumbItemLine"></p>
									<p id="thumbItemMinPrice">
										<span>${item.minPrice}</span>
										${item.minSailPrice}
										
									</p>
									<p class="desc"	style="text-align: left; padding: 0; margin: 0;">
									</p>
									<p style="padding-top: 10px; text-align: left;">
									</p>
							
								</div>
							</li>
							</c:if>
							</c:forEach>
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
						<a href="#none"><img src="/h72/resources/image/btn_page_next.png" alt="다음 페이지"></a>
						</p>
					</div>
				</div>
				<div style="width: 1270px; padding-top:10px;" class="xans-element- xans-product xans-product-normalpackage tab4">
					<div class="xans-element- xans-product xans-product-listnormal ">
						<ul class="prdList column5">
							<c:forEach var="item" items="${itemDetailView }" varStatus="i">
						<%-- 	<c:forEach begin="${startLength}" end="${endLength}" var="i" step="1" varStatus="status"> --%>
							<c:set var="tabList" value="tab4_${i.index}"></c:set>
							<c:if test="${item.categoryCode eq 'TOOL' }">
							<li id="${item.itemDetailId}" style="margin-bottom: 20px;" class="item xans-record-">
								<div class="box">
									<input type="hidden" name="product_name" value="${item.itemName}">
									<%-- <input type="hidden" name="product_option" value="product_option${i.index }"> --%>
									<input type="hidden" name="product_price" value="${item.minPrice}">
									<input type="checkbox" name="tab4" id="${tabList}" class="check_box"/><label for="${tabList}"></label>
									<select name="product_option" class="kitDiy_select">
									<c:forEach var="itemAll" items="${itemAllView}">
									<c:if test="${item.itemDetailId eq itemAll.itemDetailId}">
									  <option value="${itemAll.itemId }">${itemAll.itemOptionName }</option>
									</c:if>
									</c:forEach> 
									</select>
									<a id="kitDiy_imgWrap" href="" onclick="window.open('/h72/detail/selectItem?ItemDetailId=${item.itemDetailId}','new','width=800','top=0');return false">
										<img src="/h72/resources${item.mainImg}"></a>
									<input type="hidden" id="thumbMainImg" value="${item.mainImg}"/>
									<p id="thumbItemName">${fn:substring(item.itemName,0,25)}</p>
									<p id="thumbItemLine"></p>
									<p id="thumbItemMinPrice">
										<span>${item.minPrice}</span>
										${item.minSailPrice}
										
									</p>
									<p class="desc"	style="text-align: left; padding: 0; margin: 0;">
									</p>
									<p style="padding-top: 10px; text-align: left;">
									</p>
							
								</div>
							</li>
							</c:if>
							</c:forEach>
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
						<a href="#none"><img src="/h72/resources/image/btn_page_next.png" alt="다음 페이지"></a>
						</p>
					</div>
				</div>
				<div style="width: 1270px; padding-top:10px;" class="xans-element- xans-product xans-product-normalpackage tab5">
					<div class="xans-element- xans-product xans-product-listnormal ">
						<ul class="prdList column5">
							<c:forEach var="item" items="${itemDetailView }" varStatus="i">
						<%-- 	<c:forEach begin="${startLength}" end="${endLength}" var="i" step="1" varStatus="status"> --%>
							<c:set var="tabList" value="tab5_${i.index}"></c:set>
							<c:if test="${item.categoryCode eq 'ETC' }">
							<li id="${item.itemDetailId}" style="margin-bottom: 20px;" class="item xans-record-">
								<div class="box">
									<input type="hidden" name="product_name" value="${item.itemName}">
									<%-- <input type="hidden" name="product_option" value="product_option${i.index }"> --%>
									<input type="hidden" name="product_price" value="${item.minPrice}">
									<input type="checkbox" name="tab5" id="${tabList}" class="check_box"/><label for="${tabList}"></label>
									<select name="product_option" class="kitDiy_select">
									<c:forEach var="itemAll" items="${itemAllView}">
									<c:if test="${item.itemDetailId eq itemAll.itemDetailId}">
									  <option value="${itemAll.itemId }">${itemAll.itemOptionName }</option>
									</c:if>
									</c:forEach> 
									</select>
									<a id="kitDiy_imgWrap" href="" onclick="window.open('/h72/detail/selectItem?ItemDetailId=${item.itemDetailId}','new','width=800','top=0');return false">
										<img src="/h72/resources${item.mainImg}"></a>
									<input type="hidden" id="thumbMainImg" value="${item.mainImg}"/>	
									<p id="thumbItemName">${fn:substring(item.itemName,0,25)}</p>
									<p id="thumbItemLine"></p>
									<p id="thumbItemMinPrice">
										<span>${item.minPrice}</span>
										${item.minSailPrice}
										
									</p>
									<p class="desc"	style="text-align: left; padding: 0; margin: 0;">
									</p>
									<p style="padding-top: 10px; text-align: left;">
									</p>
							
								</div>
							</li>
							</c:if>
							</c:forEach>
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
						<a href="#none"><img src="/h72/resources/image/btn_page_next.png" alt="다음 페이지"></a>
						</p>
					</div>
				</div>
				
			<!-- 리스트 부분 끝 -->
			</div>
		</div>
		</div>
		<div id="confirmLayer" style="display: none">
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
	
	      <div id="tgg_common_bottom_script" style="display:none;">
	      <div id="wp_tg_cts" style="display:none;"></div>
      </div>
		
		<div id="kitDiy_footer">
		<jsp:include page="../main_footer.jsp" flush="false" />
		</div>
	</div>	
	<!-- END -->
	<!-- External Script End -->
	
  


</body>

</html>