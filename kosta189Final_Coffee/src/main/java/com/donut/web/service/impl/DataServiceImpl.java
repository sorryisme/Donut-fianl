package com.donut.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donut.web.dao.DataDAO;
import com.donut.web.dto.DataDTO;
import com.donut.web.service.DataService;

@Service
public class DataServiceImpl implements DataService{

	@Autowired
	DataDAO dataDAO;
	
	@Override
	public List<String> dataSelectCategory() throws Exception {
		List<String> list = dataDAO.dataSelectCategory();
		if(list == null || list.isEmpty()) {
			throw new Exception("ī�װ� �˻� ����");
		}
		return list;
	}

	@Override
	public List<DataDTO> dataSelectAll(String dataCategory) throws Exception {
		List<DataDTO> list = dataDAO.dataSelectAll(dataCategory);
		if(list == null || list.isEmpty()) {
			throw new Exception("ī�װ��� ���� ��ǰ�˻� ����");
		}
		return list;
	}

	
}
