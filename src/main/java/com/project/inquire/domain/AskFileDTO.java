package com.project.inquire.domain;

import java.util.Date;

public class AskFileDTO {
	
	private int askFileNumber;
	private int askNum;
	private String askOriginFileName;
	private String StoredFileName;
	private String StoredThumbNail;
	private int askFileSize;
	private Date askFileRegDate;
	public int getAskFileNumber() {
		return askFileNumber;
	}
	public void setAskFileNumber(int askFileNumber) {
		this.askFileNumber = askFileNumber;
	}
	public int getAskNum() {
		return askNum;
	}
	public void setAskNum(int askNum) {
		this.askNum = askNum;
	}
	public String getAskOriginFileName() {
		return askOriginFileName;
	}
	public void setAskOriginFileName(String askOriginFileName) {
		this.askOriginFileName = askOriginFileName;
	}
	public String getStoredFileName() {
		return StoredFileName;
	}
	public void setStoredFileName(String storedFileName) {
		StoredFileName = storedFileName;
	}
	public String getStoredThumbNail() {
		return StoredThumbNail;
	}
	public void setStoredThumbNail(String storedThumbNail) {
		StoredThumbNail = storedThumbNail;
	}
	public int getAskFileSize() {
		return askFileSize;
	}
	public void setAskFileSize(int askFileSize) {
		this.askFileSize = askFileSize;
	}
	public Date getAskFileRegDate() {
		return askFileRegDate;
	}
	public void setAskFileRegDate(Date askFileRegDate) {
		this.askFileRegDate = askFileRegDate;
	}
	@Override
	public String toString() {
		return "AskFileDTO [askFileNumber=" + askFileNumber + ", askNum=" + askNum + ", askOriginFileName="
				+ askOriginFileName + ", StoredFileName=" + StoredFileName + ", StoredThumbNail=" + StoredThumbNail
				+ ", askFileSize=" + askFileSize + ", askFileRegDate=" + askFileRegDate + "]";
	}
	
	
	
}
