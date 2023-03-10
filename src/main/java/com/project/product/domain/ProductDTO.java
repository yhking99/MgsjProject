package com.project.product.domain;

import java.util.Date;

public class ProductDTO {
	
	private int pno;
	private int cno;
	private String productName;
	private int productPrice;
	private int productStock;
	private String productDescription;
	private Date productRegDate;
	private int productReadCnt;

	//이너 조인
	private String categoryName;
	
	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
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

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public Date getProductRegDate() {
		return productRegDate;
	}

	public void setProductRegDate(Date productRegDate) {
		this.productRegDate = productRegDate;
	}

	public int getProductReadCnt() {
		return productReadCnt;
	}

	public void setProductReadCnt(int productReadCnt) {
		this.productReadCnt = productReadCnt;
	}
	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "ProductDTO [pno=" + pno + ", cno=" + cno + ", productName=" + productName + ", productPrice="
				+ productPrice + ", productStock=" + productStock + ", productDescription=" + productDescription
				+ ", productRegDate=" + productRegDate + ", productReadCnt=" + productReadCnt + ", categoryName="
				+ categoryName + "]";
	}

	

}
