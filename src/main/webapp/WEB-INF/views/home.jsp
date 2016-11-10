<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>72hours::국내 최대 재난대비 용품샵</title>
<link href="/h72/resources/css/home.css" type="text/css"
	rel="stylesheet">
<link rel="shortcut icon" href="/h72/resources/image/favicon.ico">
<link rel="icon" type="image/gif" href="/h72/resources/image/animated_favicon1.gif">
</head>
<body id="main">
	<div id="main_content_wrap">
		<jsp:include page="main_header.jsp" flush="false" />

		<div class="main_contents" align="center">
			<div class="main_slideshow-container" align="center">

				<div class="main_mySlides fade">
					<div class="main_numbertext">1 / 3</div>
					<img src="/h72/resources/image/back4.jpg">
				</div>

				<div class="main_mySlides fade">
					<div class="main_numbertext">2 / 3</div>
					<img src="/h72/resources/image/back3.jpg">
				</div>

				<div class="main_mySlides fade">
					<div class="main_numbertext">3 / 3</div>
					<img src="/h72/resources/image/back1.jpg">
				</div>
<div style="text-align:center">
  <span class="main_dot"></span>
  <span class="main_dot"></span>
  <span class="main_dot"></span>
</div>

			</div>
			<br>


			<script>
				/* var slideIndex = 1;
				showSlides();

				function plusSlides(n) {
					showSlides(slideIndex += n);
				}

				function currentSlide(n) {
					showSlides(slideIndex = n);
				}
				function showSlides(n) {
					var i;
					var slides = document.getElementsByClassName("main_mySlides");
					var dots = document.getElementsByClassName("dot");
					if (n > slides.length) {
						slideIndex = 1
					}
					if (n < 1) {
						slideIndex = slides.length
					}
					for (i = 0; i < slides.length; i++) {
						slides[i].style.display = "none";
					}
					for (i = 0; i < dots.length; i++) {
						dots[i].className = dots[i].className.replace(
								" active", "");
					}
					slides[slideIndex - 1].style.display = "block";
					dots[slideIndex - 1].className += " active";
				} */
				var slideIndex = 0;
				showSlides();

			
				function showSlides() {
					var i;
					var slides = document.getElementsByClassName("main_mySlides");
					var dots = document.getElementsByClassName("main_dot");
					for (i = 0; i < slides.length; i++) {
						slides[i].style.display = "none";
					}
					
					slideIndex++;
					if (slideIndex > slides.length) {
						slideIndex = 1
					}
					for (i = 0; i < dots.length; i++) {
						dots[i].className = dots[i].className.replace(
								" active", "");
					}
					slides[slideIndex - 1].style.display = "block";
					dots[slideIndex - 1].className += " active";
					setTimeout(showSlides, 3200); // Change image every 2 seconds
				} 
			</script>

			<div class="main_banner2">
				<a href="<c:url value="/protect"/>">
					<div id="main_banner_clothes">
						<span id="main_label_title">PROTECT</span><br>
						<span id="main_label_contents">영하 10℃ 에서도 체온 유지 가능</span>
					</div>
				</a>
				<a href="<c:url value="/food"/>" >
					<div id="main_banner_food">
						<span id="main_label_title">FOOD</span><br>
						<span id="main_label_contents">간단 조리가 가능한 비상식량 모음</span>
					</div>
				</a>
			</div>
			<a href="<c:url value="/bag"/>">
				<div class="main_banner3">
					<span id="main_label_title2">BAG</span><br>
					<span id="main_label_contents2">생존배낭 사이즈별 대량 입고</span>
				</div>
			</a>
			<div class="main_banner4">
				<a href="<c:url value="/tool"/>">
					<div id="main_banner_tool">
						<span id="main_label_title">TOOL</span><br>
						<span id="main_label_contents">최대 밝기 2000루멘 휴대용 라이트 판매중</span>
					</div>
				</a>
				<a href="<c:url value="/etc"/>">
					<div id="main_banner_etc">
						<span id="main_label_title">ETC</span><br>
						<span id="main_label_contents">응급처치 세트 외 기타용품 모음집</span>
					</div>
				</a>
			</div>
			<a href="<c:url value="/kitDiy/kitDiyView"/>">
				<div class="main_banner5">
					<span id="main_label_title2">KIT</span><br>
					<span id="main_label_contents2">응급처치 세트 외 기타용품 모음집</span>
				</div>
			</a>
			
			</div>
		</div>
		<jsp:include page="main_footer.jsp" flush="false" />
	</div>
</body>
</html>