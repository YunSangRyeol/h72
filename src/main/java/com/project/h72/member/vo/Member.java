package com.project.h72.member.vo;

import java.sql.Date;

public class Member {
	private String userId;
	private String levelCode;
	private String userPass;
	private String nickName;
	private Date birthDate;
	private String eamil;
	private String phone;
	private String postNum;
	private String address;
	private String addressDetail;
	private int point;
	private Date enrollDate;
	private int totalPrice;

	public Member() {
		super();
	}

	// 로그인
	public Member(String userid, String userpass) {
		super();
		this.userId = userid;
		this.userPass = userpass;
	}

	// 아이디찾기
	public Member(String nickname, Date birthdate) {
		super();
		this.nickName = nickname;
		this.birthDate = birthdate;
	}
	// 비밀번호 찾기

	public Member(String userid, String nickname, String eamil) {
		super();
		this.userId = userid;
		this.nickName = nickname;
		this.eamil = eamil;
	}

	// 개인정보 변경
	public Member(String userpass, String eamil, String phone, String postnum, String address, String addressDetail) {
		super();
		this.userPass = userpass;
		this.eamil = eamil;
		this.phone = phone;
		this.postNum = postnum;
		this.address = address;
		this.addressDetail = addressDetail;
	}

	// 회원가입
	public Member(String userid, String userpass, String nickname, Date birthdate, String eamil, String phone,
			String postnum, String address, String addressDetail) {
		super();
		this.userId = userid;
		this.userPass = userpass;
		this.nickName = nickname;
		this.birthDate = birthdate;
		this.eamil = eamil;
		this.phone = phone;
		this.postNum = postnum;
		this.address = address;
		this.addressDetail = addressDetail;
	}

	public Member(String userid, String levelcode, String userpass, String nickname, Date birthdate, String eamil,
			String phone, String postnum, String address, String addressDetail, int point, Date enrollDate,
			int totalprice) {
		super();
		this.userId = userid;
		this.levelCode = levelcode;
		this.userPass = userpass;
		this.nickName = nickname;
		this.birthDate = birthdate;
		this.eamil = eamil;
		this.phone = phone;
		this.postNum = postnum;
		this.address = address;
		this.addressDetail = addressDetail;
		this.point = point;
		this.enrollDate = enrollDate;
		this.totalPrice = totalprice;
	}

	public String getUserid() {
		return userId;
	}

	public void setUserid(String userid) {
		this.userId = userid;
	}

	public String getLevelcode() {
		return levelCode;
	}

	public void setLevelcode(String levelcode) {
		this.levelCode = levelcode;
	}

	public String getUserpass() {
		return userPass;
	}

	public void setUserpass(String userpass) {
		this.userPass = userpass;
	}

	public String getNickname() {
		return nickName;
	}

	public void setNickname(String nickname) {
		this.nickName = nickname;
	}

	public Date getBirthdate() {
		return birthDate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthDate = birthdate;
	}

	public String getEamil() {
		return eamil;
	}

	public void setEamil(String eamil) {
		this.eamil = eamil;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPostnum() {
		return postNum;
	}

	public void setPostnum(String postnum) {
		this.postNum = postnum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getTotalprice() {
		return totalPrice;
	}

	public void setTotalprice(int totalprice) {
		this.totalPrice = totalprice;
	}

	@Override
	public String toString() {
		return "Member [userid=" + userId + ", levelcode=" + levelCode + ", userpass=" + userPass + ", nickname="
				+ nickName + ", birthdate=" + birthDate + ", eamil=" + eamil + ", phone=" + phone + ", postnum="
				+ postNum + ", address=" + address + ", addressDetail=" + addressDetail + ", point=" + point
				+ ", enrollDate=" + enrollDate + ", totalprice=" + totalPrice + "]";
	}
}