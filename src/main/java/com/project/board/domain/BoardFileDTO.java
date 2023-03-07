package com.project.board.domain;

import java.util.Date;

/**
 * 
 * @author 김재국, 정원진, 홍준영
 *
 */
public class BoardFileDTO {

	private int boardFileNumber;
	private int bno;
	private String originFileName;
	private String storedFileName;
	private String storedThumbNail;
	private int fileSize;
	private Date fileRegDate;

	public int getBoardFileNumber() {
		return boardFileNumber;
	}

	public void setBoardFileNumber(int boardFileNumber) {
		this.boardFileNumber = boardFileNumber;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
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
		return "BoardFileDTO [boardFileNumber=" + boardFileNumber + ", bno=" + bno + ", originFileName=" + originFileName + ", storedFileName="
				+ storedFileName + ", storedThumbNail=" + storedThumbNail + ", fileSize=" + fileSize + ", fileRegDate=" + fileRegDate + "]";
	}
	
}
