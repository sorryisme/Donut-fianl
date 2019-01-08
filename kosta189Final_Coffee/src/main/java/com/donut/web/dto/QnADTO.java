package com.donut.web.dto;

public class QnADTO {

	private int qnaNo;
	private int projectNo;
	private String id;
	private String qnaContent;
	private String qnaRegdate;
	private int qnaNotify;
	private int qnaParentNo;
	
	public QnADTO() {}

	public QnADTO(int qnaNo, int projectNo, String id, String qnaContent, String qnaRegdate, int qnaNotify,
			int qnaParentNo) {
		this.qnaNo = qnaNo;
		this.projectNo = projectNo;
		this.id = id;
		this.qnaContent = qnaContent;
		this.qnaRegdate = qnaRegdate;
		this.qnaNotify = qnaNotify;
		this.qnaParentNo = qnaParentNo;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
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

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaRegdate() {
		return qnaRegdate;
	}

	public void setQnaRegdate(String qnaRegdate) {
		this.qnaRegdate = qnaRegdate;
	}

	public int getQnaNotify() {
		return qnaNotify;
	}

	public void setQnaNotify(int qnaNotify) {
		this.qnaNotify = qnaNotify;
	}

	public int getQnaParentNo() {
		return qnaParentNo;
	}

	public void setQnaParentNo(int qnaParentNo) {
		this.qnaParentNo = qnaParentNo;
	}

	@Override
	public String toString() {
		return "QnADTO [qnaNo=" + qnaNo + ", projectNo=" + projectNo + ", id=" + id + ", qnaContent=" + qnaContent
				+ ", qnaRegdate=" + qnaRegdate + ", qnaNotify=" + qnaNotify + ", qnaParentNo=" + qnaParentNo + "]";
	}
	
	

	
	
	
}
