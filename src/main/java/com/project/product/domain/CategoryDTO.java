package com.project.product.domain;

public class CategoryDTO {

	private int cno;
	private String categoryName;
	private int categoryLevel;
	private int level;

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getCategoryLevel() {
		return categoryLevel;
	}

	public void setCategoryLevel(int categoryLevel) {
		this.categoryLevel = categoryLevel;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	@Override
	public String toString() {
		return "CategoryDTO [cno=" + cno + ", categoryName=" + categoryName + ", categoryLevel=" + categoryLevel
				+ ", level=" + level + "]";
	}

	

}
