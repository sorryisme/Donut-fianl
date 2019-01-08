package com.donut.web.service;

import java.util.List;

import com.donut.web.dto.CheerDTO;

public interface CheerService {

	public List<CheerDTO> selectByAll(int cheerProjectNo) throws Exception;
	
	public int cheerInsert(CheerDTO cheerDTO) throws Exception;
	
	public int cheerReplyInsert(CheerDTO cheerDTO) throws Exception;
	
	//������ ���� �˻�
	public CheerDTO cheerSelectByNo(int cheerNo) throws Exception;
	
	public int cheerUpdate(CheerDTO cheerDTO) throws Exception;
	
	public int cheerDelete(String id, int cheerNo, int cheerParentNo) throws Exception;
	
	public boolean cheerDuplicatedById(String id, int projectNo) throws Exception;
}
