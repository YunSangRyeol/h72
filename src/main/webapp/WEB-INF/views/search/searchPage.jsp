<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
				<c:choose>
					<c:when test="${listTitle == 'BAG'}">
						<h2>${listTitle }</h2>
					</c:when>
					<c:when test="${listTitle == 'PROTECT'}">
						<h2>${listTitle }</h2>
					</c:when>
					<c:when test="${listTitle == 'FOOD'}">
						<h2>${listTitle }</h2>
					</c:when>
					<c:when test="${listTitle == 'TOOL'}">
						<h2>${listTitle }</h2>
					</c:when>
					<c:when test="${listTitle == 'ETC'}">
						<h2>${listTitle }</h2>
					</c:when>
					<c:otherwise>
						<h2>[${listTitle }] 검색결과</h2>

					</c:otherwise>
				</c:choose>


			</div>

			<div class="searchList_productList">
				<ul class="prdList column5">

					<c:choose>
						<c:when test="${listTitle == 'BAG'}">
							<c:set value="${bagList }" var="category" />
						</c:when>
						<c:when test="${listTitle == 'PROTECT'}">
							<c:set value="${protectList }" var="category" />
						</c:when>
						<c:when test="${listTitle == 'FOOD'}">
							<c:set value="${foodList }" var="category" />
						</c:when>
						<c:when test="${listTitle == 'TOOL'}">
							<c:set value="${toolList }" var="category" />
						</c:when>
						<c:when test="${listTitle == 'ETC'}">
							<c:set value="${etcList }" var="category" />
						</c:when>
						<c:otherwise>
							<c:set value="${keywordList }" var="category" />

						</c:otherwise>
					</c:choose>
					<script type="text/javascript">
	$(function() {

		$('#inner_searchBtn').click(function() {
			var keyword = $("#inner_searchInput").val();
			if (keyword == "" || keyword == " " ) {
				alert("검색어를 입력하세요");
			} else {
				searchBarForm.submit();
			}
		});
	});
</script>
					<div id="inner_searchForm">
						<form id="searchBarForm" action="<c:url value="/search" />">
							상품명 <input type="text" name="itemName" id="inner_searchInput">
							<input type="button" value="상품검색" id="inner_searchBtn">
						</form>
					</div>

					<c:forEach items="${category }" var="list">

						<li id="anchorBoxId_8025" style="margin-bottom: 20px;"
							class="item xans-record-">

							<div class="box">
								<a href="#" name="anchorBoxName_8025"><img
									src="/h72/resources${list.mainImg }" alt="" class="thumb"
									style="width: 250px; height: 250px;"></a>
								<p class="name"></p>
								<p id="inner_itemName">
									<a href="#"><span style="font-size: 11px; color: #000000;">${list.itemName}</span></a>
								</p>
								<p class="price" id="inner_itemPrice">
									\ ${list.minPrice}
								</p>
							</div>
						</li>
					</c:forEach>
					<c:if test="${category eq null }">
						<p style="font-size: 12px; margin-top: 50px;">등록된 상품이 없습니다.</p>
					</c:if>
				</ul>
			</div>
			<div class="searchList_paging">
				<c:choose>
					<c:when test="${listTitle == 'BAG'}">
						<c:set value="bag?" var="cate"></c:set>
					</c:when>
					<c:when test="${listTitle == 'PROTECT'}">
						<c:set value="protect?" var="cate"></c:set>
					</c:when>
					<c:when test="${listTitle == 'FOOD'}">
						<c:set value="food?" var="cate"></c:set>
					</c:when>
					<c:when test="${listTitle == 'TOOL'}">
						<c:set value="tool?" var="cate"></c:set>
					</c:when>
					<c:when test="${listTitle == 'ETC'}">
						<c:set value="etc?" var="cate"></c:set>
					</c:when>
					<c:otherwise>
						<c:set value="search?itemName=${listTitle }&" var="cate"></c:set>
					</c:otherwise>
				</c:choose>
				<c:if test="${currentPage <= 1 }">
					<p>&lt;</p>
				</c:if>
				<c:if test="${currentPage > 1 }">
					<p>
						<a href="/h72/${cate }page=${currentPage -1 }" id="prePaging">&lt;</a>
					</p>
				</c:if>
				<ol>
					<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
						<c:if test="${i==currentPage }">
							<li class="xans-record-"><span class="this"
								style="font-weight: bold; text-decoration: underline;">${i}</span></li>
						</c:if>
						<c:if test="${i != currentPage }">
							<li class="xans-record-"><a href="/h72/${cate }page=${i }"><span
									id="paging" style="color: #222;">${i}</span></a></li>
						</c:if>
					</c:forEach>
				</ol>
				<p>
					<c:if test="${currentPage >= maxPage }">
							&gt;
						</c:if>
					<c:if test="${currentPage < maxPage }">
						<a href="/h72/${cate }page=${currentPage +1 }" id="endPaging">&gt;</a>
					</c:if>
				</p>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>
</body>
</html>