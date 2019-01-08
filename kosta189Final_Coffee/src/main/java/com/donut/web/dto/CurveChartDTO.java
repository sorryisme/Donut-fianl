package com.donut.web.dto;

public class CurveChartDTO
{
	private String today;
	private int newProject;
	private int newGive;
	
	public CurveChartDTO() {}

	public CurveChartDTO(String today, int newProject, int newGive)
	{
		super();
		this.today = today;
		this.newProject = newProject;
		this.newGive = newGive;
	}

	public String getToday()
	{
		return today;
	}

	public void setToday(String today)
	{
		this.today = today;
	}

	public int getNewProject()
	{
		return newProject;
	}

	public void setNewProject(int newProject)
	{
		this.newProject = newProject;
	}

	public int getNewGive()
	{
		return newGive;
	}

	public void setNewGive(int newGive)
	{
		this.newGive = newGive;
	}

	@Override
	public String toString()
	{
		return "{\"today\":\"" + today + "\", \"newProject\":" + newProject + ", \"newGive\":" + newGive+ "}";
	}
	
	
	
}
