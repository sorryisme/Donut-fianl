package com.donut.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.donut.web.dto.BoardPager;
import com.donut.web.dto.NoticeDTO;
import com.donut.web.service.NoticeService;
import com.sun.corba.se.impl.protocol.BootstrapServerRequestDispatcher;

@Controller
@RequestMapping("notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("noticeList")
	public String noticeList(Model model, 
			@RequestParam(defaultValue="title") String searchOption,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage
			) throws Exception {
		try {
			//레코드의 갯수 계산
			int count = noticeService.countArticle(searchOption, keyword);
			
			//페이지 나누기 관련 처리
			BoardPager boardPager = new BoardPager(count, curPage);
			int start = boardPager.getPageBegin();
			int end = boardPager.getPageEnd();
		
			List<NoticeDTO> noticeList = noticeService.noticeSelectAll(start, end, searchOption, keyword);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", noticeList);
			map.put("count", count);
			map.put("boardPager", boardPager);
			
			model.addAttribute("map", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "notice/noticeList";
	}
	
	/**
	 * 상세보기
	 * @throws Exception 
	 * */
	@RequestMapping("noticeRead")
	public String noticeRead(int noticeNo, Model model) throws Exception {
		System.out.println("noticeRead 출력");
		try {
			NoticeDTO notice = noticeService.noticeSelectByNo(noticeNo);
			model.addAttribute("noticeDTO", notice); //""가 무슨타입으로 보내주는가, notice가 뭘 보내는가
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "notice/noticeRead";
	}
	
	@RequestMapping("noticeInsertForm")
	public String noticeInsertForm() {
		System.out.println("noticeInsertForm 출력");
		return "notice/noticeInsertForm";
	}
	
	@RequestMapping("noticeInsert")
	public String noticeInsert(NoticeDTO noticeDTO) throws Exception{
		try {
			noticeService.noticeInsert(noticeDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:noticeList";
	}
	
	@RequestMapping("noticeUpdateForm")
	public String noticeUpdateForm(int noticeNo,Model model) throws Exception {
		System.out.println("noticeUpdateForm 출력");
		NoticeDTO notice = noticeService.noticeSelectByNo(noticeNo);
		model.addAttribute("noticeDTO", notice);
		return "notice/noticeUpdateForm";
	}
	
	@RequestMapping("noticeUpdate")
	public String noticeUpdate(NoticeDTO noticeDTO, Model model) throws Exception{
		try {
			NoticeDTO noticeDTOAfterUpdate = noticeService.noticeUpdate(noticeDTO);
			model.addAttribute("noticeDTO", noticeDTOAfterUpdate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "notice/noticeRead";
	}
	
	@RequestMapping("noticeDelete")
	public String noticeDelete(int noticeNo) throws Exception{
		noticeService.noticeDelete(noticeNo);
		return "redirect:noticeList";
	}
	
	/*@RequestMapping("/noticeCheck")
	public String noticeCheck() {
		return "notice/noticecheck";
	}*/
	
	
}
