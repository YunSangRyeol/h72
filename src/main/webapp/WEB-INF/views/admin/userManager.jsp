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
		<form>
		<input type="date" name="start" id="startDate" class="searchDateInput"> ~ <input type="date" name="end" id="endDate" class="searchDateInput">
		 &nbsp; <input type="submit" value="검색" class="admin_btn_min">
		</form>
	</div><!-- searchDate -->    
    <div id="searchID">
		<form>
			<input type="text" name="userid" size="30" class="searchInput"> &nbsp; <input type="submit" value="검색" class="admin_btn_min">
		</form>
	</div>
    <div id="searchName" style="display:none;">
		<form>
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
	 			<li> ID정렬</li> &nbsp; ||  &nbsp; 
	 			<li> 이름 </li> &nbsp; ||  &nbsp; 
	 			<li> 가입일 </li>
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
					<th scope="col" class="grade">회원 등급</th>
					<th scope="col" class="number"><p>회원 ID</p></th>
					<th scope="col" class="product">이름</th>
					<th scope="col" class="quantity">생년월일</th>
					
					<th scope="col" class="how">가입일자</th>
					<th scope="col" class="price">총 구매액</th>
				</tr>
			</thead>
			<tbody class="">
				<tr class="xans-record-">
					<td><input type="checkbox"></td>
					<td class="grade">sliver</td>
					<td class="number"><p><strong> USER01 </strong></p></td>
					
					<td class="product">나회원</td>
					<td class="quantity">901010</td>
					<td class="how">2010-10-10</td>
					<td class="price"><a href="">123,200 원</a></td>
				</tr>
				
				<tr class="xans-record-">
					<td><input type="checkbox"></td>
					<td class="grade">sliver</td>
					<td class="number"><p><strong> USER01 </strong></p></td>

					<td class="product">나회원</td>
					<td class="quantity">901010</td>
					
					<td class="how">2010-10-10</td>
					<td class="price"><a href="">123,200 원</a></td>
				</tr>
			</tbody>
		</table>

		<div id="admin_page_list">
	    	 <ul class="pages">	    	
	           <li>&lt;&lt;</li>
	           <li><a href="">&lt;&lt;</a></li>         
	           <li class="active">1</li>
	           <li> <a href=""></a>2</li>
	           <li>&gt;&gt;</li>
	           <li><a href="">&gt;&gt;</a></li>
	        </ul>
    	</div>
  

	</div><!-- admin_order_contents_wrap -->	
	</div><!-- admin_order_contents -->
	
	<div class="footer" >			
		<jsp:include page="../main_footer.jsp" flush="false" />
	</div>
	</div><!-- content_wrap -->
	
	
	
	
	
	
</body>
</html>