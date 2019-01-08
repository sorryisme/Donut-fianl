package com.donut.web.dao;

import java.util.List;

import com.donut.web.dto.MemberDTO;

public interface HonorDAO {
	
	public List<MemberDTO> honorSelectAll() throws Exception;
	
	public String countProject();
	
	public String totalGiveMoney();
}
