package com.donut.web.dto;

public class MemberListDTO
{
	private String memberId;
	private String memberName;
	private String projectSubject;
	private int giveMoney;
	private int dropFlag;
	
	public MemberListDTO() {}

	
	public MemberListDTO(String memberId, String memberName, String projectSubject, int giveMoney, int dropFlag)
	{
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.projectSubject = projectSubject;
		this.giveMoney = giveMoney;
		this.dropFlag = dropFlag;
	}

	public String getMemberId()
	{
		return memberId;
	}

	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}

	public String getMemberName()
	{
		return memberName;
	}

	public void setMemberName(String memberName)
	{
		this.memberName = memberName;
	}

	public String getProjectSubject()
	{
		return projectSubject;
	}

	public void setProjectSubject(String projectSubject)
	{
		this.projectSubject = projectSubject;
	}

	public int getGiveMoney()
	{
		return giveMoney;
	}

	public void setGiveMoney(int giveMoney)
	{
		this.giveMoney = giveMoney;
	}

	public int getDropFlag()
	{
		return dropFlag;
	}

	public void setDropFlag(int dropFlag)
	{
		this.dropFlag = dropFlag;
	}
	
}
