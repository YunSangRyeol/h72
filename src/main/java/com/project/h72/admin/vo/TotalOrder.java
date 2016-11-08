package com.project.h72.admin.vo;

public class TotalOrder {

	private int orderCount;
	private int totalQuantity;
	private int totalKind;
	private int totalPrice;
	
	private int bag;
	private int protect;
	private int food;
	private int tool;
	private int etc;
	
	private int kitYES;
	private int kitNO;

	

	public TotalOrder() {
		super();
	}

	

	public TotalOrder(int orderCount, int totalQuantity, int totalKind, int totalPrice) {
		super();
		this.orderCount = orderCount;
		this.totalQuantity = totalQuantity;
		this.totalKind = totalKind;
		this.totalPrice = totalPrice;
	}
	
	
	


	public TotalOrder(int bag, int protect, int food, int tool, int etc) {
		super();
		this.bag = bag;
		this.protect = protect;
		this.food = food;
		this.tool = tool;
		this.etc = etc;
	}


	
	

	public TotalOrder(int kitYES, int kitNO) {
		super();
		this.kitYES = kitYES;
		this.kitNO = kitNO;
	}


	

	public TotalOrder(int orderCount, int totalQuantity, int totalKind, int totalPrice, int bag, int protect, int food,
			int tool, int etc, int kitYES, int kitNO) {
		super();
		this.orderCount = orderCount;
		this.totalQuantity = totalQuantity;
		this.totalKind = totalKind;
		this.totalPrice = totalPrice;
		this.bag = bag;
		this.protect = protect;
		this.food = food;
		this.tool = tool;
		this.etc = etc;
		this.kitYES = kitYES;
		this.kitNO = kitNO;
	}


	
	

	public int getOrderCount() {
		return orderCount;
	}



	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}



	public int getTotalQuantity() {
		return totalQuantity;
	}



	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}



	public int getTotalKind() {
		return totalKind;
	}



	public void setTotalKind(int totalKind) {
		this.totalKind = totalKind;
	}



	public int getTotalPrice() {
		return totalPrice;
	}



	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}



	public int getBag() {
		return bag;
	}



	public void setBag(int bag) {
		this.bag = bag;
	}



	public int getProtect() {
		return protect;
	}



	public void setProtect(int protect) {
		this.protect = protect;
	}



	public int getFood() {
		return food;
	}



	public void setFood(int food) {
		this.food = food;
	}



	public int getTool() {
		return tool;
	}



	public void setTool(int tool) {
		this.tool = tool;
	}



	public int getEtc() {
		return etc;
	}



	public void setEtc(int etc) {
		this.etc = etc;
	}



	public int getKitYES() {
		return kitYES;
	}



	public void setKitYES(int kitYES) {
		this.kitYES = kitYES;
	}



	public int getKitNO() {
		return kitNO;
	}



	public void setKitNO(int kitNO) {
		this.kitNO = kitNO;
	}



	@Override
	public String toString(){
		return this.orderCount + " , " + this.totalKind + " , " + this.totalQuantity + " , " + this.totalPrice
				+ ", " + this.bag + ", " + this.protect+ ", " + this.food+ ", " + this.tool+ ", " + this.etc
				+ ", " + this.kitYES+ ", " + this.kitNO;
	}
	
}
