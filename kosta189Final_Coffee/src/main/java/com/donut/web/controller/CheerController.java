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
	
		// 댓글 등록
		@RequestMapping("cheerInsert")
		public String cheerInsert(HttpSession session, Model model, CheerDTO cheerDTO) {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
			cheerDTO.setId(memberDTO.getId());
			
			boolean duplicateResult = cheerDuplicatedById(cheerDTO.getId(),cheerDTO.getProjectNo());
			if(duplicateResult==false) {//등록된 댓글이 없으면
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
					duplicatedResult.put("message", "댓글은 하나만 등록할 수 있습니다.");
					duplicatedResult.put("result", true);
				}else {
					duplicatedResult.put("message", "등록되었습니다.");
					duplicatedResult.put("result", false);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return duplicatedResult;
		}

		// 대댓글 DB에 등록
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

		// 댓글 수정하기 위해 번호 찾아옴
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

		// 댓글 수정
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
			updateResult.put("message", "수정되었습니다.");
			return updateResult;
		}

		// 댓글삭제
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
					deleteResult.put("message", "삭제되었습니다.");
				} else {
					deleteResult.put("message", "본인 댓글만 삭제할 수 있습니다.");
				}
				
				} catch (Exception e) {
				e.printStackTrace();
			}
			return deleteResult; 
	}


		// 이미 댓글에 해당 아이디가 존재하는지 확인
		public boolean cheerDuplicatedById(String id, int projectNo) { // id에 session 아이디 넣으면 된다.(함수 부를 때)
			
			boolean duplicatedResult = false;
			try {
				duplicatedResult = cheerService.cheerDuplicatedById(id, projectNo);

			} catch (Exception e) {
				e.printStackTrace();
			}
			return duplicatedResult;
		}	
}
