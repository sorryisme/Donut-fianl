package com.donut.web.dto;

public class ItemDTO {

	private int projectItemNo;
	private int projectNo;
	private String itemName;
	private int itemPrice;
	private int itemAmount;
	private int goalAmount;
	
	public ItemDTO() {}

	public ItemDTO(int projectItemNo, int projectNo, String itemName, int itemPrice, int itemAmount, int goalAmount) {
		this.projectItemNo = projectItemNo;
		this.projectNo = projectNo;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.itemAmount = itemAmount;
		this.goalAmount = goalAmount;
	}

	public int getProjectItemNo() {
		return projectItemNo;
	}

	public void setProjectItemNo(int projectItemNo) {
		this.projectItemNo = projectItemNo;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getItemAmount() {
		return itemAmount;
	}

	public void setItemAmount(int itemAmount) {
		this.itemAmount = itemAmount;
	}

	public int getGoalAmount() {
		return goalAmount;
	}

	public void setGoalAmount(int goalAmount) {
		this.goalAmount = goalAmount;
	}

	@Override
	public String toString() {
		return "ItemDTO [projectItemNo=" + projectItemNo + ", projectNo=" + projectNo + ", itemName=" + itemName
				+ ", itemPrice=" + itemPrice + ", itemAmount=" + itemAmount + ", goalAmount=" + goalAmount + "]";
	}

	
	
	

	
	
}
