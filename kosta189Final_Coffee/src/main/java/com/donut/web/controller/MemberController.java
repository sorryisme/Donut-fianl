package com.donut.web.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.donut.web.dto.FavoriteDTO;
import com.donut.web.dto.MemberDTO;
import com.donut.web.dto.ProjectDTO;
import com.donut.web.dto.QnADTO;
import com.donut.web.dto.ReceiptDTO;
import com.donut.web.service.CheerService;
import com.donut.web.service.FacebookService;
import com.donut.web.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	@Autowired
	private FacebookService facebookService;
	@Autowired
	private CheerService cheerService;
	
	private String path = "resources/finalPhoto/member";
	// ȸ������
	@RequestMapping("/write")
	public String signUp(HttpSession session, MemberDTO memberDTO) throws Exception {
		if (memberService.memberDuplicatedById(memberDTO.getId())) {

			//����÷��
			MultipartFile file = memberDTO.getFile();

				String realPath = session.getServletContext().getRealPath("/") + path;
				if (file.getSize() > 0) {
				String fileName = file.getOriginalFilename();

				memberDTO.setPicture(fileName);
				file.transferTo(new File(realPath + "/" + fileName));
			}

			memberDTO.setStatusFlag(1);//����ȸ�� �����÷���

			memberService.MemberInsert(memberDTO);


		} else {
			System.out.println("ȸ�����Կ� �����Ͽ����ϴ�.");
		}

		return "redirect:/member/login";
	}

	// ȸ��������
	@RequestMapping("/signUp")
	public void signUpForm(HttpSession session) {
	}

	// ���̵� �ߺ�üũ
	@RequestMapping("/idCheck")
	@ResponseBody
	public Object idCheck(String id) throws Exception {
		String result;
		System.out.println(id);
		if (memberService.memberDuplicatedById(id)) {
			result = "success";
		} else {
			result = "nope";
		}


		return result;
	}

	// �α�����
	@RequestMapping("/login")
	public String loginForm() {
		return "member/login";
	}

	// �α���
	@RequestMapping("/loginCheck")
	public String login(MemberDTO memberDTO, HttpSession session, Model model) throws Exception {

		MemberDTO dbDTO = memberService.memberSelectByIdPwd(memberDTO.getId(), memberDTO.getPwd());
		
		if(dbDTO==null)
		{
			String loginError = "�ùٸ� ���̵�� ��й�ȣ�� �Է��ϼ���.";
			model.addAttribute("loginError", loginError);
			
			return "member/login";
		}
		
		if (session != null) {
			session.setAttribute("userDTO", dbDTO);// jsp���� Ȯ���ϰ������ ${userDTO}�ϸ��

			if(memberService.Alarm(dbDTO.getId())!=0) { //���ο� �˶��� ������ : Cheer
				session.setAttribute("newAlarm", 1);
			}else {
				session.setAttribute("newAlarm", 0);
			}
			
			if(memberService.qnaAlarm(memberDTO.getId())!=0) { //���ο� ��۾˶��� ������ : QnA
				session.setAttribute("qnaNewAlarm", 1);
			}else {
				session.setAttribute("qnaNewAlarm", 0);
			}
			
		
		}	
		System.out.println("login ����");

		return "redirect:/";
	}
	
	// �������������� ������� ������ ajax�۵��ؼ� notify�� Ȯ������
		@RequestMapping("/alarmCheck")
		@ResponseBody
		public int alarmCheck(HttpSession session) throws Exception{
			int alarmExist;
			
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
			
			if(memberService.Alarm(memberDTO.getId())!=0) { //���ο� ��۾˶��� ������
				session.setAttribute("newAlarm", 1);
					if(memberService.Alarm(memberDTO.getId())==1) { //��� �ϳ� ����������
						alarmExist = 0; //������ ���� : ���� ���� ����� ����.
					}else {
						alarmExist = 1; // ���� ����� �����ִ�.
					}
			}else {
				session.setAttribute("newAlarm", 0);
				alarmExist = 0; // ���� ���� ����� ����.
			}
			
			if(memberService.qnaAlarm(memberDTO.getId())!=0) { //���ο� ��۾˶��� ������
				session.setAttribute("qnaNewAlarm", 1);
					if(memberService.qnaAlarm(memberDTO.getId())==1) {
						alarmExist = 2;
					}else {
						alarmExist = 3;
					}
			}else {
				session.setAttribute("qnaNewAlarm", 0);
				alarmExist = 2;
			}
			
			return alarmExist;
		}
	
	

	// API�� �α��� īī����
		@RequestMapping("/loginAPI")
		@ResponseBody
		public Object loginAPI(MemberDTO memberDTO,HttpSession session) {
			Map <String, Object> result = new HashMap<>();
			result.put("status","fail");

			try {
			//true�� ���̵��� �̹� �ִ�. 
			// ���̵� ���ٸ� ���Խ��� => status = signUp
			if(memberService.memberDuplicatedById(memberDTO.getId())) {
				memberDTO.setStatusFlag(1);
				memberService.MemberInsert(memberDTO);
				session.setAttribute("userDTO",memberDTO);
				result.put("status","login");
			} else {
				MemberDTO dbDTO = memberService.memberSelectById(memberDTO.getId());
				if(dbDTO != null) {
					session.setAttribute("userDTO",dbDTO);
					result.put("status","login");
				} else if (session.getAttribute("userDTO") != null) {
					result.put("status","alreadyLogin");
				}
			}
			
			}catch (Exception e) {
				e.printStackTrace();
			}
			// ��� ���¸� �������ٸ� status - fail
			return result;
		}
		
		//���̽��� �α���
		
		 @RequestMapping("/facebookLogin")
		 @ResponseBody
		    public Object facebookLogin(String accessToken,HttpSession session,Model model) {
		        try {
		            Map userInfo = facebookService.me(accessToken, Map.class);
		            MemberDTO memberDTO = memberService.memberSelectById((String)userInfo.get("id"));
		            
		            if (memberDTO == null) {
		            	memberDTO = new MemberDTO();
		            	memberDTO.setId((String)userInfo.get("id"));
		            	memberDTO.setEmail((String)userInfo.get("email"));
		            	memberDTO.setName((String)userInfo.get("name"));
		            	memberDTO.setStatusFlag(1);
		                memberService.MemberInsert(memberDTO);
		            }
		            // ȸ�� ������ ���ǿ� �����Ͽ� �ڵ� �α��� ó���� �Ѵ�.
		            session.setAttribute("userDTO",memberDTO);
		            HashMap<String,Object> result = new HashMap<>();
		            result.put("status", "login");
		            return result;
		        } catch (Exception e) {
		            HashMap<String,Object> result = new HashMap<>();
		            result.put("status", "fail");
		            return result;
		        }
		    }
	// �α׾ƿ�
	@RequestMapping("/logOut")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	//ȸ��Ż��
	@RequestMapping("/memberDelete")
	public String memberDelete(MemberDTO memberDTO,HttpSession session) {
		try {
			memberService.memberDelete(memberDTO);
			session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}

	//ȸ��Ż�� �� ��й�ȣ Ȯ��
	@RequestMapping("/pwdCheck")
	public String pwdCheck() {
		return "member/pwdCheck";
	}

	//����� ����������
	@RequestMapping("/memberMypage")
	public String memberMypage(HttpSession session, Model model) {
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
			memberDTO= memberService.memberSelectById(memberDTO.getId());
			model.addAttribute("member", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/memberUpdateForm";
	}

	//����� ���������� �������
	@RequestMapping("/memberCheer")
	public String memberCheer(HttpSession session,Model model) {
		List<CheerDTO> list;
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
		String id = memberDTO.getId();
		try {
			list = memberService.memberSelectByCheer(id);
			model.addAttribute("cheerList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "member/memberCheer";
	}
	
	@RequestMapping("/memberCheerNotify")
	public String memberCheerNotify(@RequestParam("cheerNo") int cheerNo) {

		memberService.memberUpdateNotify(cheerNo);
		
		return "redirect:/memberCheer";
	}

	//����� ���������� QnA
	@RequestMapping("/memberQnA")
	public String memberQnA(HttpSession session,Model model) {
		List<QnADTO> qnaList;
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
		String id = memberDTO.getId();
		try {
			qnaList = memberService.memberSelectByQnA(id);
			model.addAttribute("qnaList", qnaList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/memberQnA";
	}
	
	@RequestMapping("/memberQnANotify")
	public String memberQnANotify(@RequestParam("qnaNo") int qnaNo) {

		memberService.memberUpdateQnANotify(qnaNo);
		
		return "redirect:/memberQnA";
	}


	//����� ���������� ȸ������ ������
	@RequestMapping("/memberUpdateForm")
	public String memberUpdateForm(HttpSession session, Model model) {
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
			memberDTO= memberService.memberSelectById(memberDTO.getId());
			model.addAttribute("member", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/memberUpdateForm";
	}

	//����� ���������� ȸ������ ��������
	@RequestMapping("/memberUpdate")
	public String memberUpdate(HttpSession session, MemberDTO memberDTO, String pwdNew, Model model) {
			MultipartFile file = memberDTO.getFile();
		try {
			System.out.println("pwdNew = " + pwdNew);
			if(pwdNew != null)
			{
				System.out.println("memberDTO.getId() = " + memberDTO.getId());
				System.out.println("memberDTO.getPwd() = " + memberDTO.getPwd());
				int pwdUpdated = memberService.pwdUpdate(memberDTO.getId(), memberDTO.getPwd(), pwdNew);
				memberDTO.setPwd(pwdNew);
				
				if(pwdUpdated==0)
					model.addAttribute("updated", "false");
			}
			
			
			String realPath = session.getServletContext().getRealPath("/") + path;
			if (file.getSize() > 0) {
				String fileName = file.getOriginalFilename();

				memberDTO.setPicture(fileName);
				file.transferTo(new File(realPath + "/" + fileName));
			}
			
			int updated = memberService.memberUpdate(memberDTO);
			if(updated==0)
				model.addAttribute("updated", "false");
			
			memberDTO= memberService.memberSelectById(memberDTO.getId());
			model.addAttribute("member", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "member/memberUpdateForm";
	}

	//����� ���������� ���ã��
		@RequestMapping("/memberFavorite")
		public String memberFavorite(HttpSession session,String id,Model model) {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
			try {
				
			    ProjectDTO projectDTO = new ProjectDTO();
	           List<FavoriteDTO> list = memberService.memberFavoriteList(memberDTO.getId());
	           model.addAttribute("memberfavorite",list);
	           model.addAttribute("project",projectDTO);
	        } catch (Exception e) {
	        
	            e.printStackTrace();
	        }
			
			return "member/memberFavorite";
		}
		
		//����� ���������� ���ã�� ����
		@RequestMapping(value ="/memberFavoriteDelete", method = RequestMethod.POST)
		@ResponseBody
		public int memberFavoriteDelete(FavoriteDTO favoriteDTO,HttpSession session) {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
			int result=0;
			
		    try {
		        favoriteDTO.setId(memberDTO.getId());
	            result = memberService.memberFavoriteDelete(favoriteDTO);
	        } catch (Exception e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
		    
		    return result;
		}
	//����� ���������� ������
	@RequestMapping("/memberReceipt")
	public String memberReceipt(HttpSession session, Model model) {
		try {
			MemberDTO memberDTO= (MemberDTO)session.getAttribute("userDTO");
			List<ReceiptDTO> receiptList = memberService.memberReceiptList(memberDTO.getId());
			model.addAttribute("receiptList", receiptList );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "member/memberReceipt";
	}
	
	//������ ����� ���� �޼���
		@RequestMapping("/receipt")
		public String receipt(HttpSession session, Model model) {
			try {
				MemberDTO memberDTO= (MemberDTO)session.getAttribute("userDTO");
				List<ReceiptDTO> receiptList = memberService.memberReceiptList(memberDTO.getId());
				model.addAttribute("receiptList", receiptList );
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "member/receipt";
		}

	//����� ���������� �����Ȳ
	@RequestMapping("/memberGive")
	public String memberGive(Model model,HttpSession session) {
		try {
			MemberDTO memberDTO= (MemberDTO)session.getAttribute("userDTO");
			List<ProjectDTO>projectList = memberService.memberGiveList(memberDTO.getId());
			model.addAttribute("projectList", projectList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "member/memberGive";
	}
	
	@RequestMapping("/password")
	public void password() {}

}
