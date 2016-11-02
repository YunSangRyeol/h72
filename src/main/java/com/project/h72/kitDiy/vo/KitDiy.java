package com.project.h72.kitDiy.vo;

public class KitDiy{
	private String itemId;
	private String itemFullName;
	private String itemDetailId;
	private int price;
	private int sailPrice;
	private int stock;
	private String mainImg;
	private String detailImg01;
	private String detailImg02;
	private String etc;
	
	private String categoryCode;
	private String itemStatus;
	private int minPrice;
	private int minSailPrice;
	private String itemName;
	
	public KitDiy() {
		
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSailPrice() {
		return sailPrice;
	}

	public void setSailPrice(int sailPrice) {
		this.sailPrice = sailPrice;
	}

	public int getStock() {
		return stock;
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

	public void setStock(int stock) {
		this.stock = stock;
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

	public String getDetailImg01() {
		return detailImg01;
	}

	public void setDetailImg01(String detailImg01) {
		this.detailImg01 = detailImg01;
	}

	public String getDetailImg02() {
		return detailImg02;
	}

	public void setDetailImg02(String detailImg02) {
		this.detailImg02 = detailImg02;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
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


	@Override
	public String toString() {
		return "KitDiy [itemId=" + itemId + ", itemFullName=" + itemFullName + ", itemDetailId=" + itemDetailId
				+ ", price=" + price + ", sailPrice=" + sailPrice + ", stock=" + stock + ", mainImg=" + mainImg
				+ ", detailImg01=" + detailImg01 + ", detailImg02=" + detailImg02 + ", etc=" + etc + ", categoryCode="
				+ categoryCode + ", itemStatus=" + itemStatus + ", minPrice=" + minPrice + ", minSailPrice="
				+ minSailPrice + ", itemName=" + itemName + "]";
	}

	
}
