package com.project.h72.detail.vo;

import java.io.Serializable;

public class DetailDIVO implements Serializable{
	
	private String ITEM_ID;
	private String ITEM_NAME;
	private String ITEM_OPTION_NAME;
	private String ITEM_DETAIL_ID;
	private int PRICE;
	private int SAIL_PRICE;
	private int STOCK;
	private String MAIN_IMG;
	private String DETAIL_IMG01;
	private String DETAIL_IMG02;
	private String ETC;
	
	
	@Override
	public String toString(){
		return ITEM_ID + ", " + ITEM_NAME + ", " + ITEM_OPTION_NAME  + ", " + ITEM_DETAIL_ID  
				+ ", " + PRICE  + ", " + SAIL_PRICE  + ", " + STOCK  + ", " + MAIN_IMG  + ", " 
				+ DETAIL_IMG01  + ", " + DETAIL_IMG02  + ", " + ETC;
	}
	
	public DetailDIVO(){}

	public DetailDIVO(String iTEM_ID, String iTEM_NAME, String iTEM_OPTION_NAME, String iTEM_DETAIL_ID, int pRICE,
			int sAIL_PRICE, int sTOCK, String mAIN_IMG, String dETAIL_IMG01, String dETAIL_IMG02, String eTC) {
		super();
		ITEM_ID = iTEM_ID;
		ITEM_NAME = iTEM_NAME;
		ITEM_OPTION_NAME = iTEM_OPTION_NAME;
		ITEM_DETAIL_ID = iTEM_DETAIL_ID;
		PRICE = pRICE;
		SAIL_PRICE = sAIL_PRICE;
		STOCK = sTOCK;
		MAIN_IMG = mAIN_IMG;
		DETAIL_IMG01 = dETAIL_IMG01;
		DETAIL_IMG02 = dETAIL_IMG02;
		ETC = eTC;
	}

	public String getITEM_ID() {
		return ITEM_ID;
	}

	public void setITEM_ID(String iTEM_ID) {
		ITEM_ID = iTEM_ID;
	}

	public String getITEM_NAME() {
		return ITEM_NAME;
	}

	public void setITEM_NAME(String iTEM_NAME) {
		ITEM_NAME = iTEM_NAME;
	}

	public String getITEM_OPTION_NAME() {
		return ITEM_OPTION_NAME;
	}

	public void setITEM_OPTION_NAME(String iTEM_OPTION_NAME) {
		ITEM_OPTION_NAME = iTEM_OPTION_NAME;
	}

	public String getITEM_DETAIL_ID() {
		return ITEM_DETAIL_ID;
	}

	public void setITEM_DETAIL_ID(String iTEM_DETAIL_ID) {
		ITEM_DETAIL_ID = iTEM_DETAIL_ID;
	}

	public int getPRICE() {
		return PRICE;
	}

	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}

	public int getSAIL_PRICE() {
		return SAIL_PRICE;
	}

	public void setSAIL_PRICE(int sAIL_PRICE) {
		SAIL_PRICE = sAIL_PRICE;
	}

	public int getSTOCK() {
		return STOCK;
	}

	public void setSTOCK(int sTOCK) {
		STOCK = sTOCK;
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
