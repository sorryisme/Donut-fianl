package com.donut.web.dao;

import java.util.List;

import com.donut.web.dto.CompanyDTO;
import com.donut.web.dto.MemberDTO;
import com.donut.web.dto.ProjectDTO;

public interface CompanyDAO {
	
	//회원가입
	public int companyInsert(MemberDTO memberDTO) throws Exception;
	
	public List<MemberDTO> companySelectAll() throws Exception;
	
	//업데이트를 위한 검색 - 서비스 세션에서 가져오기
	public MemberDTO companySelectByid(String id) throws Exception;
	
	public int companyUpdate(MemberDTO memberDTO) throws Exception;
	
	//기부단체 마이페이지 프로젝트 현황
	public List<ProjectDTO> companyProjectSelectAll(String id) throws Exception;

	public CompanyDTO selectById(String id) throws Exception;
}
