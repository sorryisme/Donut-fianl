package com.donut.web.dao;

import java.util.List;

import com.donut.web.dto.DataDTO;

public interface DataDAO {

	public List<String> dataSelectCategory() throws Exception;

	public List<DataDTO> dataSelectAll(String dataCategory) throws Exception;

}
