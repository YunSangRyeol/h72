<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thank you</title>
<link href="/h72/resources/css/cart.css" type="text/css"
	rel="stylesheet">
<link href="/h72/resources/css/order.css" type="text/css"
	rel="stylesheet">

<style>
.xans_order_complete{
padding-bottom: 30px;
}
.xans_order_complete .order_complete_info{
      padding: 30px 50px;
    text-align: center;
    border: 1px solid #e7e7e7;
    text-align: left;
}

.xans_order_complete .order_complete_info span.order_detail_link{
	color:#f53b2d;
	font-weight: bold;
	text-decoration:underline;
}

.xans_order_complete .order_complete_info span.order_complete_num{
	font-size:14px;
	font-weight: 400;
	text-decoration:none;
}

span.total_payment {
    font-size: 14px;
}
.main_line2 .main_cate #main_cateIdx1 {
    margin-left: 0px;
}

</style>
</head>
<body>

	<div id="content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp" />


		<div id="order_contents_wrap">
			<div id="order_contents">
				<div class="order_titleArea">
					<h2>THANK YOU</h2>
				</div>
				
			<div class="xans-order-form">	
				<div class="xans_order_complete ">
					<div class="order_complete_info">
					<strong>고객님의 주문이 완료 되었습니다.</strong><br>
					주문내역 및 배송에 관한 안내는 <span class="order_detail_link">주문조회</span>를 통하여 확인 가능합니다.<br>
					<br>
					주문번호 : <span class="order_complete_num">007878888</span><br>
					주문일자 :
					</div>
				</div>
				
				<div class="orderArea">
						<div class="title">
							<h3>결제정보</h3>
						</div>
						<div class="boardWrite">
							<table border="1" summary="">
								<tbody>
									<tr>
										<th scope="row">최종결제금액 </th>
										<td><span class="total_payment">50,000원</span></td>
									</tr>
									<tr>
										<th scope="row">적립예정금액</th>
										<td> 500원
										</td>
									</tr>
									<tr>
										<th scope="row">결제수단</th>
										<td> <strong>무통장 입금</strong><br>
											입금자 : 하지수, 계좌번호 : 국민은행 00000000000((주)살아남조)<br>
											현금영수증 발행 : <strong>발행안함</strong>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
				</div>
				
				<div class="orderArea">
						<div class="title">
							<h3>배송지정보</h3>
						</div>
						<div class="boardWrite">
							<table border="1" summary="">
								<tbody>
									<tr>
										<th scope="row">받으시는분 </th>
										<td>하지수</td>
									</tr>
									<tr>
										<th scope="row">우편번호</th>
										<td> 140000
										</td>
									</tr>
									<tr>
										<th scope="row">주소</th>
										<td>경기도 시흥시 월곶중앙로14번길 풍림2차
										</td>
									</tr>
									<tr>
										<th scope="row">일반전화</th>
										<td>010-3042-2030
										</td>
									</tr>
									<tr>
										<th scope="row">휴대전화</th>
										<td>010-3042-2030
										</td>
									</tr>
									<tr>
										<th scope="row">배송메세지</th>
										<td>경비실보관
										</td>
									</tr>
								</tbody>
							</table>
						</div>
				</div>
				<p style="padding-bottom:30px;"><br><br></p>
			</div>	
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/views/main_footer.jsp" flush="false" />
	</div>			
</body>
</html>