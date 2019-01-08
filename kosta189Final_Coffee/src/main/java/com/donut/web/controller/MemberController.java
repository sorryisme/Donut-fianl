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
	// 회원가입
	@RequestMapping("/write")
	public String signUp(HttpSession session, MemberDTO memberDTO) throws Exception {
		if (memberService.memberDuplicatedById(memberDTO.getId())) {

			//파일첨부
			MultipartFile file = memberDTO.getFile();

				String realPath = session.getServletContext().getRealPath("/") + path;
				if (file.getSize() > 0) {
				String fileName = file.getOriginalFilename();

				memberDTO.setPicture(fileName);
				file.transferTo(new File(realPath + "/" + fileName));
			}

			memberDTO.setStatusFlag(1);//개인회원 상태플래그

			memberService.MemberInsert(memberDTO);


		} else {
			System.out.println("회원가입에 실패하였습니다.");
		}

		return "redirect:/member/login";
	}

	// 회원가입폼
	@RequestMapping("/signUp")
	public void signUpForm(HttpSession session) {
	}

	// 아이디 중복체크
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

	// 로그인폼
	@RequestMapping("/login")
	public String loginForm() {
		return "member/login";
	}

	// 로그인
	@RequestMapping("/loginCheck")
	public String login(MemberDTO memberDTO, HttpSession session, Model model) throws Exception {

		MemberDTO dbDTO = memberService.memberSelectByIdPwd(memberDTO.getId(), memberDTO.getPwd());
		
		if(dbDTO==null)
		{
			String loginError = "올바른 아이디와 비밀번호를 입력하세요.";
			model.addAttribute("loginError", loginError);
			
			return "member/login";
		}
		
		if (session != null) {
			session.setAttribute("userDTO", dbDTO);// jsp에서 확인하고싶으면 ${userDTO}하면됨

			if(memberService.Alarm(dbDTO.getId())!=0) { //새로운 알람이 있으면 : Cheer
				session.setAttribute("newAlarm", 1);
			}else {
				session.setAttribute("newAlarm", 0);
			}
			
			if(memberService.qnaAlarm(memberDTO.getId())!=0) { //새로운 댓글알람이 있으면 : QnA
				session.setAttribute("qnaNewAlarm", 1);
			}else {
				session.setAttribute("qnaNewAlarm", 0);
			}
			
		
		}	
		System.out.println("login 실행");

		return "redirect:/";
	}
	
	// 마이페이지에서 응원댓글 누를때 ajax작동해서 notify값 확인해줌
		@RequestMapping("/alarmCheck")
		@ResponseBody
		public int alarmCheck(HttpSession session) throws Exception{
			int alarmExist;
			
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("userDTO");
			
			if(memberService.Alarm(memberDTO.getId())!=0) { //새로운 댓글알람이 있으면
				session.setAttribute("newAlarm", 1);
					if(memberService.Alarm(memberDTO.getId())==1) { //댓글 하나 남아있으면
						alarmExist = 0; //누르는 순간 : 이제 남은 댓글이 없다.
					}else {
						alarmExist = 1; // 아직 댓글이 남아있다.
					}
			}else {
				session.setAttribute("newAlarm", 0);
				alarmExist = 0; // 원래 남은 댓글이 없다.
			}
			
			if(memberService.qnaAlarm(memberDTO.getId())!=0) { //새로운 댓글알람이 있으면
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
	
	

	// API로 로그인 카카오톡
		@RequestMapping("/loginAPI")
		@ResponseBody
		public Object loginAPI(MemberDTO memberDTO,HttpSession session) {
			Map <String, Object> result = new HashMap<>();
			result.put("status","fail");

			try {
			//true면 아이디값이 이미 있다. 
			// 아이디가 없다면 가입실행 => status = signUp
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
			// 모든 상태를 지나갔다면 status - fail
			return result;
		}
		
		//페이스북 로그인
		
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
		            // 회원 정보를 세션에 저장하여 자동 로그인 처리를 한다.
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
	// 로그아웃
	@RequestMapping("/logOut")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	//회원탈퇴
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

	//회원탈퇴 전 비밀번호 확인
	@RequestMapping("/pwdCheck")
	public String pwdCheck() {
		return "member/pwdCheck";
	}

	//기부자 마이페이지
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

	//기부자 마이페이지 응원댓글
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

	//기부자 마이페이지 QnA
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


	//기부자 마이페이지 회원정보 수정폼
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

	//기부자 마이페이지 회원정보 수정진행
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

	//기부자 마이페이지 즐겨찾기
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
		
		//기부자 마이페이지 즐겨찾기 삭제
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
	//기부자 마이페이지 영수증
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
	
	//영수증 출력을 위한 메서드
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

	//기부자 마이페이지 기부현황
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
