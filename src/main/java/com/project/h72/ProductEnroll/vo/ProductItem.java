package com.project.h72.ProductEnroll.vo;

@SuppressWarnings("serial")
public class ProductItem implements java.io.Serializable{
	private String itemId ;
	private String itemName;
	private String providerCode;
	private String itemDetailId;
	private String itemOptionName;
	private int cost;
	private int price ;
	private int sailPrice ;
	private int stock;
	private String etc;
	private String mainImg;
	private String detailImg01;
	private String detailImg02;
	
	
	public ProductItem() {}
	
	public ProductItem(String itemId, String providerCode, String itemDetailId, String itemOptionName, int cost,
			int price, int sailPrice, int stock) {
		super();
		this.itemId = itemId;
		this.providerCode = providerCode;
		this.itemDetailId = itemDetailId;
		this.itemOptionName = itemOptionName;
		this.cost = cost;
		this.price = price;
		this.sailPrice = sailPrice;
		this.stock = stock;
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
	public String getItemOptionName() {
		return itemOptionName;
	}
	public void setItemOptionName(String itemOptionName) {
		this.itemOptionName = itemOptionName;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
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
	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
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

	@Override
	public String toString() {
		return "ProductItem [itemId=" + itemId + ", itemName=" + itemName + ", providerCode=" + providerCode
				+ ", itemDetailId=" + itemDetailId + ", itemOptionName=" + itemOptionName + ", cost=" + cost
				+ ", price=" + price + ", sailPrice=" + sailPrice + ", stock=" + stock + ", etc=" + etc + ", mainImg="
				+ mainImg + ", detailImg01=" + detailImg01 + ", detailImg02=" + detailImg02 + "]";
	}


}
