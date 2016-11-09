<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/h72/resources/css/admin.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<title>User Manager</title>
<script type="text/javascript">
	//탭 변경
	function openTab(evt, tabname) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace("active", "");
		}
		document.getElementById(tabname).style.display = "block";
		evt.currentTarget.className += " active";
	}
	
	//검색시 검색 text와 submit버튼 변경
 	$(function() {
		$('#adminSearchhow').change(
				function(){
					$('#searchDate')[($("option[value='date']").is(":checked")) ? "show" : "hide"]();
					$('#searchID')[($("option[value='user']").is(":checked")) ? "show" : "hide"]();
					$('#searchName')[($("option[value='name']").is(":checked")) ? "show" : "hide"]();
				});
	}); 
 	
 	//전체선택 체크박스 클릭
 	$(function() {		
		$("#allCheck").click(
			function() {
				if ($("#allCheck").prop("checked")) {
					$("#orderList input[type=checkbox]").prop("checked", true);
				} else {
					$("#orderList input[type=checkbox]").prop("checked", false);
				}
				$("#orderList input[type=checkbox]").change();
		})
	})
 	
	//체크박스 선택시 tr 색 변경
	$(function() {
		$("#orderList input[type=checkbox]").change(function() {
			if ($(this).is(":checked")) {
				$(this).closest("tr").find("td").each(function() {
					$(this).css("background", "#f6f6f6");
				});
			} else {
				$(this).closest("tr").find("td").each(function() {
					$(this).css("background", "white");
				});
			}
		
		} );
	});

 	//날짜 값 최초입력
 	$(function(){
 		var tDay = new Date();
 		var tMonth = tDay.getMonth()+1;
 		var tDate = tDay.getDate();
 		
		document.getElementById("startDate").value = tDay.getFullYear()+"-"+tMonth+"-"+ tDate;	
		document.getElementById("endDate").value = tDay.getFullYear()+"-"+tMonth+"-"+tDate;		
			
 	});
 	
</script>
</head>
<body>
	<div class="content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp"/>

	<div class="admin_contents_wrap">
	<div class="admin_contents">
	
	<div class="admin_order_titleArea">
    			<h2>USER MANAGER</h2> 
			</div>

	<div id="admin_order_search">
	<div id="adminSearchhow">
	<select class="selectOption">
		<option value="user" selected> I D </option>
		<option value="name">회원이름</option>
		<option value="date">가입일자</option>
	</select>
	</div>
	<div id="searchDate"  style="display:none;">
		<form form id="searchDateForm" method="post" action="/h72/adminSDate.do">
		<input type="date" name="start" id="startDate" class="searchDateInput"> ~ <input type="date" name="end" id="endDate" class="searchDateInput">
		 &nbsp; <input type="submit" value="검색" class="admin_btn_min">
		</form>
	</div><!-- searchDate -->    
    <div id="searchID">
		<form id="searchIdForm" method="post" action="/h72/adminSID.do">
			<input type="text" name="userid" size="30" class="searchInput"> &nbsp; <input type="submit" value="검색" class="admin_btn_min">
		</form>
	</div>
    <div id="searchName" style="display:none;">
		<form id="searchNameForm" method="post" action="/h72/adminSName.do">
			<input type="text" name="username" size="30" class="searchInput"> &nbsp; <input type="submit" value="검색" class="admin_btn_min">
		</form>
	</div>	
    </div>
      <ul id="admin_order_detail">
	    <li>회원ID를 클릭하시면 회원정보를 모두 확인할수 있습니다. 회원 삭제는 해당창에서 삭제가능합니다.</li>
	    <li>주문번호를 클릭하시면 해당 회원의 구매 상세내역을 확인할수 있습니다</li>
      </ul>
	
	<div id="usersTop">
	 	<div id="orderbyDiv">
	 		<ul class="orderby">
		 			<c:url var="goOrder" value="/admin/users" >
						<c:param name="page" value="${nowPage }" />
						<c:param name="count" value="${count }" />
						<c:param name="order" value="USER_ID" />
					</c:url>
	 			<li><a href="${goOrder }">I D</a></li> &nbsp; ||  &nbsp; 
		 			<c:url var="goName" value="/admin/users" >
						<c:param name="page" value="${nowPage }" />
						<c:param name="count" value="${count }" />
						<c:param name="order" value="NAME" />
					</c:url>
	 			<li><a href="${goName }">이름</a></li> &nbsp; ||  &nbsp; 
	 				<c:url var="goEnrollDate" value="/admin/users" >
						<c:param name="page" value="${nowPage }" />
						<c:param name="count" value="${count }" />
						<c:param name="order" value="ENROLLDATE" />
					</c:url>
	 			<li><a href="${goEnrollDate }">가입일</a></li> &nbsp; ||  &nbsp; 
	 				<c:url var="goPrice" value="/admin/users" >
						<c:param name="page" value="${nowPage }" />
						<c:param name="count" value="${count }" />
						<c:param name="order" value="TOTAL_PRICE" />
					</c:url>
	 			<li><a href="${goPrice }" />">구매금액</a></li>
	 		</ul>
	 	</div>
	 	<div id="selectNumdDiv">
		 	<select id="selectNum">
				<option> 10명 </option>
				<option> 30명 </option>
				<option> 50명 </option>
			</select>
	 	</div>
 	</div>
 	
	<div id="userContents" >
		<table id="orderList" border="1" summary="">
			<thead>
				<tr>
					<th scope="col" class="checked"><input type="checkbox" id="allCheck"></th>
					<th scope="col" class="levelcode">회원 등급</th>
					<th scope="col" class="userid"><p>회원 ID</p></th>
					<th scope="col" class="name">이름</th>
					<th scope="col" class="birthdate">생년월일</th>
					
					<th scope="col" class="how">가입일자</th>
					<th scope="col" class="totalprice">총 구매액</th>
				</tr>
			</thead>		
			<tbody class="">
			<c:if test="${!(list eq null) }">
						
				<c:forEach var="list" items="${list}" >
				<tr class="xans-record-">
					<td><input type="checkbox"></td>
					<td class="levelcode">${list.levelcode }</td>
					<td class="userid"><p><strong> ${list.userid } </strong></p></td>
					
					<td class="name">${list.name }</td>
					<td class="birthdate">${list.birthdate }</td>
					<td class="enrollDate">${list.enrollDate }</td>
					<td class="totalprice"><a href="">${list.totalprice }</a></td>
				</tr>
				</c:forEach>			
			</c:if>
			</tbody>	
		</table>
		<!-- 	<c:url var="goUser" value="/admin/users" >
								<c:param name="page" value="0" />
								<c:param name="count" value="10" />
								<c:param name="order" value="USER_ID" />
							</c:url>
							<li><a href="${goUser}">회원관리</a></li>
		 -->
		
		<div id="admin_page_list">
			<c:url var="goUserMinus" value="/admin/users" >
					<c:param name="page" value="${nowPage -1 }" />
					<c:param name="count" value="${count }" />
					<c:param name="order" value="${order }" />
			</c:url>
			<c:if test="${nowPage eq 1 }">
				[이전] 
			</c:if>
			<c:if test="${nowPage ne 1 }" >
				 <a href="${goUserMinus }" >[이전]</a>
			</c:if>
			<c:forEach var="p" begin="1" end="${endPage + 1 }" >	
				<c:url var="goUser" value="/admin/users" >
					<c:param name="page" value="${p }" />
					<c:param name="count" value="${count }" />
					<c:param name="order" value="${order }" />
				</c:url>
				<c:if test="${p eq nowPage }">
					<span style="font-size:20px; color:red;">[${p }]</span>
				</c:if>
				<c:if test="${p ne nowPage }">
					<a href="${goUser }">[${p }]</a>
				</c:if>
			</c:forEach>
			<c:url var="goUserPlus" value="/admin/users" >
					<c:param name="page" value="${ nowPage + 1 }" />
					<c:param name="count" value="${count }" />
					<c:param name="order" value="${order }" />
			</c:url>
             <c:if test ="${nowPage eq endPage + 1 }">
             	[다음]
             </c:if>
              <c:if test ="${nowPage ne endPage + 1 }">
             	<a href="${goUserPlus }">[다음]</a>
             </c:if>
		</div><!-- pageList -->
  

	</div><!-- admin_order_contents_wrap -->	
	</div><!-- admin_order_contents -->
	
	<div class="footer" >			
		<jsp:include page="../main_footer.jsp" flush="false" />
	</div>
	</div><!-- content_wrap -->
	
	
	
	
	
	
</body>
</html>