package com.donut.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.donut.web.dao.HonorDAO;
import com.donut.web.dto.MemberDTO;
import com.donut.web.service.HonorService;

@Service
@Transactional
public class HonorServiceImpl implements HonorService {

	@Autowired
	private HonorDAO honorDAO;
	
	public List<MemberDTO> honorSelectAll() throws Exception{
		return honorDAO.honorSelectAll();
	}
	
	@Override
	public String countProject()
	{
		return honorDAO.countProject();
	}
	
	@Override
	public String totalGiveMoney()
	{
		return honorDAO.totalGiveMoney();
	}
	
	
}
