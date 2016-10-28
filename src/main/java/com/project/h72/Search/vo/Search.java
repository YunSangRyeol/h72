package com.project.h72.Search.vo;

public class Search {
	private String itemDetailId;
	private String categoryCode;
	private String itemStatus;
	private String itemName;
	private int minPrice;
	private int minSailPrice;
	private String mainImg;
	private String detailImg1;
	private String detailImg2;
	private String etc;
	
	public Search() {
		super();
	}
	public Search(String itemName, int minPrice, int minSailPrice, String mainImg) {
		super();
		this.itemName = itemName;
		this.minPrice = minPrice;
		this.minSailPrice = minSailPrice;
		this.mainImg = mainImg;
	}
	public Search(String itemDetailId, String categoryCode, String itemStatus, String itemName, int minPrice,
			int minSailPrice, String mainImg, String detailImg1, String detailImg2, String etc) {
		super();
		this.itemDetailId = itemDetailId;
		this.categoryCode = categoryCode;
		this.itemStatus = itemStatus;
		this.itemName = itemName;
		this.minPrice = minPrice;
		this.minSailPrice = minSailPrice;
		this.mainImg = mainImg;
		this.detailImg1 = detailImg1;
		this.detailImg2 = detailImg2;
		this.etc = etc;
	}
	public String getItemDetailId() {
		return itemDetailId;
	}
	public void setItemDetailId(String itemDetailId) {
		this.itemDetailId = itemDetailId;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getItemStatus() {
		return itemStatus;
	}
	public void setItemStatus(String itemStatus) {
		this.itemStatus = itemStatus;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
	public int getMinSailPrice() {
		return minSailPrice;
	}
	public void setMinSailPrice(int minSailPrice) {
		this.minSailPrice = minSailPrice;
	}
	public String getMainImg() {
		return mainImg;
	}
	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}
	public String getDetailImg1() {
		return detailImg1;
	}
	public void setDetailImg1(String detailImg1) {
		this.detailImg1 = detailImg1;
	}
	public String getDetailImg2() {
		return detailImg2;
	}
	public void setDetailImg2(String detailImg2) {
		this.detailImg2 = detailImg2;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	@Override
	public String toString() {
		return "Search [itemDetailId=" + itemDetailId + ", categoryCode=" + categoryCode + ", itemStatus=" + itemStatus
				+ ", itemName=" + itemName + ", minPrice=" + minPrice + ", minSailPrice=" + minSailPrice + ", mainImg="
				+ mainImg + ", detailImg1=" + detailImg1 + ", detailImg2=" + detailImg2 + ", etc=" + etc + "]";
	}
	
	
}