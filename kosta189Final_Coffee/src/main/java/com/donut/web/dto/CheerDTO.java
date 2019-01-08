package com.donut.web.dto;

public class CheerDTO {

	private int cheerNo;
	private int projectNo;
	private String id;
	private String cheerContent;
	private String cheerRegdate;
	private int cheerNotify;
	private int cheerParentNo;
	
	private MemberDTO memberDTO;
	private ProjectDTO projectDTO;

	public CheerDTO() {}

	public CheerDTO(int cheerNo, int projectNo, String id, String cheerContent, String cheerRegdate, int cheerNotify,
			int cheerParentNo) {
		this.cheerNo = cheerNo;
		this.projectNo = projectNo;
		this.id = id;
		this.cheerContent = cheerContent;
		this.cheerRegdate = cheerRegdate;
		this.cheerNotify = cheerNotify;
		this.cheerParentNo = cheerParentNo;
	}

	
	public int getCheerNo() {
		return cheerNo;
	}

	public void setCheerNo(int cheerNo) {
		this.cheerNo = cheerNo;
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

	public String getCheerContent() {
		return cheerContent;
	}

	public void setCheerContent(String cheerContent) {
		this.cheerContent = cheerContent;
	}

	public String getCheerRegdate() {
		return cheerRegdate;
	}

	public void setCheerRegdate(String cheerRegdate) {
		this.cheerRegdate = cheerRegdate;
	}

	public int getCheerNotify() {
		return cheerNotify;
	}

	public void setCheerNotify(int cheerNotify) {
		this.cheerNotify = cheerNotify;
	}

	public int getCheerParentNo() {
		return cheerParentNo;
	}

	public void setCheerParentNo(int cheerParentNo) {
		this.cheerParentNo = cheerParentNo;
	}

	public MemberDTO getMemberDTO() {
		return memberDTO;
	}

	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	
	public ProjectDTO getProjectDTO() {
		return projectDTO;
	}

	public void setProjectDTO(ProjectDTO projectDTO) {
		this.projectDTO = projectDTO;
	}

	@Override
	public String toString() {
		return "CheerDTO [cheerNo=" + cheerNo + ", projectNo=" + projectNo + ", id=" + id + ", cheerContent="
				+ cheerContent + ", cheerRegdate=" + cheerRegdate + ", cheerNotify=" + cheerNotify + ", cheerParentNo="
				+ cheerParentNo + "]";
	}
	
}
