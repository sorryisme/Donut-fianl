package com.donut.web.dao;

import com.donut.web.dto.GiveDTO;

public interface GiveDAO {

	public int giveMoneyInsert(GiveDTO giveDTO) throws Exception;

	public int giveItemInsert(GiveDTO giveDTO) throws Exception;
}
