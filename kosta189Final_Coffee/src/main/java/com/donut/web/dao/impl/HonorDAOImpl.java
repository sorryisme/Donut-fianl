package com.donut.web.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.donut.web.dao.HonorDAO;
import com.donut.web.dto.MemberDTO;

@Repository
public class HonorDAOImpl implements HonorDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<MemberDTO> honorSelectAll() throws Exception{
		return session.selectList("honorMapper.selectAll");
	}
	
	@Override
	public String countProject()
	{
		return session.selectOne("honorMapper.countProject");
	}
	
	@Override
	public String totalGiveMoney()
	{
		return session.selectOne("honorMapper.totalGiveMoney");
	}
}
