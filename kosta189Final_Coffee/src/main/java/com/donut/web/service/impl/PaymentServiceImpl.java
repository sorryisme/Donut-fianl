package com.donut.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.donut.web.dao.PaymentDAO;
import com.donut.web.dto.GiveDTO;
import com.donut.web.dto.GiveItemDTO;
import com.donut.web.dto.ItemDTO;
import com.donut.web.dto.ProjectDTO;
import com.donut.web.service.PaymentService;

@Service
@Transactional
public class PaymentServiceImpl implements PaymentService
{
	@Autowired
	private PaymentDAO paymentDAO;

	@Override
	public int insertPayment(GiveDTO giveDTO)
	{
		paymentDAO.updateAccMoney(giveDTO.getId(), giveDTO.getGiveMoney());
		
		paymentDAO.insertGive(giveDTO);
		
		int giveNo = paymentDAO.selectLastGiveNo();
		giveDTO.getPayment().setGiveNo(giveNo);
		
		paymentDAO.insertPayment(giveDTO.getPayment());
		
		ProjectDTO projectDTO = paymentDAO.selectProject(giveDTO.getProjectNo());
		
		paymentDAO.updateAfterPayment(giveDTO, projectDTO);
		
		
		if(giveDTO.getGiveItem() != null) //물품 기부 일 때 
		{
			List<GiveItemDTO> giveItemDTOList = giveDTO.getGiveItem();
			int projectNo = giveDTO.getProjectNo();

			paymentDAO.insertAfterItemPayment(giveItemDTOList, giveNo);
			
			List<ItemDTO> itemDTOList = paymentDAO.selectProjectItems(projectNo);
			
			paymentDAO.updateAfterItemPayment(itemDTOList, giveItemDTOList, giveNo);
			
		}
		
		return 0;
	}

	@Override
	public int alreadyPaid(String id)
	{
		return paymentDAO.alreadyPaid(id);
	}
	
}
