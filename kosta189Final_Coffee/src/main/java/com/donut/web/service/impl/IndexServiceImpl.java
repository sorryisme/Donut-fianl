package com.donut.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donut.web.dao.IndexDAO;
import com.donut.web.dto.ProjectDTO;
import com.donut.web.service.IndexService;

@Service
public class IndexServiceImpl implements IndexService
{
	@Autowired
	private IndexDAO indexDAO;

	@Override
	public String countProject()
	{
		return indexDAO.countProject();
	}

	@Override
	public String countMemberOne()
	{
		return indexDAO.countMemberOne();
	}

	@Override
	public String countMemberTwo()
	{
		return indexDAO.countMemberTwo();
	}

	@Override
	public List<ProjectDTO> almostDonePercent()
	{
		return indexDAO.almostDonePercent();
	}

	@Override
	public List<ProjectDTO> recentRegister()
	{
		return indexDAO.recentRegister();
	}

	@Override
	public List<ProjectDTO> almostDeadline()
	{
		return indexDAO.almostDeadline();
	}

	@Override
	public List<ProjectDTO> randomRecommend()
	{
		return indexDAO.randomRecommend();
	}

	@Override
	public List<ProjectDTO> autoComplete(String keyWord)
	{
		return indexDAO.autoComplete(keyWord);
	}

}
