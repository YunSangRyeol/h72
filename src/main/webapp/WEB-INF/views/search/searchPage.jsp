<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>searchPage</title>
<link href="/h72/resources/css/searchList.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript"
	src="/h72/resources/js/jquery-3.1.0.min.js"></script>

</head>
<body id="searchList">
	<div id="searchList_content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp" flush="false" />

		<div class="searchList_contents" align="center">
			<div class="searchList_titleArea">
				<h2>${listTitle }</h2>
			</div>

			<div class="searchList_productList">
				<ul class="prdList column5">
					<%
						for (int i = 0; i < 3; i++) {
					%>
					<%
						for (int j = 0; j < 4; j++) {
					%>

					<li id="anchorBoxId_8025" style="margin-bottom: 20px;"
						class="item xans-record-">
						<div class="box">
							<a href="#" name="anchorBoxName_8025"><img
								src="http://10world.co.kr/web/product/tiny/201610/8025_shop1_670334.jpg"
								alt="" class="thumb" style="width: 238px;"></a>
							<p class="name"></p>
							<p
								style="letter-spacing: -1px; text-align: left; border-bottom: 1px solid #e7e7e7; padding-bottom: 5px; margin-bottom: 5px;">
								<a href="#"><span style="font-size: 11px; color: #000000;">노멀
										싱글 코트 (누빔)</span></a>
							</p>
							<p class="price"
								style="font-family: 'Lato', sans-serif; font-weight: 400; color: #333; font-size: 14px; padding: 0; text-align: left; line-height: 20px;">
								<span
									style="text-decoration: line-through; color: #a2a2a2; font-family: 'Lato', sans-serif; font-weight: 300;"></span>
								29500
							</p>
							<p class="desc"
								style="text-align: left; padding: 0; margin: 0; color: #666;">
								<font color="dc0014"><b>데일리로 착용하기 좋은 베이직 모직코트!</b></font><br>
								도톰한 누빔안감으로 따뜻하고 포근하게
							</p>


						</div>
					</li>
					<%
						}
					%>
					<br>
					<%
						}
					%>
				</ul>
			</div>
			<div class="searchList_paging">
				<p>
					<a href="#none"><img
						src="/h72/resources/image/btn_page_prev.png" alt="이전 페이지"></a>
				</p>
				<ol>
					<li class="xans-record-"><a href="?cate_no=25&amp;page=1"
						class="this">1</a></li>


				</ol>
				<p>
					<a href="#none"><img
						src="/h72/resources/image/btn_page_next.png" alt="다음 페이지"></a>
				</p>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>