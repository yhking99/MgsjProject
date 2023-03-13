package com.project.order.domain;

import java.util.Date;

public class OrderDTO {
	
	private int orderNum;
	private String userId;
	private Date orderDate;
	private String postAddress;
	private String detailAddress;
	private String detailAddress2;
	private String recipient;
	private String recipientPhone;
	
	
	 //조인용 변수 private String productName; private int productPrice; private int
	private String productName;
	private int productPrice;
	private int productCnt;
	private int pno;
	 
	/* alt + shift + a로 지우기
	 * private int totalPrice; public OrderDTO() { this.totalPrice = this.productCnt
	 * * this.productPrice; }
	 */

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getPostAddress() {
		return postAddress;
	}

	public void setPostAddress(String postAddress) {
		this.postAddress = postAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getDetailAddress2() {
		return detailAddress2;
	}

	public void setDetailAddress2(String detailAddress2) {
		this.detailAddress2 = detailAddress2;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getRecipientPhone() {
		return recipientPhone;
	}

	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}
	
	//조인용
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductCnt() {
		return productCnt;
	}

	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}
	
	/*
	 * public int getTotalPrice() { return totalPrice; }
	 * 
	 * public void setTotalPrice(int totalPrice) { this.totalPrice = totalPrice; }
	 */

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	@Override
	public String toString() {
		return "OrderDTO [orderNum=" + orderNum + ", userId=" + userId + ", orderDate=" + orderDate + ", postAddress="
				+ postAddress + ", detailAddress=" + detailAddress + ", detailAddress2=" + detailAddress2
				+ ", recipient=" + recipient + ", recipientPhone=" + recipientPhone + ", productName=" + productName
				+ ", productPrice=" + productPrice + ", productCnt=" + productCnt + ", pno=" + pno + "]";
	}
}
