package com.donut.web.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.donut.web.dto.CompanyDTO;
import com.donut.web.dto.MemberDTO;
import com.donut.web.dto.ProjectDTO;
import com.donut.web.service.CompanyService;
import com.donut.web.service.MemberService;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private MemberService memberService;
	
	private String path = "resources/finalPhoto/member";	
	
	//단체회원가입
		@RequestMapping("/companyInsert")
		public String companyInsert(HttpSession session, MemberDTO memberDTO,CompanyDTO companyDTO) throws Exception {
			

			//memberDTO.setId(memberDTO.getCompany().getId());
			memberDTO.setStatusFlag(2);	//기부단체 상태플래그

			MultipartFile file = memberDTO.getFile();

			if (memberService.memberDuplicatedById(memberDTO.getId())) {
				//파일첨부
				String realPath = session.getServletContext().getRealPath("/") + path;
				if (file.getSize() > 0) {
				String fileName = file.getOriginalFilename();

				memberDTO.setPicture(fileName);
				file.transferTo(new File(realPath + "/" + fileName));
			}

				
				memberService.MemberInsert(memberDTO);//왜 여기서 status플래그가 1로 되는거지
				memberDTO.setCompany(companyDTO);
				companyService.companyInsert(memberDTO);


			} else {
				System.out.println("회원가입에 실패하였습니다.");
			}
			
			
			return "redirect:/member/login";
		}
		
		//회원가입폼
		@RequestMapping("/companyInsertForm")
		public String companyInsertForm(HttpSession session) {
			
			return "member/company/companyInsertForm";
		}
	
	//회원가입폼
		@RequestMapping("/companyMypage")
		public String companyMypage(HttpSession session, Model model) {
			

		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
		    memberDTO = companyService.companySelectByid(memberDTO.getId());
		   
		    model.addAttribute("member", memberDTO);
		 
	    } catch (Exception e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
			  
			return "member/company/companyMypage";
		}
		
		@RequestMapping("/companyUpdateForm")
		public String companyUpdateForm() {
			System.out.println("companyUpdateForm 실행");
			return "member/company/companyUpdateForm";
		}
		
		@RequestMapping("/companyUpdate")
		public String companyUpdate(HttpSession session,MemberDTO memberDTO, CompanyDTO company) {
		
			memberDTO.setCompany(company);
			MultipartFile file = memberDTO.getFile();
			
			try {
				String realPath = session.getServletContext().getRealPath("/") + path;
				if (file.getSize() > 0) {
					String fileName = file.getOriginalFilename();

					memberDTO.setPicture(fileName);
					file.transferTo(new File(realPath + "/" + fileName));
				}
				companyService.companyUpdate(memberDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "redirect:/company/companyMypage";
		}
		

	@RequestMapping("/companyProject")
		public String companyProject(HttpSession session, Model model) {
			System.out.println("companyProject 실행");
			
			try {
				 MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
			    List<ProjectDTO> list =companyService.companyProjectSelectAll(memberDTO.getId());
	            model.addAttribute("myProject",list);
	            
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
			return "member/company/companyProject";
		}

	@RequestMapping("/companyDelete")
	public String memberDelete(MemberDTO memberDTO,HttpSession session) {
		try {
			memberService.memberDelete(memberDTO);
			session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	@RequestMapping("/companyAPIForm")
	public String ApiForm() {
		return "member/company/companyAPIForm";
	}
	
}

	