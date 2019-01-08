package com.donut.web.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.donut.web.dao.IndexDAO;
import com.donut.web.dto.ProjectDTO;

@Repository
public class IndexDAOImpl implements IndexDAO
{
	@Autowired
	private SqlSession session;

	@Override
	public String countProject()
	{
		return session.selectOne("indexMapper.countProject");
	}

	@Override
	public String countMemberOne()
	{
		return session.selectOne("indexMapper.countMemberOne");
	}

	@Override
	public String countMemberTwo()
	{
		return session.selectOne("indexMapper.countMemberTwo");
	}

	@Override
	public List<ProjectDTO> almostDonePercent()
	{
		return session.selectList("indexMapper.almostDonePercent");
	}

	@Override
	public List<ProjectDTO> recentRegister()
	{
		return session.selectList("indexMapper.recentRegister");
	}

	@Override
	public List<ProjectDTO> almostDeadline()
	{
		return session.selectList("indexMapper.almostDeadline");
	}

	@Override
	public List<ProjectDTO> randomRecommend()
	{
		return session.selectList("indexMapper.randomRecommend");
	}

	@Override
	public List<ProjectDTO> autoComplete(String keyWord)
	{
		return session.selectList("indexMapper.autoComplete", keyWord);
	}

}
