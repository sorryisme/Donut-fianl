package com.donut.web.service;

import com.donut.web.dto.GiveDTO;

public interface GiveService {

	public int giveMoneyInsert(GiveDTO giveDTO) throws Exception;
	
	public int giveItemInsert(GiveDTO giveDTO) throws Exception;
}
