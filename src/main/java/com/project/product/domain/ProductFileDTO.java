package com.project.product.domain;

import java.util.Date;

public class ProductFileDTO {

	private int productFileNumber;
	private int pno;
	private String originFileName;
	private String storedFileName;
	private String storedThumbNail;
	private int fileSize;
	private Date fileRegDate;

	public int getProductFileNumber() {
		return productFileNumber;
	}

	public void setProductFileNumber(int productFileNumber) {
		this.productFileNumber = productFileNumber;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
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
		return "ProductFileDTO [productFileNumber=" + productFileNumber + ", pno=" + pno + ", originFileName=" + originFileName + ", storedFileName="
				+ storedFileName + ", storedThumbNail=" + storedThumbNail + ", fileSize=" + fileSize + ", fileRegDate=" + fileRegDate + "]";
	}

}
