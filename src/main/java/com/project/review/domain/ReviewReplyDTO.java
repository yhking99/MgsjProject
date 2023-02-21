package com.project.review.domain;

import java.util.Date;

public class ReviewReplyDTO {
	
	private int rvReplyNum;
	private int rvno;
	private int rvReplyContent;
	private String rvReplyWriter;
	private Date rvReplyRegDate;
	
	public int getRvReplyNum() {
		return rvReplyNum;
	}
	public void setRvReplyNum(int rvReplyNum) {
		this.rvReplyNum = rvReplyNum;
	}
	public int getRvno() {
		return rvno;
	}
	public void setRvno(int rvno) {
		this.rvno = rvno;
	}
	public int getRvReplyContent() {
		return rvReplyContent;
	}
	public void setRvReplyContent(int rvReplyContent) {
		this.rvReplyContent = rvReplyContent;
	}
	public String getRvReplyWriter() {
		return rvReplyWriter;
	}
	public void setRvReplyWriter(String rvReplyWriter) {
		this.rvReplyWriter = rvReplyWriter;
	}
	public Date getRvReplyRegDate() {
		return rvReplyRegDate;
	}
	public void setRvReplyRegDate(Date rvReplyRegDate) {
		this.rvReplyRegDate = rvReplyRegDate;
	}
	@Override
	public String toString() {
		return "ReviewReplyDTO [rvReplyNum=" + rvReplyNum + ", rvno=" + rvno + ", rvReplyContent=" + rvReplyContent
				+ ", rvReplyWriter=" + rvReplyWriter + ", rvReplyRegDate=" + rvReplyRegDate + "]";
	}
	
	
}
