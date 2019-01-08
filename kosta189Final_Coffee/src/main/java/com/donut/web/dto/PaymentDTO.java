package com.donut.web.dto;

public class PaymentDTO {
	private int giveNo;
	private String payMethod;
	private int payMoney;
	private String permissionDate;
	private String receiver;
	private String addr;
	private String call;
	private String memo;
	private String payDate;
	private String receiptURL;
	
	public PaymentDTO() {}

	public PaymentDTO(int giveNo, String payMethod, int payMoney, String permissionDate, String receiver, String addr,
			String call, String memo, String payDate, String receiptURL) {
		this.giveNo = giveNo;
		this.payMethod = payMethod;
		this.payMoney = payMoney;
		this.permissionDate = permissionDate;
		this.receiver = receiver;
		this.addr = addr;
		this.call = call;
		this.memo = memo;
		this.payDate = payDate;
		this.receiptURL = receiptURL;
	}

	public int getGiveNo() {
		return giveNo;
	}

	public void setGiveNo(int giveNo) {
		this.giveNo = giveNo;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public int getPayMoney() {
		return payMoney;
	}

	public void setPayMoney(int payMoney) {
		this.payMoney = payMoney;
	}

	public String getPermissionDate() {
		return permissionDate;
	}

	public void setPermissionDate(String permissionDate) {
		this.permissionDate = permissionDate;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getCall() {
		return call;
	}

	public void setCall(String call) {
		this.call = call;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public String getReceiptURL() {
		return receiptURL;
	}

	public void setReceiptURL(String receiptURL) {
		this.receiptURL = receiptURL;
	}

	@Override
	public String toString() {
		return "PaymentDTO [giveNo=" + giveNo + ", payMethod=" + payMethod + ", payMoney=" + payMoney
				+ ", permissionDate=" + permissionDate + ", receiver=" + receiver + ", addr=" + addr + ", call=" + call
				+ ", memo=" + memo + ", payDate=" + payDate + ", receiptURL=" + receiptURL + "]";
	}
	
}


