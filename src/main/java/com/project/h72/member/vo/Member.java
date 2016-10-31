package com.project.h72.member.vo;

import java.sql.Date;

public class Member {
	private String userid;
	private String levelcode;
	private String userpass;
	private String name;
	private Date birthdate;
	private String email;
	private String phone;
	private String postnum;
	private String address;
	private String addressdetail;
	private int point;
	private Date enrolldate;
	private int totalprice;

	public Member() {
		super();
	}

	// 로그인
	public Member(String userid, String userpass) {
		super();
		this.userid = userid;
		this.userpass = userpass;
	}

	// 아이디찾기
	public Member(String name, Date birthdate) {
		super();
		this.name = name;
		this.birthdate = birthdate;
	}
	// 비밀번호 찾기

	public Member(String userid, String name, String email) {
		super();
		this.userid = userid;
		this.name = name;
		this.email = email;
	}

	// 개인정보 변경
	public Member(String userpass, String email, String phone, String postnum, String address, String addressDetail) {
		super();
		this.userpass = userpass;
		this.email = email;
		this.phone = phone;
		this.postnum = postnum;
		this.address = address;
		this.addressdetail = addressDetail;
	}

	// 회원가입
	public Member(String userid, String userpass, String name, Date birthdate, String email, String phone,
			String postnum, String address, String addressDetail) {
		super();
		this.userid = userid;
		this.userpass = userpass;
		this.name = name;
		this.birthdate = birthdate;
		this.email = email;
		this.phone = phone;
		this.postnum = postnum;
		this.address = address;
		this.addressdetail = addressDetail;
	}

	public Member(String userid, String levelcode, String userpass, String name, Date birthdate, String email,
			String phone, String postnum, String address, String addressDetail, int point, Date enrollDate,
			int totalprice) {
		super();
		this.userid = userid;
		this.levelcode = levelcode;
		this.userpass = userpass;
		this.name = name;
		this.birthdate = birthdate;
		this.email = email;
		this.phone = phone;
		this.postnum = postnum;
		this.address = address;
		this.addressdetail = addressDetail;
		this.point = point;
		this.enrolldate = enrollDate;
		this.totalprice = totalprice;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getLevelcode() {
		return levelcode;
	}

	public void setLevelcode(String levelcode) {
		this.levelcode = levelcode;
	}

	public String getUserpass() {
		return userpass;
	}

	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public String getemail() {
		return email;
	}

	public void setemail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPostnum() {
		return postnum;
	}

	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressdetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressdetail = addressDetail;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getEnrollDate() {
		return enrolldate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrolldate = enrollDate;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	@Override
	public String toString() {
		return "Member [userid=" + userid + ", levelcode=" + levelcode + ", userpass=" + userpass + ", name="
				+ name + ", birthdate=" + birthdate + ", email=" + email + ", phone=" + phone + ", postnum="
				+ postnum + ", address=" + address + ", addressDetail=" + addressdetail + ", point=" + point
				+ ", enrollDate=" + enrolldate + ", totalprice=" + totalprice + "]";
	}
}