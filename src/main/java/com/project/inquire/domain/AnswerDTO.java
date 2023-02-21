package com.project.inquire.domain;

import java.util.Date;

/**
 * 
 * @author 김재국, 정원진, 홍준영
 *
 */
public class AnswerDTO {
	/*
	 * ansNum int NO PRI auto_increment askNum int NO ansTitle varchar(50) NO ansContent text NO ansRegDate datetime YES CURRENT_TIMESTAMP DEFAULT_GENERATED
	 */

	private int ansNum;
	private int askNum;
	private String ansTitle;
	private String ansContent;
	private Date ansRegDate;

	public int getAnsNum() {
		return ansNum;
	}

	public void setAnsNum(int ansNum) {
		this.ansNum = ansNum;
	}

	public int getAskNum() {
		return askNum;
	}

	public void setAskNum(int askNum) {
		this.askNum = askNum;
	}

	public String getAnsTitle() {
		return ansTitle;
	}

	public void setAnsTitle(String ansTitle) {
		this.ansTitle = ansTitle;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public Date getAnsRegDate() {
		return ansRegDate;
	}

	public void setAnsRegDate(Date ansRegDate) {
		this.ansRegDate = ansRegDate;
	}

	@Override
	public String toString() {
		return "AnswerDTO [ansNum=" + ansNum + ", askNum=" + askNum + ", ansTitle=" + ansTitle + ", ansContent=" + ansContent + ", ansRegDate="
				+ ansRegDate + "]";
	}

}
