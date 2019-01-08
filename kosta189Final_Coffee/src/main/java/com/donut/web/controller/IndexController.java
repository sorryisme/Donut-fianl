package com.donut.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.donut.web.dto.ProjectDTO;
import com.donut.web.service.IndexService;

@Controller

public class IndexController
{
	@Autowired
	private IndexService indexService; // 서비스 연결

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model)
	{
		
		String countProject = indexService.countProject();
		String countMemberOne = indexService.countMemberOne();
		String countMemberTwo = indexService.countMemberTwo();
		
		List<ProjectDTO> percentList = indexService.almostDonePercent();
		List<ProjectDTO> recentList = indexService.recentRegister();
		List<ProjectDTO> deadlineList = indexService.almostDeadline();
		List<ProjectDTO> recommendList = indexService.randomRecommend();
		
		model.addAttribute("countProject", countProject);
		model.addAttribute("countMemberOne", countMemberOne);
		model.addAttribute("countMemberTwo", countMemberTwo);
		
		model.addAttribute("percentList", percentList);
		model.addAttribute("recentList", recentList);
		model.addAttribute("deadlineList", deadlineList);
		model.addAttribute("recommendList", recommendList);
		
		return "index";
	}
	
	
	@RequestMapping("/autoComplete")
	@ResponseBody
	public List<ProjectDTO> autoComplete(HttpServletRequest request)
	{
		String keyWord = request.getParameter("keyWord");
		
		List<ProjectDTO> list = indexService.autoComplete(keyWord);
		
		return list;
	}
}
