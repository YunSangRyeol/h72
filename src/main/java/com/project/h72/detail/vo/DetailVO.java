package com.project.h72.detail.vo;

import java.io.Serializable;

public class DetailVO implements Serializable{
	/*
	private String ITEM_ID; //상품 아이디
	private String ITEM_NAME; //상품 이름
	private String ITEM_DETAIL_ID; //상품 설명 아이디
	private String ITEM_OPTION_NAME; //옵션이름
	private int PRICE; //판매가
	private int SAIL_PRICE; //할인가
	private int STOCK; //재교수량
	private String MAIN_IMG; //썸네일
	private String DETAIL_IMG01; //상세이미지01
	private String DETAIL_IMG02; //상세이미지02
	private String ETC; //비고
	*/	
	
	private String ITEM_DETAIL_ID; //상품 아이디
	private String CATEGORY_CODE; //상품 콛
	private String ITEM_STATUS; //상품 상태
	private String ITEM_NAME; //상품 이름
	private String MIN_PRICE; //최저가
	private String MIN_SAIL_PRICE; //최저 판매가
	private String MAIN_IMG; //메인 이미지
	private String DETAIL_IMG01; //세부 이미지1
	private String DETAIL_IMG02; //세부 이미지2
	private String ETC; //비고
	
	
	@Override
	public String toString(){
		return ITEM_DETAIL_ID + ", " + CATEGORY_CODE + ", " + ITEM_STATUS + ", " + ITEM_NAME + ", " + MIN_PRICE + ", " + MIN_SAIL_PRICE + ", " + MAIN_IMG + ", " + DETAIL_IMG01 + ", " + DETAIL_IMG02 + ", " + ETC;
	}
	public DetailVO() {
		super();
	}

	public DetailVO(String iTEM_DETAIL_ID, String cATEGORY_CODE, String iTEM_STATUS, String iTEM_NAME, String mIN_PRICE,
			String mIN_SAIL_PRICE, String mAIN_IMG, String dETAIL_IMG01, String dETAIL_IMG02, String eTC) {
		super();
		ITEM_DETAIL_ID = iTEM_DETAIL_ID;
		CATEGORY_CODE = cATEGORY_CODE;
		ITEM_STATUS = iTEM_STATUS;
		ITEM_NAME = iTEM_NAME;
		MIN_PRICE = mIN_PRICE;
		MIN_SAIL_PRICE = mIN_SAIL_PRICE;
		MAIN_IMG = mAIN_IMG;
		DETAIL_IMG01 = dETAIL_IMG01;
		DETAIL_IMG02 = dETAIL_IMG02;
		ETC = eTC;
	}

	public String getITEM_DETAIL_ID() {
		return ITEM_DETAIL_ID;
	}

	public void setITEM_DETAIL_ID(String iTEM_DETAIL_ID) {
		ITEM_DETAIL_ID = iTEM_DETAIL_ID;
	}

	public String getCATEGORY_CODE() {
		return CATEGORY_CODE;
	}

	public void setCATEGORY_CODE(String cATEGORY_CODE) {
		CATEGORY_CODE = cATEGORY_CODE;
	}

	public String getITEM_STATUS() {
		return ITEM_STATUS;
	}

	public void setITEM_STATUS(String iTEM_STATUS) {
		ITEM_STATUS = iTEM_STATUS;
	}

	public String getITEM_NAME() {
		return ITEM_NAME;
	}

	public void setITEM_NAME(String iTEM_NAME) {
		ITEM_NAME = iTEM_NAME;
	}

	public String getMIN_PRICE() {
		return MIN_PRICE;
	}

	public void setMIN_PRICE(String mIN_PRICE) {
		MIN_PRICE = mIN_PRICE;
	}

	public String getMIN_SAIL_PRICE() {
		return MIN_SAIL_PRICE;
	}

	public void setMIN_SAIL_PRICE(String mIN_SAIL_PRICE) {
		MIN_SAIL_PRICE = mIN_SAIL_PRICE;
	}

	public String getMAIN_IMG() {
		return MAIN_IMG;
	}

	public void setMAIN_IMG(String mAIN_IMG) {
		MAIN_IMG = mAIN_IMG;
	}

	public String getDETAIL_IMG01() {
		return DETAIL_IMG01;
	}

	public void setDETAIL_IMG01(String dETAIL_IMG01) {
		DETAIL_IMG01 = dETAIL_IMG01;
	}

	public String getDETAIL_IMG02() {
		return DETAIL_IMG02;
	}

	public void setDETAIL_IMG02(String dETAIL_IMG02) {
		DETAIL_IMG02 = dETAIL_IMG02;
	}

	public String getETC() {
		return ETC;
	}

	public void setETC(String eTC) {
		ETC = eTC;
	}

		
	
	
}
