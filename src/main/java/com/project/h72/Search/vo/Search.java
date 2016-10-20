package com.project.h72.Search.vo;

public class Search {
	private String itemId;
	private String providerCode;
	private String itemDetailCode;
	private String itemOptionName;
	private int cost;
	private int price;
	private int sailPrice;
	private int stock;

	public Search() {
		super();
	}
	//조회결과 상품정보
	public Search(String itemOptionName, int price, int sailPrice) {
		super();
		this.itemOptionName = itemOptionName;
		this.price = price;
		this.sailPrice = sailPrice;
	}

	public Search(String itemId, String providerCode, String itemDetailCode, String itemOptionName, int cost, int price,
			int sailPrice, int stock) {
		super();
		this.itemId = itemId;
		this.providerCode = providerCode;
		this.itemDetailCode = itemDetailCode;
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

	public String getProviderCode() {
		return providerCode;
	}

	public void setProviderCode(String providerCode) {
		this.providerCode = providerCode;
	}

	public String getItemDetailCode() {
		return itemDetailCode;
	}

	public void setItemDetailCode(String itemDetailCode) {
		this.itemDetailCode = itemDetailCode;
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

	@Override
	public String toString() {
		return "Search [itemId=" + itemId + ", providerCode=" + providerCode + ", itemDetailCode=" + itemDetailCode
				+ ", itemOptionName=" + itemOptionName + ", cost=" + cost + ", price=" + price + ", sailPrice="
				+ sailPrice + ", stock=" + stock + "]";
	}

}
