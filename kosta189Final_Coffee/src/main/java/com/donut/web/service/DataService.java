package com.donut.web.service;

import java.util.List;

import com.donut.web.dto.DataDTO;

public interface DataService {

	public List<String> dataSelectCategory() throws Exception;

	public List<DataDTO> dataSelectAll(String dataCategory) throws Exception;
	
}
