package com.donut.web.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.donut.web.dto.GiveDTO;
import com.donut.web.dto.GiveItemDTO;
import com.donut.web.dto.PaymentDTO;
import com.donut.web.service.PaymentService;

@Controller
@RequestMapping("/payment")
public class PaymentController
{
	@Autowired
	private PaymentService paymentService;

	@RequestMapping("/paymentGiveSetting")
	public String paymentGiveSetting(GiveDTO giveDTO, Model model)
	{
		System.out.println("paymentGiveSetting ���");

		List<GiveItemDTO> giveItem = giveDTO.getGiveItem();

		if (giveItem != null) // ��ǰ��ζ��
		{
			Iterator<GiveItemDTO> iter = giveItem.iterator();
			while (iter.hasNext())
			{
				GiveItemDTO dto = iter.next();

				if (dto.getGiveItemAmount() == 0) // ��ǰ�� ���� 0�ΰ� ������ ����
				{
					iter.remove();
				}
			}

			int index = giveItem.size();
			int giveMoney = 0;

			for (int i = 0; i < index; i++)
			{
				int amount = giveItem.get(i).getGiveItemAmount();
				int price = giveItem.get(i).getGiveItemPrice();

				giveMoney = giveMoney + amount * price; //����� ��ǰ���� �� ����
			}

			giveDTO.setGiveItem(giveItem);
			giveDTO.setGiveMoney(giveMoney);
		}

		// �ݾ�/��ǰ ������ ��
		model.addAttribute("giveDTO", giveDTO);

		// �ּ� ��������
		return "payment/paymentGiveSetting";
	}

	@RequestMapping("/paymentGive")
	public String paymentGive(GiveDTO giveDTO, PaymentDTO paymentDTO, Model model)
	{
		System.out.println("paymentGive ���");

		// �ݾ�,�ּ� ������ ��
		giveDTO.setPayment(paymentDTO);
		model.addAttribute("giveDTO", giveDTO);

		return "payment/paymentGive";
	}

	@RequestMapping("/paymentComplete")
	public void paymentComplete(@RequestBody GiveDTO giveDTO, HttpServletRequest request)
	{
		System.out.println("paymentComplete ���");

		paymentService.insertPayment(giveDTO);
		
	}

}
