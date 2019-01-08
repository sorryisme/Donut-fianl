package com.donut.web.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.donut.web.dto.CheerDTO;
import com.donut.web.dto.CompanyDTO;
import com.donut.web.dto.FavoriteDTO;
import com.donut.web.dto.MemberDTO;
import com.donut.web.dto.ProjectDTO;
import com.donut.web.dto.QnADTO;
import com.donut.web.dto.ReviewDTO;
import com.donut.web.service.CheerService;
import com.donut.web.service.CompanyService;
import com.donut.web.service.PaymentService;
import com.donut.web.service.ProjectService;
import com.donut.web.service.QnAService;
import com.donut.web.service.ReviewService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	private ProjectService projectService;
	@Autowired
	private CheerService cheerService;
	@Autowired
	private QnAService qnaService;
	@Autowired 
	private ReviewService reviewService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private PaymentService paymentService;
	
	private String path = "resources/finalPhoto/project";

	@RequestMapping("/projectList")
	public String projectList(Model model,String flag) {
		try {
			List<ProjectDTO> list = projectService.projectSelectAll(flag);
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "project/projectList";
	}
	
	
	
	@RequestMapping("/projectRead")
	public String projectRead(HttpSession session, Model model,@RequestParam("projectNo") int projectNo) {
		
		// 한나
		List<CheerDTO> list;
		List<QnADTO> qnaList;
		//한나 끝
		
		try {
			ProjectDTO projectDTO = projectService.projectSelectByNo(projectNo);
			//즐겨찾기 값 세팅
			FavoriteDTO favoriteDTO = new FavoriteDTO();
			favoriteDTO.setProjectNo(projectNo);
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
			CompanyDTO companyDTO = companyService.selectById(projectDTO.getId());
			
			if(memberDTO != null)
			{
				if(paymentService.alreadyPaid(memberDTO.getId()) > 0)
					model.addAttribute("alreadyPaid", "true");
				else
					model.addAttribute("alreadyPaid", "false");
				
				favoriteDTO.setId(memberDTO.getId());
				//즐겨찾기 상태 체크
				boolean flag = projectService.projectFavoriteSelectByNo(favoriteDTO);
	//			boolean updateFlag = projectService.projectDuplicatedById(projectNo,(String)session.getAttribute("id"));
				model.addAttribute("flag", flag);
			}
			//한나
			int cheerprojectNo = projectDTO.getProjectNo();
			list = cheerService.selectByAll(cheerprojectNo);
			qnaList = qnaService.qnaSelectAll(cheerprojectNo);
			//한나끝
			
			model.addAttribute("projectDTO",projectDTO);
			model.addAttribute("favoriteDTO", favoriteDTO);
//			model.addAttribute("updateFlag", updateFlag);
			model.addAttribute("companyDTO",companyDTO);
			
			//리뷰
			ReviewDTO reviewDTO  = reviewService.reviewRead(projectNo);
			model.addAttribute("review",reviewDTO);
			
			//한나
			model.addAttribute("list", list);
			model.addAttribute("qnaList", qnaList);
			//한나끝
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "project/projectRead";
	}
	
	@RequestMapping("/categoryList")
	public String categoryList(Model model, ProjectDTO projectDTO) {
		System.out.println(projectDTO.getCategory1());
		System.out.println(projectDTO.getCategory2());
		System.out.println(projectDTO.getCategory3());
		try {
			List<ProjectDTO> list = projectService.projectSelectByCategory1(projectDTO);
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "project/projectList";
	}
	
	@RequestMapping("/categoryList2")
	public String categoryList2() {
		return "project/categoryList2";
	}
	
	@RequestMapping("/catagoryList3")
	public String catagoryList3() {
		return "project/catagoryList3";
	}
	
	@RequestMapping("/projectFavorite")
	public String projectFavorite() {
		return "project/projectFavorite";
	}
	
	@RequestMapping("/projectInsertForm")
	public String projectInsert() {
		return "project/projectInsertForm";
	}
	
	@RequestMapping("/itemInsert")
	@ResponseBody
	public Object itemInsert(HttpSession session,ProjectDTO projectDTO, String category) {
		
		System.out.println(projectDTO.getReward());
		Map<String, Object> result = new HashMap<>();
		result.put("status", "fail");
		
		String [] categorys = category.split(">");
		projectDTO.setCategory2(categorys[0]);
		projectDTO.setCategory3(categorys[1]);
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");

		MultipartFile file = projectDTO.getFile();
		projectDTO.setId(memberDTO.getId());
		
		
		try{
				
				String realPath = session.getServletContext().getRealPath("/") + path;
				if(file.getSize() > 0 ) {
				projectDTO.setProjectImg(file.getOriginalFilename());
				file.transferTo(new File(realPath + "/" + file.getOriginalFilename()));
				}
				
				
		projectService.ItemInsert(projectDTO);
				
		result.put("status", "success");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@RequestMapping("/moneyInsert")
	@ResponseBody
	public Object moneyInsert(HttpSession session,ProjectDTO projectDTO, String category) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("status", "fail");

		String [] categorys = category.split(">");
		projectDTO.setCategory2(categorys[0]);
		projectDTO.setCategory3(categorys[1]);
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
		
		MultipartFile file = projectDTO.getFile();
		projectDTO.setId(memberDTO.getId());
		
		try { 
			String realPath = session.getServletContext().getRealPath("/") + path;
				if(file.getSize() > 0 ) {
				projectDTO.setProjectImg(file.getOriginalFilename());
				file.transferTo(new File(realPath + "/" + file.getOriginalFilename()));
				}
			
		projectService.MoneyInsert(projectDTO);
		result.put("status", "success");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping("/projectUpdateForm")
	public String projectUpdateForm() {
		return "project/projectUpdateForm";
	}
	
	@RequestMapping("/projectUpdate")
	public String projectUpdate() {
		return "project/projectUpdate";
	}
	
	@RequestMapping("/projectCheck")
	public String projectCheck() {
		return "project/projectCheck";
	}
	
	//즐겨찾기 추가,삭제
	@RequestMapping(value = "/insertFavorite", method = RequestMethod.POST)
	@ResponseBody
	public int insertFavorite(FavoriteDTO favoriteDTO) {
		int result = 0;
		try {
			result = projectService.projectFavoriteInsert(favoriteDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "/deleteFavorite", method = RequestMethod.POST)
	@ResponseBody
	public int deleteFavorite(FavoriteDTO favoriteDTO) {
		int result = 0;

		try {

			result = projectService.projectFavoriteDelete(favoriteDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("projectRead2")
	public String projectRead2()
	{
		System.out.println("projectRead2 출력");
		return "project/projectRead2";
	}
	
}
