package com.project.h72.ProductEnroll.vo;

@SuppressWarnings("serial")
public class Product implements java.io.Serializable{
	private String categoryCode;
	private String providerCode;
	private String itemDetailId;
	private String itemId;

	private String categoryName;
	private String itemStatus;
	private String itemName;
	private String minPrice;
	private String minSailPrice;
	private String mainImg;
	private String detailImg01;
	private String detailImg02;
	private String etc;
	private String itemOptionName;
	private String cost;
	private String price;
	private String sailPrice;
	private String stock;
	
	public Product() {}
	
	
	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getProviderCode() {
		return providerCode;
	}

	public void setProviderCode(String providerCode) {
		this.providerCode = providerCode;
	}

	public String getItemDetailId() {
		return itemDetailId;
	}

	public void setItemDetailId(String itemDetailId) {
		this.itemDetailId = itemDetailId;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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

	public String getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(String minPrice) {
		this.minPrice = minPrice;
	}

	public String getMinSailPrice() {
		return minSailPrice;
	}

	public void setMinSailPrice(String minSailPrice) {
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

	public String getItemOptionName() {
		return itemOptionName;
	}

	public void setItemOptionName(String itemOptionName) {
		this.itemOptionName = itemOptionName;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getSailPrice() {
		return sailPrice;
	}

	public void setSailPrice(String sailPrice) {
		this.sailPrice = sailPrice;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	@Override
	public String toString() {
		return "Product [categoryCode=" + categoryCode + ", providerCode=" + providerCode + ", itemDetailId="
				+ itemDetailId + ", itemId=" + itemId + ", categoryName=" + categoryName + ", itemStatus=" + itemStatus
				+ ", itemName=" + itemName + ", minPrice=" + minPrice + ", minSailPrice=" + minSailPrice + ", mainImg="
				+ mainImg + ", detailImg01=" + detailImg01 + ", detailImg02=" + detailImg02 + ", etc=" + etc
				+ ", itemOptionName=" + itemOptionName + ", cost=" + cost + ", price=" + price + ", sailPrice="
				+ sailPrice + ", stock=" + stock + "]";
	}
	
	
}
