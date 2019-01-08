package com.donut.web.dto;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {

	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private String picture;
	private int accMoney;
	private String regDate;
	private int statusFlag;
	private int dropFlag;
	private CompanyDTO company;
	private MultipartFile file;
	
	public MemberDTO() {}

	public MemberDTO(String id, String pwd, String name, String phone, String email, String picture, int accMoney,
			String regDate, int statusFlag, int dropFlag, CompanyDTO company, MultipartFile file) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.picture = picture;
		this.accMoney = accMoney;
		this.regDate = regDate;
		this.statusFlag = statusFlag;
		this.dropFlag = dropFlag;
		this.company = company;
		this.file = file;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getAccMoney() {
		return accMoney;
	}

	public void setAccMoney(int accMoney) {
		this.accMoney = accMoney;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getStatusFlag() {
		return statusFlag;
	}

	public void setStatusFlag(int statusFlag) {
		this.statusFlag = statusFlag;
	}

	public int getDropFlag() {
		return dropFlag;
	}

	public void setDropFlag(int dropFlag) {
		this.dropFlag = dropFlag;
	}

	public CompanyDTO getCompany() {
		return company;
	}

	public void setCompany(CompanyDTO company) {
		this.company = company;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", phone=" + phone + ", email=" + email
				+ ", picture=" + picture + ", accMoney=" + accMoney + ", regDate=" + regDate + ", statusFlag="
				+ statusFlag + ", dropFlag=" + dropFlag + ", company=" + company + ", file=" + file + "]";
	}
}
