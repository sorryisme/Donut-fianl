package com.donut.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donut.web.dao.MemberDAO;
import com.donut.web.dto.CheerDTO;
import com.donut.web.dto.FavoriteDTO;
import com.donut.web.dto.MemberDTO;
import com.donut.web.dto.ProjectDTO;
import com.donut.web.dto.QnADTO;
import com.donut.web.dto.ReceiptDTO;
import com.donut.web.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;

	@Override
	public int MemberInsert(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberInsert(memberDTO);
	}

	@Override
	public boolean memberDuplicatedById(String id) throws Exception {
		return memberDAO.memberDuplicatedById(id);
	}

	@Override
	public MemberDTO memberSelectByIdPwd(String id, String pwd) throws Exception {
		return memberDAO.memberSelectByIdPwd(id, pwd);
	}

	@Override
	public void loginAPI() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public int memberDelete(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberDelete(memberDTO);
	}

	@Override
	public boolean memberDuplicatedByPwd(String pwd) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MemberDTO memberSelectAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CheerDTO> memberSelectByCheer(String id) throws Exception {
		return memberDAO.memberSelectByCheer(id);
	}

	@Override
	public List<QnADTO> memberSelectByQnA(String id) throws Exception {
		return memberDAO.memberSelectByQnA(id);
	}

	@Override
	public MemberDTO memberSelectById(String id) throws Exception {
		return memberDAO.memberSelectById(id);
	}

	@Override
	public int memberUpdate(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberUpdate(memberDTO);
	}

	@Override
	public List<FavoriteDTO> memberFavoriteList(String id) throws Exception {

		return memberDAO.memberFavoriteList(id);
	}

	@Override
	public int memberFavoriteDelete(FavoriteDTO favoriteDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.memberFavoriteDelete(favoriteDTO);
	}

	@Override
	public List<ReceiptDTO> memberReceiptList(String id) throws Exception {
		return memberDAO.memberReceiptList(id);
	}

	@Override
	public List<ProjectDTO> memberGiveList(String id) throws Exception {
		List<ProjectDTO> list = memberDAO.memberGiveList(id);

		if(list == null || list.isEmpty()) {
			throw new Exception("멤버 기부 정보 조회 실패");
		}
		return list;
	}

	@Override
	public int memberUpdateNotify(int cheerNo) {
		return memberDAO.memberUpdateNotify(cheerNo);
	}
	
	@Override
	public int memberUpdateQnANotify(int qnaNo) {
		return memberDAO.memberUpdateQnANotify(qnaNo);
	}
	

	@Override
	public int Alarm(String sessionId) {
		return memberDAO.Alarm(sessionId);
	}

	@Override
	public int qnaAlarm(String sessionId) {
		return memberDAO.qnaAlarm(sessionId);
	}

	@Override
	public int pwdUpdate(String id, String pwd, String pwdNew)
	{
		int result = memberDAO.pwdUpdate(id, pwd, pwdNew);
		System.out.println("result = " + result);
		return result;
	}

}
