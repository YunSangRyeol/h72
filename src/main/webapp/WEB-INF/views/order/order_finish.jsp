<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    border: 1px solid #e7e7e7;
    text-align: left;
    font-size: 13px;
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
					주문내역 및 배송에 관한 안내는 <a href="/h72/order/order_list"><span class="order_detail_link">주문조회</span></a>를 통하여 확인 가능합니다.<br>
					<br>
					주문번호 : <span class="order_complete_num">${order.orderNo }</span><br>
					주문일자 : ${order.enrollDate }
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
										<td><span class="total_payment">
										<fmt:formatNumber value="${order.totalPrice+order.deliveryPee}" pattern="#,###"/>
										</span></td>
									</tr>
									<tr>
										<th scope="row">적립예정금액</th>
										<td> <fmt:formatNumber value="${order.totalSavingPoint }" pattern="#,###"/>원
										</td>
									</tr>
									<tr>
										<th scope="row">결제수단</th>
										<td> <strong>${order.paymentMethod}</strong><br>
											입금자 : ${bankInfo['vName']},&nbps;&nbps; 계좌번호 : ${bankInfo['vbankName']} ${bankInfo['vbankNum']}<br>
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
										<td>${order.deleveryName}</td>
									</tr>
									<tr>
										<th scope="row">우편번호</th>
										<td> ${order.postNum}
										</td>
									</tr>
									<tr>
										<th scope="row">주소</th>
										<td>${order.address}
										</td>
									</tr>
									<tr>
										<th scope="row">연락처</th>
										<td>${order.phone }
										</td>
									</tr>
									<tr>
										<th scope="row">배송메세지</th>
										<td>${order.deliveryMessage }
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