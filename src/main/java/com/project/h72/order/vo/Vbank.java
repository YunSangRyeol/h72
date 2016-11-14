package com.project.h72.order.vo;

public class Vbank {
	private String orderNo;
	private String bank;
	private String accountNum;
	private String name;
	
	public Vbank(){}
	
	public Vbank(String orderNo, String bank, String accountNum, String name) {
		super();
		this.orderNo = orderNo;
		this.bank = bank;
		this.accountNum = accountNum;
		this.name = name;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString(){
		return this.orderNo+", "+this.bank+", "+this.accountNum+", "+this.name;
	}
	
}
