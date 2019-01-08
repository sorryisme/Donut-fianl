package com.donut.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donut.web.dao.AdminDAO;
import com.donut.web.dto.CompanyListDTO;
import com.donut.web.dto.CurveChartDTO;
import com.donut.web.dto.MemberListDTO;
import com.donut.web.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService
{

	@Autowired
	private AdminDAO adminDAO;
	
	public List<Map<String, Object>> oneDayTotal(String date)
	{
		return adminDAO.oneDayTotal(date);
	}

	@Override
	public List<CompanyListDTO> selectCompany()
	{
		return adminDAO.selectCompany();
	}

	@Override
	public List<MemberListDTO> selectMember()
	{
		return adminDAO.selectMember();
	}

	@Override
	public int updateDropFlag(String id)
	{
		return adminDAO.updateDropFlag(id);
	}

	@Override
	public int selectToday()
	{
		return adminDAO.selectToday();
	}

	@Override
	public int selectWeek()
	{
		return adminDAO.selectWeek();
	}

	@Override
	public List<CurveChartDTO> curveList()
	{
		return adminDAO.curveList();
	}

}
