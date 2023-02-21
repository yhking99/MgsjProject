package com.project.review.domain;

import java.util.Date;

public class ReviewBoardFileDTO {

	private int rvFileNumber;
	private int rvno;
	private String rvOriginFileName;
	private String rvStoredFileName;
	private String rvStoredThumbNail;
	private int rvFileSIZE;
	private Date rvFileRegDate;
	
	public int getRvFileNumber() {
		return rvFileNumber;
	}
	public void setRvFileNumber(int rvFileNumber) {
		this.rvFileNumber = rvFileNumber;
	}
	public int getRvno() {
		return rvno;
	}
	public void setRvno(int rvno) {
		this.rvno = rvno;
	}
	public String getRvOriginFileName() {
		return rvOriginFileName;
	}
	public void setRvOriginFileName(String rvOriginFileName) {
		this.rvOriginFileName = rvOriginFileName;
	}
	public String getRvStoredFileName() {
		return rvStoredFileName;
	}
	public void setRvStoredFileName(String rvStoredFileName) {
		this.rvStoredFileName = rvStoredFileName;
	}
	public String getRvStoredThumbNail() {
		return rvStoredThumbNail;
	}
	public void setRvStoredThumbNail(String rvStoredThumbNail) {
		this.rvStoredThumbNail = rvStoredThumbNail;
	}
	public int getRvFileSIZE() {
		return rvFileSIZE;
	}
	public void setRvFileSIZE(int rvFileSIZE) {
		this.rvFileSIZE = rvFileSIZE;
	}
	public Date getRvFileRegDate() {
		return rvFileRegDate;
	}
	public void setRvFileRegDate(Date rvFileRegDate) {
		this.rvFileRegDate = rvFileRegDate;
	}
	@Override
	public String toString() {
		return "ReviewBoardFileDTO [rvFileNumber=" + rvFileNumber + ", rvno=" + rvno + ", rvOriginFileName="
				+ rvOriginFileName + ", rvStoredFileName=" + rvStoredFileName + ", rvStoredThumbNail="
				+ rvStoredThumbNail + ", rvFileSIZE=" + rvFileSIZE + ", rvFileRegDate=" + rvFileRegDate + "]";
	}
	
	
}
