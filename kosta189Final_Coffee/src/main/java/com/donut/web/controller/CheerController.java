package com.donut.web.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.donut.web.dto.CheerDTO;
import com.donut.web.dto.MemberDTO;
import com.donut.web.service.CheerService;



@Controller
@RequestMapping("/cheer")
public class CheerController {


	CheerDTO result;
	int parentNo;
	
	@Autowired
	private CheerService cheerService;
	
		// ��� ���
		@RequestMapping("cheerInsert")
		public String cheerInsert(HttpSession session, Model model, CheerDTO cheerDTO) {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
			cheerDTO.setId(memberDTO.getId());
			
			boolean duplicateResult = cheerDuplicatedById(cheerDTO.getId(),cheerDTO.getProjectNo());
			if(duplicateResult==false) {//��ϵ� ����� ������
					try {
						if(cheerService.cheerInsert(cheerDTO)==1) {
							return "redirect:/project/projectRead?projectNo="+cheerDTO.getProjectNo()+"#cheer";
						}
					} catch (Exception e) {
		
						e.printStackTrace();
					}
			}else {
				
			}
			return "redirect:/project/projectRead?projectNo="+cheerDTO.getProjectNo()+"#cheer";
		}


		@RequestMapping("cheerInsertAjax")
		@ResponseBody
		public Object cheerInsertAjax(HttpSession session, int projectNo) {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
			Map<String,Object> duplicatedResult = new HashMap<>();
			try { 
				 if(cheerService.cheerDuplicatedById(memberDTO.getId(), projectNo) || memberDTO.getStatusFlag()==0) {
					duplicatedResult.put("message", "����� �ϳ��� ����� �� �ֽ��ϴ�.");
					duplicatedResult.put("result", true);
				}else {
					duplicatedResult.put("message", "��ϵǾ����ϴ�.");
					duplicatedResult.put("result", false);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return duplicatedResult;
		}

		// ���� DB�� ���
		@RequestMapping("cheerReplyInsert")
		public String cheerReplyInsert(HttpSession session, CheerDTO cheerDTO) {
			cheerDTO.setCheerParentNo(cheerDTO.getCheerNo());
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
			cheerDTO.setId(memberDTO.getId());
			
			try {
				if(cheerService.cheerReplyInsert(cheerDTO)==1)
					
					return "redirect:/project/projectRead?projectNo="+cheerDTO.getProjectNo()+"#cheer";
			
			} catch (Exception e) {
				e.printStackTrace();
			}

			return "cheer/cheerInsertForm"; 
		}	

		// ��� �����ϱ� ���� ��ȣ ã�ƿ�
		@RequestMapping("/cheerUpdateForm")	
		@ResponseBody
		public CheerDTO cheerUpdateForm(@RequestParam("cheerNo") int cheerNo) {
			
			try {
				result = cheerService.cheerSelectByNo(cheerNo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}

		// ��� ����
		@RequestMapping("cheerUpdate")
		@ResponseBody
		public Object cheerUpdate(@RequestParam("cheerContent") String cheerContent, CheerDTO cheerDTO) {

			cheerDTO = result;
			
			cheerDTO.setCheerContent(cheerContent);
			
			try {
				cheerService.cheerUpdate(cheerDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}


			Map<String,Object> updateResult = new HashMap<>();
			updateResult.put("message", "�����Ǿ����ϴ�.");
			return updateResult;
		}

		// ��ۻ���
		@RequestMapping("cheerDelete")
		@ResponseBody
		public Object cheerDelete(HttpSession session, String id, @RequestParam("cheerNo") int cheerNo,  @RequestParam("cheerParentNo") int cheerParentNo,@RequestParam("projectNo") int projectNo) {
			Map <String, Object> deleteResult = new HashMap<>();
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
			id=memberDTO.getId(); 
			
			int delete_success=0;
			try {
				delete_success = cheerService.cheerDelete(id, cheerNo, cheerParentNo);
				
				if(delete_success != 0) {
					deleteResult.put("message", "�����Ǿ����ϴ�.");
				} else {
					deleteResult.put("message", "���� ��۸� ������ �� �ֽ��ϴ�.");
				}
				
				} catch (Exception e) {
				e.printStackTrace();
			}
			return deleteResult; 
	}


		// �̹� ��ۿ� �ش� ���̵� �����ϴ��� Ȯ��
		public boolean cheerDuplicatedById(String id, int projectNo) { // id�� session ���̵� ������ �ȴ�.(�Լ� �θ� ��)
			
			boolean duplicatedResult = false;
			try {
				duplicatedResult = cheerService.cheerDuplicatedById(id, projectNo);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return duplicatedResult;
		}	
}
