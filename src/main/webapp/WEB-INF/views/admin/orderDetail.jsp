<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>order Info</title>
<link href="/h72/resources/css/mJoin.css" type="text/css" rel="stylesheet">
<link href="/h72/resources/css/admin.css" type="text/css" rel="stylesheet">
</head>
<body id="detail">
	<div id="mjoin_content_wrap">
		<div class="mjoin_contents" align="center">
			<div class="detail_title">
				<h2>Order Information</h2>
			</div>
			<div class="userDetail_form">
				<div class="mjoin_boardWrite">
					<table border="1" summary="">
						<tbody>
							<tr>
								<th scope="row">주문 번호</th>
								<td>${order.orderNo }</td>
							</tr>
							<tr>
								<th scope="row">주문 날짜</th>
								<td>${order.enrollDate }</td>
							</tr>
							<tr>
								<th scope="row">주문자 아이디</th>
								<td>${order.userId }</td>
							</tr>
							<tr>
								<th scope="row">물건 종류 개수 </th>
								<td>${order.kindsQuantity }</td>
							</tr>
							<tr>
								<th scope="row">총 개수 </th>
								<td>${order.totalQuantity }</td>
							</tr>
							<tr>
								<th scope="row">총 가격 </th>
								<td>${order.totalPrice }</td>
							</tr>
							<tr><th scope="row">결제 방법</th>
								<td>${order.paymentMethod }</td>
							</tr>
							<tr><th scope="row">사용 포인트</th>
								<td>${order.paymentPoint }</td>
							</tr>
							<tr><th scope="row">총 적립 포인트</th>
								<td>${order.totalSavingPoint }</td>
							</tr>		
							<tr><th scope="row">배송비</th>
								<td>${order.deliveryPee }</td>
							</tr>	
							<tr><th scope="row">배송 정보</th>
								<td>${order.postNum }<br>
									${order.address }<br>
									${order.addressDetail }<br>
									${order.deleveryName }<br>
									${order.phone }<br>
								</td>
							</tr>	
							<tr><th scope="row">배송메세지</th>
								<td>${order.deliveryMessage }</td>
							</tr>	
							<tr><th scope="row">배송 상태</th>
								<td>${order.orderStatus }</td>
							</tr>	
							<tr><th scope="row">취소/교환/반품 상황</th>
								<td>${order.orderChange }</td>
							</tr>						
						</tbody>
					</table>
				</div>
				</div>
</body>
</html>
