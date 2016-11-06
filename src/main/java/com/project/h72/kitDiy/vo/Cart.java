package com.project.h72.kitDiy.vo;

public class Cart{
	
	private String itemId;
	private String userId;
	private String itemFullName;
	private String itemDetailId;
	private String mainImg;
	private int quantity;
	private int cost;
	private String message;
	private String kit_yn;
	
	private String tempQ;
	private String tempC;
	
	public Cart() {	}


	public Cart(String itemId, String userId, String itemFullName, String itemDetailId, String mainImg,
			int quantity, int cost, String message, String kit_yn) {
		super();
		this.itemId = itemId;
		this.userId = userId;
		this.itemFullName = itemFullName;
		this.itemDetailId = itemDetailId;
		this.mainImg = mainImg;
		this.quantity = quantity;
		this.cost = cost;
		this.message = message;
		this.kit_yn = kit_yn;
	}


	public String getItemId() {
		return itemId;
	}


	public void setItemId(String itemId) {
		this.itemId = itemId;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getItemFullName() {
		return itemFullName;
	}


	public void setItemFullName(String itemFullName) {
		this.itemFullName = itemFullName;
	}


	public String getItemDetailId() {
		return itemDetailId;
	}


	public void setItemDetailId(String itemDetailId) {
		this.itemDetailId = itemDetailId;
	}


	public String getMainImg() {
		return mainImg;
	}


	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public int getCost() {
		return cost;
	}


	public void setCost(int cost) {
		this.cost = cost;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public String getKit_yn() {
		return kit_yn;
	}


	public void setKit_yn(String kit_yn) {
		this.kit_yn = kit_yn;
	}
	

	public String getTempQ() {
		return tempQ;
	}


	public void setTempQ(String tempQ) {
		this.tempQ = tempQ;
	}


	public String getTempC() {
		return tempC;
	}


	public void setTempC(String tempC) {
		this.tempC = tempC;
	}


	@Override
	public String toString() {
		return "Cart [itemId=" + itemId + ", userId=" + userId + ", itemFullName=" + itemFullName + ", itemDetailId="
				+ itemDetailId + ", mainImg=" + mainImg + ", quantity=" + quantity + ", cost=" + cost + ", message="
				+ message + ", kit_yn=" + kit_yn + "]";
	}




}
