package com.project.h72.cart.vo;

import java.sql.Date;

public class Cart {
	private String cartid; 
	private String itemid;
	private String userid;
	private String itemFullName;
	private String itemDetailid;
	private String mainImg;
	private int quantity;
	private int cost;
	private String message;
	private char KitYN;
	private Date enrollDate;
	private String itemOptionName;
	/*CART_id 카트 아이디
	ITEM_id 상품 아이디
	USER_id 유저 아이디
	ITEM_FULL_NAME 상품 전체 이름
	ITEM_DETAIL_id 상품 설명 아이디
	MAIN_IMG 썸네일
	QUANTITY 상품 갯수
	COST 상품 가격
	MESSAGE 구매시 요청사항
	KIT_YN KIT 여부
	ENROLL_DATE 등록 날짜*/
	
	public Cart(){
		super();
	}
	
	

	public Cart(String cartid, String itemid, String userid, String itemFullName, String itemDetailid, String mainImg,
			int quantity, int cost, String message, char kitYN, Date enrollDate,String itemOptionName) {
		super();
		this.cartid = cartid;
		this.itemid = itemid;
		this.userid = userid;
		this.itemFullName = itemFullName;
		this.itemDetailid = itemDetailid;
		this.mainImg = mainImg;
		this.quantity = quantity;
		this.cost = cost;
		this.message = message;
		this.KitYN = kitYN;
		this.enrollDate = enrollDate;
		this.itemOptionName=itemOptionName;
	}



	public String getCartid() {
		return cartid;
	}

	public void setCartid(String cartid) {
		this.cartid = cartid;
	}

	public String getItemid() {
		return itemid;
	}

	public void setItemid(String itemid) {
		this.itemid = itemid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getItemFullName() {
		return itemFullName;
	}

	public void setItemFullName(String itemFullName) {
		this.itemFullName = itemFullName;
	}
	
	public String getItemDetailid() {
		return itemDetailid;
	}

	public void setItemDetailid(String itemDetailid) {
		this.itemDetailid = itemDetailid;
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

	public char getKitYN() {
		return KitYN;
	}

	public void setKitYN(char kitYN) {
		KitYN = kitYN;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	
	
	public String getItemOptionName() {
		return itemOptionName;
	}



	public void setItemOptionName(String itemOptionName) {
		this.itemOptionName = itemOptionName;
	}



	@Override
	public String toString(){
		return cartid+", "+itemid+", "+userid+", "+itemFullName+", "+itemDetailid+", "+mainImg+", "+
				quantity+", "+cost+", "+ message+", "+String.valueOf(KitYN)+", "+enrollDate+", "+itemOptionName;
	}
	
	
	
	
	

}
