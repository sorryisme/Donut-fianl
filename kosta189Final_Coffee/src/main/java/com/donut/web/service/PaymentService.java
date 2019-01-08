package com.donut.web.service;

import com.donut.web.dto.GiveDTO;
import com.donut.web.dto.PaymentDTO;
import com.donut.web.dto.ProjectDTO;

public interface PaymentService
{
	public int insertPayment(GiveDTO giveDTO);

	public int alreadyPaid(String id);
}
