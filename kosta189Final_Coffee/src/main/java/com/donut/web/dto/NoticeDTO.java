package com.donut.web.dto;

public class NoticeDTO {

	private int noticeNo;
	private String id;
	private String noticeTitle;
	private String noticeContent;
	private String noticeRegdate;

	public NoticeDTO() {}

	public NoticeDTO(int noticeNo, String id, String noticeTitle, String noticeContent, String noticeRegdate) {
		this.noticeNo = noticeNo;
		this.id = id;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeRegdate = noticeRegdate;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeRegdate() {
		return noticeRegdate;
	}

	public void setNoticeRegdate(String noticeRegdate) {
		this.noticeRegdate = noticeRegdate;
	}

	@Override
	public String toString() {
		return "NoticeDTO [noticeNo=" + noticeNo + ", id=" + id + ", noticeTitle=" + noticeTitle + ", noticeContent="
				+ noticeContent + ", noticeRegdate=" + noticeRegdate + "]";
	}
	
}
