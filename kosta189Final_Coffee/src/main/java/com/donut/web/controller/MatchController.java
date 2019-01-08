package com.donut.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.donut.web.dto.ProjectDTO;
import com.donut.web.service.MatchService;

@Controller
@RequestMapping("/match")
public class MatchController {
	@Autowired
	private MatchService matchService;

	// 맞춤후원 시작
	@RequestMapping("/matchStart")
	public String matchStart() {
		System.out.println("matchStart 실행");
		return "match/matchStart";
	}

	// 맞춤후원 카테고리1
	@RequestMapping("/matchCategory1")
	public String matchCategory1() {
		System.out.println("matchCategory1 실행");
		return "match/matchCategory1";
	}

	// 맞춤후원 카테고리2
	@RequestMapping("/matchCategory2")
	public String matchCategory2() {
		System.out.println("matchCategory2 실행");
		return "match/matchCategory2";
	}

	// 맞춤후원 카테고리3
	@RequestMapping("/matchCategory3")
	public String matchCategory3() {
		System.out.println("matchCategory3 실행");
		return "match/matchCategory3";
	}

	@RequestMapping("/matchComplete")
	public String matchComplete(HttpServletRequest request, Model model) {
		System.out.println("matchComplete 실행");

		int step01 = Integer.parseInt(request.getParameter("step01"));
		int step02 = Integer.parseInt(request.getParameter("step02"));
		int step03 = Integer.parseInt(request.getParameter("step03"));

		String category1[] = { "금액", "물품" };
		String category2[] = { "아동", "성인", "노인", "동물", "지역 사회" };
		String category3[] = new String[5];

		if (step02 == 0)// 아동
		{
			// 교육 , 소녀/소년 가장, 장애인, 질병/희귀 질환
			// String category3[] = {"교육", "소녀/소년 가장", "장애인", "질병/희귀 질환"};
			category3[0] = "교육";
			category3[1] = "소녀/소년 가장";
			category3[2] = "장애인";
			category3[3] = "질병/희귀 질환";
		} else if (step02 == 1) // 성인
		{
			// String category3[] = {"미혼모", "저소득층", "장애인", "질병/희귀 질환"};
			category3[0] = "미혼모";
			category3[1] = "저소득층";
			category3[2] = "장애인";
			category3[3] = "질병/희귀 질환";
		} else if (step02 == 2) // 노인
		{
			// String category3[] = {"독거노인", "기초생활수급자", "장애인"};
			category3[0] = "독거노인";
			category3[1] = "기초생활수급자";
			category3[2] = "장애인";
		} else if (step02 == 3) // 동물
		{
			// String category3[] = {"생계 및 기초생활 지원", "의료", "주거,환경개선", "인식 및 정책 개선"};
			category3[0] = "생계 및 기초생활 지원";
			category3[1] = "의료";
			category3[2] = "주거,환경개선";
			category3[3] = "인식 및 정책 개선";
		} else // 지역사회
		{
			// String category3[] = {"환경", "보훈 대상자", "재해민", "다문화"};
			category3[0] = "환경";
			category3[1] = "보훈 대상자";
			category3[2] = "재해민";
			category3[3] = "다문화";
		}

		List<ProjectDTO> matchList = matchService.matchComplete(category1[step01], category2[step02],
				category3[step03]);
		// System.out.println("matchList" + matchList.get(0));

		model.addAttribute("matchList", matchList);

		return "match/matchComplete";
	}

}
