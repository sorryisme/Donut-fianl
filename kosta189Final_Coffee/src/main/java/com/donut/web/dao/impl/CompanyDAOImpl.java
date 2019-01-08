package com.donut.web.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.donut.web.dao.CompanyDAO;
import com.donut.web.dto.CompanyDTO;
import com.donut.web.dto.MemberDTO;
import com.donut.web.dto.ProjectDTO;

@Repository
public class CompanyDAOImpl implements CompanyDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public int companyInsert(MemberDTO memberDTO) throws Exception {
		return session.insert("companyMapper.companyInsert", memberDTO);
	}

	@Override
	public List<MemberDTO> companySelectAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO companySelectByid(String id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("memberMapper.selectCompanybyId", id);
	}

	@Override
	public int companyUpdate(MemberDTO memberDTO) throws Exception {
		int result = 0;
		int memberUpdateResult = session.update("memberMapper.memberUpdate", memberDTO);
		int companyUpdateResult = session.update("companyMapper.companyUpdate", memberDTO);
		
		if(memberUpdateResult==1 && companyUpdateResult==1) {
			return result = 1;
		}
		return result;
	}

	@Override
	public List<ProjectDTO> companyProjectSelectAll(String id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("companyMapper.selectMyProject", id);
	}

	@Override
	public CompanyDTO selectById(String id) throws Exception {
		return session.selectOne("companyMapper.selectById", id);
	}
	
	

}
