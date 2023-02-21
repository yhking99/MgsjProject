package com.project.order.domain;

public class OrderDetailDTO {
	
	private int orderNum;
	private int pno; 
	private int productPrice;
	private int productCnt;
	private String orderStatus;
	private int userNum;
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
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
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	@Override
	public String toString() {
		return "OrderDetailDTO [orderNum=" + orderNum + ", pno=" + pno + ", productPrice=" + productPrice
				+ ", productCnt=" + productCnt + ", orderStatus=" + orderStatus + ", userNum=" + userNum + "]";
	}
	
	
}
