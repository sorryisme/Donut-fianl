package com.donut.web.dto;

public class RewardDTO {

	private int rewardNo;
	private int projectNo;
	private String rewardItem;
	private int condition;
	
	public RewardDTO() {}

	public RewardDTO(int rewardNo, int projectNo, String rewardItem, int condition) {
		this.rewardNo = rewardNo;
		this.projectNo = projectNo;
		this.rewardItem = rewardItem;
		this.condition = condition;
	}

	public int getRewardNo() {
		return rewardNo;
	}

	public void setRewardNo(int rewardNo) {
		this.rewardNo = rewardNo;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getRewardItem() {
		return rewardItem;
	}

	public void setRewardItem(String rewardItem) {
		this.rewardItem = rewardItem;
	}

	public int getCondition() {
		return condition;
	}

	public void setCondition(int condition) {
		this.condition = condition;
	}

	@Override
	public String toString() {
		return "RewardDTO [rewardNo=" + rewardNo + ", projectNo=" + projectNo + ", rewardItem=" + rewardItem
				+ ", condition=" + condition + "]";
	}
	
	
	
}
