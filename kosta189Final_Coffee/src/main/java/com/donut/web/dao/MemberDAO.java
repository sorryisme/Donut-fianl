package com.donut.web.dao;

import java.util.List;

import com.donut.web.dto.CheerDTO;
import com.donut.web.dto.FavoriteDTO;
import com.donut.web.dto.MemberDTO;
import com.donut.web.dto.ProjectDTO;
import com.donut.web.dto.QnADTO;
import com.donut.web.dto.ReceiptDTO;

public interface MemberDAO {

	//회원가입 - view 삽입정보 가져오기
	public int memberInsert(MemberDTO memberDTO) throws Exception;

	//id 중복체크 - 중복체크할 id (true:이미 회원가입된 id, false: 가입가능)
	public boolean memberDuplicatedById(String id) throws Exception;

	//id 로그인 - id,비번
	public MemberDTO memberSelectByIdPwd(String id, String pwd) throws Exception;

	//API로 로그인[미정]
	public void loginAPI() throws Exception;

	//회원탈퇴
	public int memberDelete(MemberDTO memberDTO) throws Exception;

	//회원탈퇴 및 수정 전 비밀번호 확인
	public boolean memberDuplicatedByPwd(String id,String pwd) throws Exception;

	//기부자 마이페이지 - service에서 세션 보내주기 
	public MemberDTO memberSelectAll() throws Exception;

	//기부자 마이페이지 응원댓글 - service에서 세션 보내주기
	public List<CheerDTO> memberSelectByCheer(String id) throws Exception;

	//기부자 마이페이지 QnA - service에서 세션 보내주기
	public List<QnADTO> memberSelectByQnA(String id) throws Exception;

	//회원정보 수정 폼 - service 세션보내주기
	public MemberDTO memberSelectById(String id) throws Exception;

	//기부자 마이페이지 회원정보 수정진행 - view에서 수정 정보가져오기
	public int memberUpdate(MemberDTO memberDTO) throws Exception;

	//기부자 마이페이지 즐겨찾기 리스트 - service 세션보내주기
	public List<FavoriteDTO> memberFavoriteList(String id) throws Exception;

	//기부자 마이페이지 즐겨찾기 삭제 - favoriteNo 뷰에서 가져오기 , service 세션 아이디값 보내주기
	public int memberFavoriteDelete(FavoriteDTO favoriteDTO) throws Exception;

	//기부자 마이페이지 영수증  ,service 세션 아이디값 보내주기
	public List<ReceiptDTO> memberReceiptList(String id) throws Exception;

	//기부자 프로젝트 기부 현황, service 세션 아이디값 보내주기
	public List<ProjectDTO> memberGiveList(String id) throws Exception;

	public int memberUpdateNotify(int cheerNo);
	
	public int memberUpdateQnANotify(int qnaNo);

	public int Alarm(String sessionId);
	
	public int qnaAlarm(String sessionId);

	public int pwdUpdate(String id, String pwd, String pwdNew);
}
