package com.donut.web.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.donut.web.dao.DataDAO;
import com.donut.web.dto.DataDTO;

@Repository
public class	 DataDAOImpl implements DataDAO{

	@Autowired 
	SqlSession session;
	
	@Override
	public List<String> dataSelectCategory() throws Exception {
		return session.selectList("dataMapper.selectCategory") ;
	}

	@Override
	public List<DataDTO> dataSelectAll(String dataCategory) throws Exception {
		return session.selectList("dataMapper.selectData",dataCategory);
	}
	
	

}
