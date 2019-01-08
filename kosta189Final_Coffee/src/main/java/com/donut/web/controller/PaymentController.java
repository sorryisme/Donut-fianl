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
		System.out.println("paymentGiveSetting 출력");

		List<GiveItemDTO> giveItem = giveDTO.getGiveItem();

		if (giveItem != null) // 물품기부라면
		{
			Iterator<GiveItemDTO> iter = giveItem.iterator();
			while (iter.hasNext())
			{
				GiveItemDTO dto = iter.next();

				if (dto.getGiveItemAmount() == 0) // 물품이 수량 0인게 있으면 삭제
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

				giveMoney = giveMoney + amount * price; //기부한 물품들의 총 가격
			}

			giveDTO.setGiveItem(giveItem);
			giveDTO.setGiveMoney(giveMoney);
		}

		// 금액/물품 설정한 것
		model.addAttribute("giveDTO", giveDTO);

		// 주소 설정으로
		return "payment/paymentGiveSetting";
	}

	@RequestMapping("/paymentGive")
	public String paymentGive(GiveDTO giveDTO, PaymentDTO paymentDTO, Model model)
	{
		System.out.println("paymentGive 출력");

		// 금액,주소 설정한 것
		giveDTO.setPayment(paymentDTO);
		model.addAttribute("giveDTO", giveDTO);

		return "payment/paymentGive";
	}

	@RequestMapping("/paymentComplete")
	public void paymentComplete(@RequestBody GiveDTO giveDTO, HttpServletRequest request)
	{
		System.out.println("paymentComplete 출력");

		paymentService.insertPayment(giveDTO);
		
	}

}
