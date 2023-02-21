package com.project.order.domain;
 
import java.util.Date;

public class RefundDTO {

	private int refundCode;
	private int orderNum;
	private Date refundStartDate;
	private Date refundEndDate;
	private String refundDivision;
	private int refundMoney;
	private String refundTool;
	private String refundBank;
	private int refundAccount;
	public int getRefundCode() {
		return refundCode;
	}
	public void setRefundCode(int refundCode) {
		this.refundCode = refundCode;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public Date getRefundStartDate() {
		return refundStartDate;
	}
	public void setRefundStartDate(Date refundStartDate) {
		this.refundStartDate = refundStartDate;
	}
	public Date getRefundEndDate() {
		return refundEndDate;
	}
	public void setRefundEndDate(Date refundEndDate) {
		this.refundEndDate = refundEndDate;
	}
	public String getRefundDivision() {
		return refundDivision;
	}
	public void setRefundDivision(String refundDivision) {
		this.refundDivision = refundDivision;
	}
	public int getRefundMoney() {
		return refundMoney;
	}
	public void setRefundMoney(int refundMoney) {
		this.refundMoney = refundMoney;
	}
	public String getRefundTool() {
		return refundTool;
	}
	public void setRefundTool(String refundTool) {
		this.refundTool = refundTool;
	}
	public String getRefundBank() {
		return refundBank;
	}
	public void setRefundBank(String refundBank) {
		this.refundBank = refundBank;
	}
	public int getRefundAccount() {
		return refundAccount;
	}
	public void setRefundAccount(int refundAccount) {
		this.refundAccount = refundAccount;
	}
	@Override
	public String toString() {
		return "RefundDTO [refundCode=" + refundCode + ", orderNum=" + orderNum + ", refundStartDate=" + refundStartDate
				+ ", refundEndDate=" + refundEndDate + ", refundDivision=" + refundDivision + ", refundMoney="
				+ refundMoney + ", refundTool=" + refundTool + ", refundBank=" + refundBank + ", refundAccount="
				+ refundAccount + "]";
	}
	
	
}
