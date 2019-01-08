package com.donut.web.dto;

public class DataDTO {
	
	private int dataItemNo;
	private String dataItemName;
	private String dataItemCategory;
	private int dataItemPrice;
	
	public DataDTO() {}

	public DataDTO(int dataItemNo, String dataItemName, String dataItemCategory, int dataItemPrice) {
		this.dataItemNo = dataItemNo;
		this.dataItemName = dataItemName;
		this.dataItemCategory = dataItemCategory;
		this.dataItemPrice = dataItemPrice;
	}

	public int getDataItemNo() {
		return dataItemNo;
	}

	public void setDataItemNo(int dataItemNo) {
		this.dataItemNo = dataItemNo;
	}

	public String getDataItemName() {
		return dataItemName;
	}

	public void setDataItemName(String dataItemName) {
		this.dataItemName = dataItemName;
	}

	public String getDataItemCategory() {
		return dataItemCategory;
	}

	public void setDataItemCategory(String dataItemCategory) {
		this.dataItemCategory = dataItemCategory;
	}

	public int getDataItemPrice() {
		return dataItemPrice;
	}

	public void setDataItemPrice(int dataItemPrice) {
		this.dataItemPrice = dataItemPrice;
	}

	@Override
	public String toString() {
		return "DataDTO [dataItemNo=" + dataItemNo + ", dataItemName=" + dataItemName + ", dataItemCategory="
				+ dataItemCategory + ", dataItemPrice=" + dataItemPrice + "]";
	}
	
	
	
	
}
