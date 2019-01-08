package com.donut.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/give")
public class GiveController {

	@RequestMapping("/giveMoney")
	public String giveMoney() {
		System.out.println("giveMoney ����");
		return "give/giveMoney";
	}
	
	@RequestMapping("/giveItem")
	public String giveItem() {
		System.out.println("giveItem ����");
		return "give/giveItem";
	}
}
