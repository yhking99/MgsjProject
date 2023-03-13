package com.project.product.domain;

public class CartDTO {

	private int pno;
	private int productCnt;
	private String userId;

	private String productName;
	private int productPrice;

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getProductCnt() {
		return productCnt;
	}

	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}

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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "CartDTO [pno=" + pno + ", productCnt=" + productCnt + ", userId=" + userId + ", productName="
				+ productName + ", productPrice=" + productPrice + "]";
	}

	
	
}
