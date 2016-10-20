package com.project.h72.detail.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable {
	private String REVIEW_ID; //리뷰 아이디
	private String ITEM_DETAIL_ID; //상품 디테일 아이디
	private String R_WRITER; //작성자
	private String R_CONTENTS; //내용
	private Date R_DATE; //작성일
	private String R_IMG01; //이미지1
	private String R_IMG02; //이미지2
	private String R_IMG03; //이미지3
	private String R_IMG04; //이미지4
	private String R_IMG05; //이미지5
	
	public Review() {
		super();
	}

	public Review(String iTEM_DETAIL_ID, String r_WRITER, String r_CONTENTS) {
		super();
		ITEM_DETAIL_ID = iTEM_DETAIL_ID;
		R_WRITER = r_WRITER;
		R_CONTENTS = r_CONTENTS;
	}

	public Review(String iTEM_DETAIL_ID, String r_WRITER, String r_CONTENTS, String r_IMG01) {
		super();
		ITEM_DETAIL_ID = iTEM_DETAIL_ID;
		R_WRITER = r_WRITER;
		R_CONTENTS = r_CONTENTS;
		R_IMG01 = r_IMG01;
	}

	public Review(String iTEM_DETAIL_ID, String r_WRITER, String r_CONTENTS, String r_IMG01, String r_IMG02) {
		super();
		ITEM_DETAIL_ID = iTEM_DETAIL_ID;
		R_WRITER = r_WRITER;
		R_CONTENTS = r_CONTENTS;
		R_IMG01 = r_IMG01;
		R_IMG02 = r_IMG02;
	}

	public Review(String iTEM_DETAIL_ID, String r_WRITER, String r_CONTENTS, String r_IMG01, String r_IMG02,
			String r_IMG03) {
		super();
		ITEM_DETAIL_ID = iTEM_DETAIL_ID;
		R_WRITER = r_WRITER;
		R_CONTENTS = r_CONTENTS;
		R_IMG01 = r_IMG01;
		R_IMG02 = r_IMG02;
		R_IMG03 = r_IMG03;
	}

	public Review(String iTEM_DETAIL_ID, String r_WRITER, String r_CONTENTS, String r_IMG01, String r_IMG02,
			String r_IMG03, String r_IMG04) {
		super();
		ITEM_DETAIL_ID = iTEM_DETAIL_ID;
		R_WRITER = r_WRITER;
		R_CONTENTS = r_CONTENTS;
		R_IMG01 = r_IMG01;
		R_IMG02 = r_IMG02;
		R_IMG03 = r_IMG03;
		R_IMG04 = r_IMG04;
	}

	public Review(String iTEM_DETAIL_ID, String r_WRITER, String r_CONTENTS, String r_IMG01, String r_IMG02,
			String r_IMG03, String r_IMG04, String r_IMG05) {
		super();
		ITEM_DETAIL_ID = iTEM_DETAIL_ID;
		R_WRITER = r_WRITER;
		R_CONTENTS = r_CONTENTS;
		R_IMG01 = r_IMG01;
		R_IMG02 = r_IMG02;
		R_IMG03 = r_IMG03;
		R_IMG04 = r_IMG04;
		R_IMG05 = r_IMG05;
	}

	public Review(String rEVIEW_ID, String iTEM_DETAIL_ID, String r_WRITER, String r_CONTENTS, Date r_DATE, String r_IMG01,
			String r_IMG02, String r_IMG03, String r_IMG04, String r_IMG05) {
		super();
		REVIEW_ID = rEVIEW_ID;
		ITEM_DETAIL_ID = iTEM_DETAIL_ID;
		R_WRITER = r_WRITER;
		R_CONTENTS = r_CONTENTS;
		R_DATE = r_DATE;
		R_IMG01 = r_IMG01;
		R_IMG02 = r_IMG02;
		R_IMG03 = r_IMG03;
		R_IMG04 = r_IMG04;
		R_IMG05 = r_IMG05;
	}

	@Override
	public String toString(){
		return REVIEW_ID + ", " + ITEM_DETAIL_ID + ", " + R_WRITER + ", " + R_CONTENTS + ", " + R_DATE + ", " 
				+ R_IMG01 + ", " + R_IMG02 + ", " + R_IMG03 + ", " + R_IMG04 + ", " + R_IMG05;
	}
	
	public String getREVIEW_ID() {
		return REVIEW_ID;
	}

	public void setREVIEW_ID(String rEVIEW_ID) {
		REVIEW_ID = rEVIEW_ID;
	}

	public String getITEM_DETAIL_ID() {
		return ITEM_DETAIL_ID;
	}

	public void setITEM_DETAIL_ID(String iTEM_DETAIL_ID) {
		ITEM_DETAIL_ID = iTEM_DETAIL_ID;
	}

	public String getR_WRITER() {
		return R_WRITER;
	}

	public void setR_WRITER(String r_WRITER) {
		R_WRITER = r_WRITER;
	}

	public String getR_CONTENTS() {
		return R_CONTENTS;
	}

	public void setR_CONTENTS(String r_CONTENTS) {
		R_CONTENTS = r_CONTENTS;
	}

	public Date getR_DATE() {
		return R_DATE;
	}

	public void setR_DATE(Date r_DATE) {
		R_DATE = r_DATE;
	}

	public String getR_IMG01() {
		return R_IMG01;
	}

	public void setR_IMG01(String r_IMG01) {
		R_IMG01 = r_IMG01;
	}

	public String getR_IMG02() {
		return R_IMG02;
	}

	public void setR_IMG02(String r_IMG02) {
		R_IMG02 = r_IMG02;
	}

	public String getR_IMG03() {
		return R_IMG03;
	}

	public void setR_IMG03(String r_IMG03) {
		R_IMG03 = r_IMG03;
	}

	public String getR_IMG04() {
		return R_IMG04;
	}

	public void setR_IMG04(String r_IMG04) {
		R_IMG04 = r_IMG04;
	}

	public String getR_IMG05() {
		return R_IMG05;
	}

	public void setR_IMG05(String r_IMG05) {
		R_IMG05 = r_IMG05;
	}
	
	
}
