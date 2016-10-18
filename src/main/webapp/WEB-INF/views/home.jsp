<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>72hours::국내 최대 재난대비 용품샵</title>
<link href="/h72/resources/css/home.css" type="text/css"
	rel="stylesheet">

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
				<a href="#"><img src="/h72/resources/image/clothes.jpg"></a><a
					href="#" target="_blank"><img
					src="/h72/resources/image/food.jpg" style="margin-top: 6px;"></a>
			</div>
			<div class="main_banner3">
				<a href="#"><img src="/h72/resources/image/backpack.jpg"></a>
			</div>
			<div class="main_banner4">
				<a href="#"><img src="/h72/resources/image/equip.jpg"></a> <a
					href="#"><img src="/h72/resources/image/etc.jpg"
					style="margin-top: 6px;"></a>
			</div>
			<div class="main_banner5">
				<a href="#"><img src="/h72/resources/image/kit.jpg"></a>

			</div>
		</div>
		<hr color="#d9d9d9" size="1">
		<jsp:include page="main_footer.jsp" flush="false" />
	</div>
</body>
</html>