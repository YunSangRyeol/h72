package com.project.h72.order.vo;


public class OrderContents {

	private String orderNo;
	private String itmeId;
	private String itemName;
	private String itemOptionName;
	private String itemDetailID;
	private String mainImg;
	private int quantity;
	private int savingPoint;
	private int cost;
	private String message;
	private char kitYN;
	
	
	public OrderContents() {
		super();
	}


	public OrderContents(String orderNo, String itmeId, String itemName, String itemOptionName,
			String itemDetailID, String mainImg, int quantity, int savingPoint, int cost, String message, char kitYN) {
		super();
		this.orderNo = orderNo;
		this.itmeId = itmeId;
		this.itemName = itemName;
		this.itemOptionName = itemOptionName;
		this.itemDetailID = itemDetailID;
		this.mainImg = mainImg;
		this.quantity = quantity;
		this.savingPoint = savingPoint;
		this.cost = cost;
		this.message = message;
		this.kitYN = kitYN;
	}





	public String getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}


	public String getItmeId() {
		return itmeId;
	}


	public void setItmeId(String itmeId) {
		this.itmeId = itmeId;
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





	public String getItemDetailID() {
		return itemDetailID;
	}


	public void setItemDetailID(String itemDetailID) {
		this.itemDetailID = itemDetailID;
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


	public int getSavingPoint() {
		return savingPoint;
	}


	public void setSavingPoint(int savingPoint) {
		this.savingPoint = savingPoint;
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


	public char getKitYN() {
		return kitYN;
	}


	public void setKitYN(char kitYN) {
		this.kitYN = kitYN;
	}
	
	@Override
	public String toString(){
		return this.orderNo + ", " + this.itmeId + ", " + this.itemName + ", " + this.itemOptionName
				 + ", " + this.itemDetailID + ", " + this.mainImg + ", " + this.quantity
				 + ", " + this.savingPoint + ", " + this.cost + ", " + this.message + ", " + this.kitYN;
	}
	

	
}
