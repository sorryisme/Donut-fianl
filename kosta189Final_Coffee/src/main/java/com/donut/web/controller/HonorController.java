package com.donut.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.donut.web.dto.MemberDTO;
import com.donut.web.service.HonorService;

@Controller
@RequestMapping("honor")
public class HonorController {
	
	@Autowired
	private HonorService honorService;

	@RequestMapping("/honorList")
	public String honorList(Model model) throws Exception {
		System.out.println("honorList 출력");
		try {
			List<MemberDTO> memberList = honorService.honorSelectAll();
			String countProject = honorService.countProject();
			String totalGiveMoney = honorService.totalGiveMoney();
			
			model.addAttribute("list",memberList);
			model.addAttribute("countProject", countProject);
			model.addAttribute("totalGiveMoney",totalGiveMoney);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "honor/honorList";
	}
	
	@RequestMapping("/honorInsertForm")
	public String honorInsertForm() {
		System.out.println("honorInsertForm 출력");
		return "honor/honorInsertForm";
	}
	
}
