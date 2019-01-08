package com.donut.web.service;

import java.util.List;
import java.util.Map;

import com.donut.web.dto.CompanyListDTO;
import com.donut.web.dto.CurveChartDTO;
import com.donut.web.dto.MemberListDTO;
import com.donut.web.dto.ProjectDTO;

public interface AdminService
{
	public List<Map<String, Object>> oneDayTotal(String date);
	
	public List<CompanyListDTO> selectCompany();
	
	public List<MemberListDTO> selectMember();

	public int updateDropFlag(String id);

	public int selectToday();

	public int selectWeek();
	
	public List<CurveChartDTO> curveList();
}
