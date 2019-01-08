package com.donut.web.service;

import java.util.List;

import com.donut.web.dto.MemberDTO;

public interface HonorService {

	public List<MemberDTO> honorSelectAll() throws Exception;
	
	public String countProject();
	
	public String totalGiveMoney();
 
	
}
