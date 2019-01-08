package com.donut.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.donut.web.dto.CompanyListDTO;
import com.donut.web.dto.CurveChartDTO;
import com.donut.web.dto.MemberListDTO;
import com.donut.web.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController
{
	@Autowired
	private AdminService adminService;

	@RequestMapping("/adminPage")
	public String adminPage(Model model)
	{
		List<CompanyListDTO> companyList = adminService.selectCompany();
		List<MemberListDTO> memberList = adminService.selectMember();
		int today = adminService.selectToday();
		int week = adminService.selectWeek();
		List<CurveChartDTO> curveList = adminService.curveList();
		
		model.addAttribute("companyList", companyList);
		model.addAttribute("memberList", memberList);
		model.addAttribute("today", today);
		model.addAttribute("week", week);
		model.addAttribute("curveList", curveList);

		return "admin/adminPage";
	}
	
	
	@RequestMapping("/chart")
	@ResponseBody
	public List<Map<String, Object>> reviewRead(HttpServletRequest request, Model model)
	{
		String date = request.getParameter("date");
		
		List<Map<String, Object>> list = adminService.oneDayTotal(date);
		return list;
	}
	
	@RequestMapping("/delete")
	public String SelectCompany(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		
		adminService.updateDropFlag(id);
		return "redirect:/admin/adminPage";
	}
	
}
