package com.donut.web.dto;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {

	private int projectNo;
	private String id;
	private String reviewContent;
	private String reviewImg;
	private String reviewRegdate;
	private MultipartFile file;

	public ReviewDTO() {}

	public ReviewDTO(int projectNo, String id, String reviewContent, String reviewImg, String reviewRegdate,
			MultipartFile file) {
		this.projectNo = projectNo;
		this.id = id;
		this.reviewContent = reviewContent;
		this.reviewImg = reviewImg;
		this.reviewRegdate = reviewRegdate;
		this.file = file;
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

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewImg() {
		return reviewImg;
	}

	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}

	public String getReviewRegdate() {
		return reviewRegdate;
	}

	public void setReviewRegdate(String reviewRegdate) {
		this.reviewRegdate = reviewRegdate;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "ReviewDTO [projectNo=" + projectNo + ", id=" + id + ", reviewContent=" + reviewContent + ", reviewImg="
				+ reviewImg + ", reviewRegdate=" + reviewRegdate + ", file=" + file + "]";
	}

}
