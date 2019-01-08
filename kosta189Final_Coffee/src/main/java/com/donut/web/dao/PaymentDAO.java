package com.donut.web.dao;

import java.util.List;

import com.donut.web.dto.GiveDTO;
import com.donut.web.dto.GiveItemDTO;
import com.donut.web.dto.ItemDTO;
import com.donut.web.dto.PaymentDTO;
import com.donut.web.dto.ProjectDTO;

public interface PaymentDAO
{
	public int updateAccMoney(String id, int giveMoney);
	
	public int insertGive(GiveDTO giveDTO);
	
	public int selectLastGiveNo();
	
	public int insertPayment(PaymentDTO paymentDTO);
	
	public ProjectDTO selectProject(int projectNo);
	
	public int updateAfterPayment(GiveDTO giveDTO, ProjectDTO projectDTO);

	public int insertAfterItemPayment(List<GiveItemDTO> giveItemDTOList, int giveNo);
	
	public List<ItemDTO> selectProjectItems(int projectNo);
	
	public int updateAfterItemPayment(List<ItemDTO> itemDTOList, List<GiveItemDTO> giveItemDTOList, int giveNo);

	public int alreadyPaid(String id);

}
