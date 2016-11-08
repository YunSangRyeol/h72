package com.project.h72.qna.vo;

import java.sql.Date;

public class QnA {

	private int qNo; // 글 번호
	private String qTitle; // 제목
	private String qContent; // 내용
	private Date qDate; // 작성일
	private String qWriter; // 질문작성자
	private String answer; // 질문 답변 여부
	private String answerContent; // 답변내용
	private Date aDate; // 답변일
	private String qName; // 분류명
	private String qCode; // 분류코드

	
	
	public QnA(String qTitle, String qContent) {
		super();
		this.qTitle = qTitle;
		this.qContent = qContent;
	}

	public QnA() {
		super();
	}

	public QnA(int qNo, String qTitle, String qContent, Date qDate, String qWriter, String answer, String answerContent,
			Date aDate, String qName, String qCode) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.qWriter = qWriter;
		this.answer = answer;
		this.answerContent = answerContent;
		this.aDate = aDate;
		this.qName = qName;
		this.qCode = qCode;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}

	public String getqWriter() {
		return qWriter;
	}

	public void setqWriter(String qWriter) {
		this.qWriter = qWriter;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public Date getaDate() {
		return aDate;
	}

	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}

	public String getqName() {
		return qName;
	}

	public void setqName(String qName) {
		this.qName = qName;
	}

	public String getqCode() {
		return qCode;
	}

	public void setqCode(String qCode) {
		this.qCode = qCode;
	}

	@Override
	public String toString() {
		return "QnA [qNo=" + qNo + ", qTitle=" + qTitle + ", qContent=" + qContent + ", qDate=" + qDate + ", qWriter="
				+ qWriter + ", answer=" + answer + ", answerContent=" + answerContent + ", aDate=" + aDate + ", qName="
				+ qName + ", qCode=" + qCode + "]";
	}

}
