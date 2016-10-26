package com.project.h72.member.vo;

import java.sql.Date;

public class Member {
	private String userid;
	private String levelcode;
	private String userpass;
	private String nickname;
	private Date birthdate;
	private String eamil;
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
	public Member(String nickname, Date birthdate) {
		super();
		this.nickname = nickname;
		this.birthdate = birthdate;
	}
	// 비밀번호 찾기

	public Member(String userid, String nickname, String eamil) {
		super();
		this.userid = userid;
		this.nickname = nickname;
		this.eamil = eamil;
	}

	// 개인정보 변경
	public Member(String userpass, String eamil, String phone, String postnum, String address, String addressDetail) {
		super();
		this.userpass = userpass;
		this.eamil = eamil;
		this.phone = phone;
		this.postnum = postnum;
		this.address = address;
		this.addressdetail = addressDetail;
	}

	// 회원가입
	public Member(String userid, String userpass, String nickname, Date birthdate, String eamil, String phone,
			String postnum, String address, String addressDetail) {
		super();
		this.userid = userid;
		this.userpass = userpass;
		this.nickname = nickname;
		this.birthdate = birthdate;
		this.eamil = eamil;
		this.phone = phone;
		this.postnum = postnum;
		this.address = address;
		this.addressdetail = addressDetail;
	}

	public Member(String userid, String levelcode, String userpass, String nickname, Date birthdate, String eamil,
			String phone, String postnum, String address, String addressDetail, int point, Date enrollDate,
			int totalprice) {
		super();
		this.userid = userid;
		this.levelcode = levelcode;
		this.userpass = userpass;
		this.nickname = nickname;
		this.birthdate = birthdate;
		this.eamil = eamil;
		this.phone = phone;
		this.postnum = postnum;
		this.address = address;
		this.addressdetail = addressDetail;
		this.point = point;
		this.enrolldate = enrollDate;
		this.totalprice = totalprice;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
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
		return "Member [userid=" + userid + ", levelcode=" + levelcode + ", userpass=" + userpass + ", nickname="
				+ nickname + ", birthdate=" + birthdate + ", eamil=" + eamil + ", phone=" + phone + ", postnum="
				+ postnum + ", address=" + address + ", addressDetail=" + addressdetail + ", point=" + point
				+ ", enrollDate=" + enrolldate + ", totalprice=" + totalprice + "]";
	}
}