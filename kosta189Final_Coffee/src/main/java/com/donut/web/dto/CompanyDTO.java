package com.donut.web.dto;

public class CompanyDTO {

	private String id;
	private String companyName;
	private String companyCall;
	private String companyAddr;
	private String bank;
	private String account;
	
	public CompanyDTO() {}
	
	public CompanyDTO(String id, String companyName, String companyCall, String companyAddr, String bank,
			String account) {
		this.id = id;
		this.companyName = companyName;
		this.companyCall = companyCall;
		this.companyAddr = companyAddr;
		this.bank = bank;
		this.account = account;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyCall() {
		return companyCall;
	}
	public void setCompanyCall(String companyCall) {
		this.companyCall = companyCall;
	}
	public String getCompanyAddr() {
		return companyAddr;
	}
	public void setCompanyAddr(String companyAddr) {
		this.companyAddr = companyAddr;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	
	
	
}
