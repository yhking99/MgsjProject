package com.project.inquire.domain;
 
public class AskDTO {
	private int askNum;
	private int pno;
	private String askTitle;
	private String askContent;
	private String askRegDate;
	public int getAskNum() {
		return askNum;
	}
	public void setAskNum(int askNum) {
		this.askNum = askNum;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getAskTitle() {
		return askTitle;
	}
	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}
	public String getAskContent() {
		return askContent;
	}
	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}
	public String getAskRegDate() {
		return askRegDate;
	}
	public void setAskRegDate(String askRegDate) {
		this.askRegDate = askRegDate;
	}
	@Override
	public String toString() {
		return "AskDTO [askNum=" + askNum + ", pno=" + pno + ", askTitle=" + askTitle + ", askContent=" + askContent
				+ ", askRegDate=" + askRegDate + "]";
	}
	
	
	
}
