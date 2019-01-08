package com.donut.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donut.web.dao.CompanyDAO;
import com.donut.web.dto.CompanyDTO;
import com.donut.web.dto.MemberDTO;
import com.donut.web.dto.ProjectDTO;
import com.donut.web.service.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private CompanyDAO companyDAO;

	@Override
	public int companyInsert(MemberDTO memberDTO) throws Exception {
		
		return companyDAO.companyInsert(memberDTO);
	}

	@Override
	public List<MemberDTO> companySelectAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO companySelectByid(String id) throws Exception {
		// TODO Auto-generated method stub
		return companyDAO.companySelectByid(id);
	}

	@Override
	public int companyUpdate(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return companyDAO.companyUpdate(memberDTO);
	}

	@Override
	public List<ProjectDTO> companyProjectSelectAll(String id) throws Exception {
		// TODO Auto-generated method stub
		return companyDAO.companyProjectSelectAll(id);
	}

	@Override
	public CompanyDTO selectById(String id) throws Exception {
		return companyDAO.selectById(id);
	}
	
	

}
