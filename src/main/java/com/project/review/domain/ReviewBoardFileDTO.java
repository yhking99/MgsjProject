package com.project.review.domain;

import java.util.Date;

public class ReviewBoardFileDTO {

	private int reviewFileNumber;
	private int rvno;
	private String originFileName;
	private String storedFileName;
	private String storedThumbNail;
	private int fileSize;
	private Date fileRegDate;

	public int getReviewFileNumber() {
		return reviewFileNumber;
	}

	public void setReviewFileNumber(int reviewFileNumber) {
		this.reviewFileNumber = reviewFileNumber;
	}

	public int getRvno() {
		return rvno;
	}

	public void setRvno(int rvno) {
		this.rvno = rvno;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	public String getStoredThumbNail() {
		return storedThumbNail;
	}

	public void setStoredThumbNail(String storedThumbNail) {
		this.storedThumbNail = storedThumbNail;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public Date getFileRegDate() {
		return fileRegDate;
	}

	public void setFileRegDate(Date fileRegDate) {
		this.fileRegDate = fileRegDate;
	}

	@Override
	public String toString() {
		return "ReviewBoardFileDTO [reviewFileNumber=" + reviewFileNumber + ", rvno=" + rvno + ", originFileName=" + originFileName
				+ ", storedFileName=" + storedFileName + ", storedThumbNail=" + storedThumbNail + ", fileSize=" + fileSize + ", fileRegDate="
				+ fileRegDate + "]";
	}
	
	
}
