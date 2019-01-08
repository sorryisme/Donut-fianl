package com.donut.web.dao.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.donut.web.dao.AdminDAO;
import com.donut.web.dto.CompanyListDTO;
import com.donut.web.dto.CurveChartDTO;
import com.donut.web.dto.MemberListDTO;

@Repository
public class AdminDAOImpl implements AdminDAO
{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Map<String, Object>> oneDayTotal(String date)
	{
		return session.selectList("adminMapper.oneDayTotal", date);
	}

	@Override
	public List<CompanyListDTO> selectCompany()
	{
		return session.selectList("adminMapper.selectCompany");
	}

	@Override
	public List<MemberListDTO> selectMember()
	{
		return session.selectList("adminMapper.selectMember");
	}

	@Override
	public int updateDropFlag(String id)
	{
		return session.update("adminMapper.updateDropFlag", id);
	}

	@Override
	public int selectToday()
	{
		int result = 0;
		if(session.selectOne("adminMapper.selectToday")!=null)
			result = session.selectOne("adminMapper.selectToday");

		return result;
	}

	@Override
	public int selectWeek()
	{
		return session.selectOne("adminMapper.selectWeek");
	}

	@Override
	public List<CurveChartDTO> curveList()
	{
		List<CurveChartDTO> list = new ArrayList<>();
		
		for(int i = 4; i >= 0; i--)
		{
			CurveChartDTO dto = new CurveChartDTO();
			
			Calendar cal = new GregorianCalendar();
		    cal.add(Calendar.DATE, -i);
		    //String date = Integer.toString(cal.get(Calendar.YEAR)) + "-"+ Integer.toString(cal.get(Calendar.MONTH) + 1) + "-" + Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
		    String date = cal.get(Calendar.YEAR) + "-"+ (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DAY_OF_MONTH);
			dto.setToday(date);
			
			int newProject = session.selectOne("adminMapper.selectNewProject",i);
			dto.setNewProject(newProject);
			
			int newGive = session.selectOne("adminMapper.selectNewGive",i);
			dto.setNewGive(newGive);
			
			System.out.println("dto = " + dto);
			
			list.add(dto);
		}
		
		return list;
	} 

}
