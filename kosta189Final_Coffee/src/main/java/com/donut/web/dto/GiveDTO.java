package com.donut.web.dto;

import java.util.List;

public class GiveDTO {
	private int giveNo;
	private int projectNo;
	private String id;
	private int giveMoney;
	private String giveRegdate;
	private List<GiveItemDTO> giveItem;
	private PaymentDTO payment;
	
	public GiveDTO() {}

	public GiveDTO(int giveNo, int projectNo, String id, int giveMoney, String giveRegdate, List<GiveItemDTO> giveItem,
			PaymentDTO payment) {
		this.giveNo = giveNo;
		this.projectNo = projectNo;
		this.id = id;
		this.giveMoney = giveMoney;
		this.giveRegdate = giveRegdate;
		this.giveItem = giveItem;
		this.payment = payment;
	}

	public int getGiveNo() {
		return giveNo;
	}

	public void setGiveNo(int giveNo) {
		this.giveNo = giveNo;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getGiveMoney() {
		return giveMoney;
	}

	public void setGiveMoney(int giveMoney) {
		this.giveMoney = giveMoney;
	}

	public String getGiveRegdate() {
		return giveRegdate;
	}

	public void setGiveRegdate(String giveRegdate) {
		this.giveRegdate = giveRegdate;
	}

	public List<GiveItemDTO> getGiveItem() {
		return giveItem;
	}

	public void setGiveItem(List<GiveItemDTO> giveItem) {
		this.giveItem = giveItem;
	}

	public PaymentDTO getPayment() {
		return payment;
	}

	public void setPayment(PaymentDTO payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "GiveDTO [giveNo=" + giveNo + ", projectNo=" + projectNo + ", id=" + id + ", giveMoney=" + giveMoney
				+ ", giveRegdate=" + giveRegdate + ", giveItem=" + giveItem + ", payment=" + payment + "]";
	}
	
}
