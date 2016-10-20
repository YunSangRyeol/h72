package com.project.h72.kitDiy.vo;

public class KitDiy{
	private String ITEM_DETAIL_ID;
	private String CATEGORY_CODE ;
	private String ITEM_STATUS ;
	private String ITEM_NAME;
	private int MIN_PRICE;
	private int MIN_SAIL_PRICE;
	private String MAIN_IMG;
	private String DETAIL_IMG01;
	private String DETAIL_IMG02;
	private String ETC;
	
	public KitDiy() {
		
	}
	public KitDiy(String iTEM_DETAIL_ID, String cATEGORY_CODE, String iTEM_STATUS, String iTEM_NAME, int mIN_PRICE,
			int mIN_SAIL_PRICE, String mAIN_IMG, String dETAIL_IMG01, String dETAIL_IMG02, String eTC) {
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
	public int getMIN_PRICE() {
		return MIN_PRICE;
	}
	public void setMIN_PRICE(int mIN_PRICE) {
		MIN_PRICE = mIN_PRICE;
	}
	public int getMIN_SAIL_PRICE() {
		return MIN_SAIL_PRICE;
	}
	public void setMIN_SAIL_PRICE(int mIN_SAIL_PRICE) {
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
	@Override
	public String toString() {
		return "KitDiy [ITEM_DETAIL_ID=" + ITEM_DETAIL_ID + ", CATEGORY_CODE=" + CATEGORY_CODE + ", ITEM_STATUS="
				+ ITEM_STATUS + ", ITEM_NAME=" + ITEM_NAME + ", MIN_PRICE=" + MIN_PRICE + ", MIN_SAIL_PRICE="
				+ MIN_SAIL_PRICE + ", MAIN_IMG=" + MAIN_IMG + ", DETAIL_IMG01=" + DETAIL_IMG01 + ", DETAIL_IMG02="
				+ DETAIL_IMG02 + ", ETC=" + ETC + "]";
	}
	
	
}
