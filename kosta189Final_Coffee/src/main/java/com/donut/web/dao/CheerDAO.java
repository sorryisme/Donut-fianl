package com.donut.web.dao;

import java.util.List;

import com.donut.web.dto.CheerDTO;

public interface CheerDAO {

	public List<CheerDTO> selectByAll(int cheerProjectNo) throws Exception;
	
	public int cheerInsert(CheerDTO cheerDTO) throws Exception;
	
	public int cheerReplyInsert(CheerDTO cheerDTO) throws Exception;
	
	//수정을 위한 검색
	public CheerDTO cheerSelectByNo(int cheerNoz) throws Exception;
	
	public int cheerUpdate(CheerDTO cheerDTO) throws Exception;
	
	public int cheerDelete(String id, int cheerNo, int cheerParentNo) throws Exception;
	
	public boolean cheerDuplicatedById(String id, int projectNo) throws Exception;
}
