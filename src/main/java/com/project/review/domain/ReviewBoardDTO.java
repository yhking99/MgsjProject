package com.project.review.domain;

import java.util.Date;

public class ReviewBoardDTO {

	private int rvno;
	private int pno;
	private String rvTitle;
	private String rvContent;
	private String rvWriter;
	private Date rvRegDate;
	
	public int getRvno() {
		return rvno;
	}
	public void setRvno(int rvno) {
		this.rvno = rvno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getRvTitle() {
		return rvTitle;
	}
	public void setRvTitle(String rvTitle) {
		this.rvTitle = rvTitle;
	}
	public String getRvContent() {
		return rvContent;
	}
	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}
	public String getRvWriter() {
		return rvWriter;
	}
	public void setRvWriter(String rvWriter) {
		this.rvWriter = rvWriter;
	}
	public Date getRvRegDate() {
		return rvRegDate;
	}
	public void setRvRegDate(Date rvRegDate) {
		this.rvRegDate = rvRegDate;
	}
	@Override
	public String toString() {
		return "ReviewBoardDTO [rvno=" + rvno + ", pno=" + pno + ", rvTitle=" + rvTitle + ", rvContent=" + rvContent
				+ ", rvWriter=" + rvWriter + ", rvRegDate=" + rvRegDate + "]";
	}

	
	
}
