package com.donut.web.dto;

public class CompanyListDTO
{
	private String companyId;
	private String companyName;
	private String projectSubject;
	private String totalMoney;
	private int percent;
	private String projectEnd;
	private int dropFlag;
	
	public CompanyListDTO() {}
	
	public CompanyListDTO(String companyId, String companyName, String projectSubject, String totalMoney, int percent,
			String projectEnd, int dropFlag)
	{
		super();
		this.companyId = companyId;
		this.companyName = companyName;
		this.projectSubject = projectSubject;
		this.totalMoney = totalMoney;
		this.percent = percent;
		this.projectEnd = projectEnd;
		this.dropFlag = dropFlag;
	}

	public String getCompanyId()
	{
		return companyId;
	}

	public void setCompanyId(String companyId)
	{
		this.companyId = companyId;
	}

	public String getCompanyName()
	{
		return companyName;
	}

	public void setCompanyName(String companyName)
	{
		this.companyName = companyName;
	}

	public String getProjectSubject()
	{
		return projectSubject;
	}

	public void setProjectSubject(String projectSubject)
	{
		this.projectSubject = projectSubject;
	}

	public String getTotalMoney()
	{
		return totalMoney;
	}

	public void setTotalMoney(String totalMoney)
	{
		this.totalMoney = totalMoney;
	}

	public int getPercent()
	{
		return percent;
	}

	public void setPercent(int percent)
	{
		this.percent = percent;
	}

	public String getProjectEnd()
	{
		return projectEnd;
	}

	public void setProjectEnd(String projectEnd)
	{
		this.projectEnd = projectEnd;
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
