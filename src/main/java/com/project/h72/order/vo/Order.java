package com.project.h72.order.vo;

public class Order {
	private String orderNo;
	private String userId;
	private String mainImg;
	private String orderContents;
	private int price;
	private int totalPrice;
	private String paymentMethod;
	private int paymentPoint;
	private int savingPoint;
	private int deliveryPee;
	private String phone;
	private String postNum;
	private String address;
	private String addressDetail;
	private String deliveryMessage;
	private String orderStatus;
	private String orderChange;
	
	public Order() {
		super();
	}

	public Order(String orderNo, String userId, String mainImg, String orderContents, int price, int totalPrice,
			String paymentMethod, int paymentPoint, int savingPoint, int deliveryPee, String phone, String postNum,
			String address, String addressDetail, String deliveryMessage, String orderStatus, String orderChange) {
		super();
		this.orderNo = orderNo;
		this.userId = userId;
		this.mainImg = mainImg;
		this.orderContents = orderContents;
		this.price = price;
		this.totalPrice = totalPrice;
		this.paymentMethod = paymentMethod;
		this.paymentPoint = paymentPoint;
		this.savingPoint = savingPoint;
		this.deliveryPee = deliveryPee;
		this.phone = phone;
		this.postNum = postNum;
		this.address = address;
		this.addressDetail = addressDetail;
		this.deliveryMessage = deliveryMessage;
		this.orderStatus = orderStatus;
		this.orderChange = orderChange;
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

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getOrderContents() {
		return orderContents;
	}

	public void setOrderContents(String orderContents) {
		this.orderContents = orderContents;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public int getSavingPoint() {
		return savingPoint;
	}

	public void setSavingPoint(int savingPoint) {
		this.savingPoint = savingPoint;
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
	
	@Override
	public String toString(){
		return this.orderNo + ", " + this.userId + ", " + this.mainImg + ", " + this.orderContents  + ", " + this.price
				 + ", " + this.totalPrice + ", " + this.paymentMethod + ", " + this.paymentPoint + ", " + this.savingPoint
				 + ", " + this.deliveryPee + ", " + this.phone + ", " + this.postNum + ", " + this.address + ", " + this.addressDetail
				 + ", " + this.deliveryMessage + ", " + this.orderStatus + ", " + this.orderChange;
	}
	
}
