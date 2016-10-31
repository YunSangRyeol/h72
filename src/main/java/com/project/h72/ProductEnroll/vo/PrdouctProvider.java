package com.project.h72.ProductEnroll.vo;

@SuppressWarnings("serial")
public class PrdouctProvider implements java.io.Serializable{
	private String providerCode;
	private String providerName;
	private String pStepname;
	private String pPhone;
	private String pTell;
	private String pAderess;
	private String etc;
	
	
	public PrdouctProvider() {}


	public String getProviderCode() {
		return providerCode;
	}


	public void setProviderCode(String providerCode) {
		this.providerCode = providerCode;
	}


	public String getProviderName() {
		return providerName;
	}


	public void setProviderName(String providerName) {
		this.providerName = providerName;
	}


	public String getpStepname() {
		return pStepname;
	}


	public void setpStepname(String pStepname) {
		this.pStepname = pStepname;
	}


	public String getpPhone() {
		return pPhone;
	}


	public void setpPhone(String pPhone) {
		this.pPhone = pPhone;
	}


	public String getpTell() {
		return pTell;
	}


	public void setpTell(String pTell) {
		this.pTell = pTell;
	}


	public String getpAderess() {
		return pAderess;
	}


	public void setpAderess(String pAderess) {
		this.pAderess = pAderess;
	}


	public String getEtc() {
		return etc;
	}


	public void setEtc(String etc) {
		this.etc = etc;
	}


	@Override
	public String toString() {
		return "PrdouctProvider [providerCode=" + providerCode + ", providerName=" + providerName + ", pStepname="
				+ pStepname + ", pPhone=" + pPhone + ", pTell=" + pTell + ", pAderess=" + pAderess + ", etc=" + etc
				+ "]";
	}
	
	

}
