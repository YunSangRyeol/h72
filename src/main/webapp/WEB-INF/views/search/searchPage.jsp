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

					<c:forEach items="${category }" var="list">

						<li id="anchorBoxId_8025" style="margin-bottom: 20px;"
							class="item xans-record-">
							<div class="box">
								<a href="#" name="anchorBoxName_8025"><img
									src="/h72/resources${list.mainImg }" alt="" class="thumb"
									style="width: 250px; height: 250px;"></a>
								<p class="name"></p>
								<p
									style="letter-spacing: -1px; text-align: left; border-bottom: 1px solid #e7e7e7; padding-bottom: 5px; margin-bottom: 5px;">
									<a href="#"><span style="font-size: 11px; color: #000000;">${list.itemName}</span></a>
								</p>
								<p class="price"
									style="font-family: 'Lato', sans-serif; font-weight: 400; color: #333; font-size: 14px; padding: 0; text-align: left; line-height: 20px;">
									<span
										style="text-decoration: line-through; color: #a2a2a2; font-family: 'Lato', sans-serif; font-weight: 300;"></span>
									\ ${list.minPrice}
								</p>
							</div>
						</li>
					</c:forEach>

					<%-- <c:otherwise>

							<c:forEach items="${keywordList}" var="list">
								<li id="anchorBoxId_8025" style="margin-bottom: 20px;"
									class="item xans-record-">
									<div class="box">
										<a href="#" name="anchorBoxName_8025"><img
											src="/h72/resources${list.mainImg }" alt="" class="thumb"
											style="width: 250px; height: 250px;"></a>
										<p class="name"></p>
										<p
											style="letter-spacing: -1px; text-align: left; border-bottom: 1px solid #e7e7e7; padding-bottom: 5px; margin-bottom: 5px;">
											<a href="#"><span
												style="font-size: 11px; color: #000000;">${list.itemName}</span></a>
										</p>
										<p class="price"
											style="font-family: 'Lato', sans-serif; font-weight: 400; color: #333; font-size: 14px; padding: 0; text-align: left; line-height: 20px;">
											<span
												style="text-decoration: line-through; color: #a2a2a2; font-family: 'Lato', sans-serif; font-weight: 300;"></span>
											\ ${list.minPrice}
										</p>
									</div>
								</li>
							</c:forEach>

						</c:otherwise>
					</c:choose> --%>
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