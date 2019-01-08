package com.donut.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.donut.web.dto.DataDTO;
import com.donut.web.service.DataService;

@Controller
@RequestMapping("/data")
public class DataController {

	@Autowired
	DataService dataService;
	
	//카테고리 셀렉트 박스에 추가
	@RequestMapping("/dataSelectForm")
	public String dataSelectForm(Model model) {
		try {
			List<String> list =dataService.dataSelectCategory();
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "data/dataSelectForm";
	}
	
	@RequestMapping("/dataSelectAll")
	@ResponseBody
	public List<DataDTO> dataSelectAll(String dataCategory) {
		List<DataDTO> result =null;
		try {
		result = dataService.dataSelectAll(dataCategory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
