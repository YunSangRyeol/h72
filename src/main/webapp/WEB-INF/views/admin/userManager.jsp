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
					$("#usersList input[type=checkbox]").prop("checked", true);
				} else {
					$("#usersList input[type=checkbox]").prop("checked", false);
				}
				$("#usersList input[type=checkbox]").change();
		});
	});
 	
	//체크박스 선택시 tr 색 변경
	$(function() {
		$("#usersList input[type=checkbox]").change(function() {
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
 	
 	//유저 명수 select value 지정
 	$(function(){
					$('#selectNum').val('${count }').prop("selected", true);
				});
 	
 	//한페이지에 유저 명 수 변경
 	$(function(){
 		$('#selectNumdDiv').change(
 				function(){
 					var modifyCount = $('#selectNum').val();
 					location.href="/h72/admin/users?page=${nowPage }&count=" + modifyCount +"&order=${order}&where=${where}";
 				});
 	});
 	
 	//검색시 null값 불가
 	$(function(){
 		$('#idsubmit').click(
 			function(){
 				if($('#userid').val().length == 0){
 					alert("검색 내용을 입력해주세요.");
 					searchIdForm.userid.focus();
 				}else{
 					searchIdForm.submit();
 				}
 		});
 		
 		$('#namesubmit').click(
 	 			function(){
 	 				if($('#username').val().length == 0){
 	 					alert("검색 내용을 입력해주세요.");
 	 					searchNameForm.username.focus();
 	 				}else{
 	 					searchNameForm.submit();
 	 				}
 	 		});
 		
 		$('#datesubmit').click(
 	 			function(){
 	 				if($('#startDate').val().length == 0){
 	 					alert("날짜를 선택해주세요.");
 	 					searchDateForm.startDate.focus();
 	 				}else if($('#endDate').val().length == 0){
 	 					alert("날짜를 선택해주세요.");
 	 					searchDateForm.endDate.focus();
 	 				}else{
 	 					searchDateForm.submit();
 	 				}
 	 		});
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
		 &nbsp; 
		 <input type="button" id="datesubmit" value="검색" class="admin_btn_min">
		</form>
	</div><!-- searchDate -->    
    <div id="searchID">
		<form id="searchIdForm" method="post" action="/h72/adminSID.do">
			<input type="text" id="userid" name="userid" size="30" class="searchInput"> &nbsp; 
			<input type="button"  id="idsubmit" value="검색" class="admin_btn_min">
		</form>
	</div>
    <div id="searchName" style="display:none;">
		<form id="searchNameForm" method="post" action="/h72/adminSName.do">
			<input type="text" id="username" name="username" size="30" class="searchInput"> &nbsp; 
			<input type="button" id="namesubmit" value="검색" class="admin_btn_min">
		</form>
	</div>	
    </div>
      <ul id="admin_order_detail">
	    <li>회원 이름를 클릭하시면 회원정보를 모두 확인할수 있습니다.</li>
	    <li>회원ID를 클릭하시면 해당회원의 구매내역 페이지로 이동합니다.</li>
      </ul>
	
	<div id="countUsers">
	 		<c:if test="${where eq 'null' }">
	 			현재 가입된 회원의 수는 모두 <span class="countUserAll"> ${countAll }</span>명 입니다. 
	 		</c:if>
	 		<c:if test="${where ne 'null' }">
	 			검색된 회원의 수는 <span class="countUserAll"> ${countAll }</span>명입니다.
	 		</c:if>
	 	</div>
	<div id="usersTop">
	
	 	<div id="orderbyDiv">
	 		 		
	 		<ul class="orderby">
		 			<c:url var="goOrder" value="/admin/users" >
						<c:param name="page" value="${nowPage }" />
						<c:param name="count" value="${count }" />
						<c:param name="order" value="USER_ID" />
						<c:param name="where" value="${where }" />
					</c:url>
	 			<li><a href="${goOrder }">I D</a></li> &nbsp; ||  &nbsp; 
		 			<c:url var="goName" value="/admin/users" >
						<c:param name="page" value="${nowPage }" />
						<c:param name="count" value="${count }" />
						<c:param name="order" value="NAME" />
						<c:param name="where" value="${where }" />
					</c:url>
	 			<li><a href="${goName }">이름</a></li> &nbsp; ||  &nbsp; 
	 				<c:url var="goEnrollDate" value="/admin/users" >
						<c:param name="page" value="${nowPage }" />
						<c:param name="count" value="${count }" />
						<c:param name="order" value="ENROLLDATE DESC" />
						<c:param name="where" value="${where }" />
					</c:url>
	 			<li><a href="${goEnrollDate }">가입일</a></li> &nbsp; ||  &nbsp; 
	 				<c:url var="goPrice" value="/admin/users" >
						<c:param name="page" value="${nowPage }" />
						<c:param name="count" value="${count }" />
						<c:param name="order" value="TOTAL_PRICE DESC" />
						<c:param name="where" value="${where }" />
					</c:url>
	 			<li><a href="${goPrice }" />구매금액</a></li>
	 		</ul>
	 	</div>
	 	<div id="selectNumdDiv">
		 	<select id="selectNum">
				<option value="10"> 10명 </option>
				<option value="20"> 20명 </option>
				<option value="30"> 30명 </option>
			</select>
	 	</div>
 	</div>
 	
	<div id="userContents" >
		<table id="usersList" >
			<thead>
				<tr>
					<th scope="col" class="checked"><input type="checkbox" id="allCheck" class="checkMargin"></th>
					<th scope="col" class="levelcode">회원 등급</th>
					<th scope="col" class="userid"><p>회원 ID</p></a></th>
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
					<td><input type="checkbox" class="checkMargin" id="checkUser"></td>
					<td class="levelcode">${list.levelcode }</td>
						<c:url var="goSearchUser" value="/orderASearchUserID.do">
							<c:param name="userid" value="${list.userid }" />
						</c:url>
					<td class="userid"><a href="${goSearchUser }"><p><strong> ${list.userid } </strong></p></a></td>
						<c:url var="goWhoUser" value="/whoUser.do">
							<c:param name="userid" value="${list.userid }" />
						</c:url>					
					<td class="name"><a href="${goWhoUser }" onclick="window.open(this.href,'_blank','width=600,height=600, left=300, top=100, scrollbars=no');return false;">${list.name }</a></td>
					<td class="birthdate">${list.birthdate }</td>
					<td class="enrollDate">${list.enrollDate }</td>
					<td class="totalprice"><a href="">${list.totalprice }</a></td>
				</tr>
				</c:forEach>			
			</c:if>
			</tbody>	
		</table>		
		<div id="admin_page_list">
			<c:url var="goUserfirst" value="/admin/users" >
					<c:param name="page" value="${1 }" />
					<c:param name="count" value="${count }" />
					<c:param name="order" value="${order }" />
					<c:param name="where" value="${where }" />
			</c:url>
				 <a href="${goUserfirst }" >[처음으로]</a>
			<c:url var="goUserMinus" value="/admin/users" >
					<c:param name="page" value="${nowPage -1 }" />
					<c:param name="count" value="${count }" />
					<c:param name="order" value="${order }" />
					<c:param name="where" value="${where }" />
			</c:url>
			<c:if test="${nowPage eq 1 }">
				[이전] 
			</c:if>
			<c:if test="${nowPage ne 1 }" >
				 <a href="${goUserMinus }" >[이전]</a>
			</c:if>
			<c:forEach var="p" begin="1" end="${endPage }" >	
				<c:url var="goUser" value="/admin/users" >
					<c:param name="page" value="${p }" />
					<c:param name="count" value="${count }" />
					<c:param name="order" value="${order }" />
					<c:param name="where" value="${where }" />
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
					<c:param name="where" value="${where }" />
			</c:url>
             <c:if test ="${nowPage eq endPage }">
             	[다음]
             </c:if>
              <c:if test ="${nowPage ne endPage }">
             	<a href="${goUserPlus }">[다음]</a>
             </c:if>
             <c:url var="goUserList" value="/admin/users" >
					<c:param name="page" value="${endPage }" />
					<c:param name="count" value="${count }" />
					<c:param name="order" value="${order }" />
					<c:param name="where" value="${where }" />
			</c:url>
				<a href="${goUserList }">[마지막으로]</a>
		</div><!-- pageList -->
  

	</div><!-- admin_order_contents_wrap -->	
	</div><!-- admin_order_contents -->
	
	<div class="footer" >			
		<jsp:include page="../main_footer.jsp" flush="false" />
	</div>
	</div><!-- content_wrap -->
	
	
	
	
	
	
</body>
</html>