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

	// �����Ŀ� ����
	@RequestMapping("/matchStart")
	public String matchStart() {
		System.out.println("matchStart ����");
		return "match/matchStart";
	}

	// �����Ŀ� ī�װ�1
	@RequestMapping("/matchCategory1")
	public String matchCategory1() {
		System.out.println("matchCategory1 ����");
		return "match/matchCategory1";
	}

	// �����Ŀ� ī�װ�2
	@RequestMapping("/matchCategory2")
	public String matchCategory2() {
		System.out.println("matchCategory2 ����");
		return "match/matchCategory2";
	}

	// �����Ŀ� ī�װ�3
	@RequestMapping("/matchCategory3")
	public String matchCategory3() {
		System.out.println("matchCategory3 ����");
		return "match/matchCategory3";
	}

	@RequestMapping("/matchComplete")
	public String matchComplete(HttpServletRequest request, Model model) {
		System.out.println("matchComplete ����");

		int step01 = Integer.parseInt(request.getParameter("step01"));
		int step02 = Integer.parseInt(request.getParameter("step02"));
		int step03 = Integer.parseInt(request.getParameter("step03"));

		String category1[] = { "�ݾ�", "��ǰ" };
		String category2[] = { "�Ƶ�", "����", "����", "����", "���� ��ȸ" };
		String category3[] = new String[5];

		if (step02 == 0)// �Ƶ�
		{
			// ���� , �ҳ�/�ҳ� ����, �����, ����/��� ��ȯ
			// String category3[] = {"����", "�ҳ�/�ҳ� ����", "�����", "����/��� ��ȯ"};
			category3[0] = "����";
			category3[1] = "�ҳ�/�ҳ� ����";
			category3[2] = "�����";
			category3[3] = "����/��� ��ȯ";
		} else if (step02 == 1) // ����
		{
			// String category3[] = {"��ȥ��", "���ҵ���", "�����", "����/��� ��ȯ"};
			category3[0] = "��ȥ��";
			category3[1] = "���ҵ���";
			category3[2] = "�����";
			category3[3] = "����/��� ��ȯ";
		} else if (step02 == 2) // ����
		{
			// String category3[] = {"���ų���", "���ʻ�Ȱ������", "�����"};
			category3[0] = "���ų���";
			category3[1] = "���ʻ�Ȱ������";
			category3[2] = "�����";
		} else if (step02 == 3) // ����
		{
			// String category3[] = {"���� �� ���ʻ�Ȱ ����", "�Ƿ�", "�ְ�,ȯ�氳��", "�ν� �� ��å ����"};
			category3[0] = "���� �� ���ʻ�Ȱ ����";
			category3[1] = "�Ƿ�";
			category3[2] = "�ְ�,ȯ�氳��";
			category3[3] = "�ν� �� ��å ����";
		} else // ������ȸ
		{
			// String category3[] = {"ȯ��", "���� �����", "���ع�", "�ٹ�ȭ"};
			category3[0] = "ȯ��";
			category3[1] = "���� �����";
			category3[2] = "���ع�";
			category3[3] = "�ٹ�ȭ";
		}

		List<ProjectDTO> matchList = matchService.matchComplete(category1[step01], category2[step02],
				category3[step03]);
		// System.out.println("matchList" + matchList.get(0));

		model.addAttribute("matchList", matchList);

		return "match/matchComplete";
	}

}
