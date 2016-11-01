package com.project.h72.order.vo;

import java.sql.Date;

public class Order {
	private String orderNo;
	private String userId;
	private String mainImgN1;
	private String itemName;
	private String itemOptionName;
	private int totalQuantity;
	private int totalPrice;
	private String paymentMethod;
	private int paymentPoint;
	private int totalSavingPoint;
	private int deliveryPee;
	private String phone;
	private String postNum;
	private String address;
	private String addressDetail;
	private String deliveryMessage;
	private String orderStatus;
	private String orderChange;
	private Date enrollDate;
	
	
	public Order() {
		super();
	}


	public Order(String orderNo, String userId, String mainImgN1, String itemName, String itemOptionName,
			int totalQuantity, int totalPrice, String paymentMethod, int paymentPoint, int totalSavingPoint,
			int deliveryPee, String phone, String postNum, String address, String addressDetail, String deliveryMessage,
			String orderStatus, String orderChange, Date enrollDate) {
		super();
		this.orderNo = orderNo;
		this.userId = userId;
		this.mainImgN1 = mainImgN1;
		this.itemName = itemName;
		this.itemOptionName = itemOptionName;
		this.totalQuantity = totalQuantity;
		this.totalPrice = totalPrice;
		this.paymentMethod = paymentMethod;
		this.paymentPoint = paymentPoint;
		this.totalSavingPoint = totalSavingPoint;
		this.deliveryPee = deliveryPee;
		this.phone = phone;
		this.postNum = postNum;
		this.address = address;
		this.addressDetail = addressDetail;
		this.deliveryMessage = deliveryMessage;
		this.orderStatus = orderStatus;
		this.orderChange = orderChange;
		this.enrollDate = enrollDate;
	}





	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMainImgN1() {
		return mainImgN1;
	}

	public void setMainImgN1(String mainImgN1) {
		this.mainImgN1 = mainImgN1;
	}

	
	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public String getItemOptionName() {
		return itemOptionName;
	}


	public void setItemOptionName(String itemOptionName) {
		this.itemOptionName = itemOptionName;
	}


	public int getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public int getPaymentPoint() {
		return paymentPoint;
	}

	public void setPaymentPoint(int paymentPoint) {
		this.paymentPoint = paymentPoint;
	}

	public int getTotalSavingPoint() {
		return totalSavingPoint;
	}

	public void setTotalSavingPoint(int totalSavingPoint) {
		this.totalSavingPoint = totalSavingPoint;
	}

	public int getDeliveryPee() {
		return deliveryPee;
	}

	public void setDeliveryPee(int deliveryPee) {
		this.deliveryPee = deliveryPee;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPostNum() {
		return postNum;
	}

	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getDeliveryMessage() {
		return deliveryMessage;
	}

	public void setDeliveryMessage(String deliveryMessage) {
		this.deliveryMessage = deliveryMessage;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderChange() {
		return orderChange;
	}

	public void setOrderChange(String orderChange) {
		this.orderChange = orderChange;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString(){
		return this.orderNo + ", " + this.userId + ", " + this.mainImgN1 + ", " + this.itemName + ", " + this.itemOptionName  + ", " + this.totalQuantity
				 + ", " + this.totalPrice + ", " + this.paymentMethod + ", " + this.paymentPoint + ", " + this.totalSavingPoint
				 + ", " + this.deliveryPee + ", " + this.phone + ", " + this.postNum + ", " + this.address + ", " + this.addressDetail
				 + ", " + this.deliveryMessage + ", " + this.orderStatus + ", " + this.orderChange + ", " + this.enrollDate;
	}
	
}
