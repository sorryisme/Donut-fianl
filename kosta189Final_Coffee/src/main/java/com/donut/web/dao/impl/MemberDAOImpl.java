package com.donut.web.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.donut.web.dao.MemberDAO;
import com.donut.web.dto.CheerDTO;
import com.donut.web.dto.FavoriteDTO;
import com.donut.web.dto.MemberDTO;
import com.donut.web.dto.ProjectDTO;
import com.donut.web.dto.QnADTO;
import com.donut.web.dto.ReceiptDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	SqlSession session;
	
	@Override
	public int memberInsert(MemberDTO memberDTO) throws Exception {
		return session.insert("memberMapper.memberInsert", memberDTO);
	}

	@Override
	public boolean memberDuplicatedById(String id) throws Exception {
		if(session.selectOne("memberMapper.memberIdcheck", id)==null) {	//사용가능
			return true;	
		}
		else {
			return false;
		}
	}

	@Override
	public MemberDTO memberSelectByIdPwd(String id, String pwd) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		return session.selectOne("memberMapper.memberIdPwdCheck", map);
	}
	
	@Override
	public void loginAPI() throws Exception {
			//사용안함
	}

	@Override
	public int memberDelete(MemberDTO memberDTO) throws Exception {
		int result = session.update("memberMapper.memberDelete",memberDTO);
		if(result == 0) {
			throw new Exception("회원탈퇴에 실패했습니다");
		}
		return result;
	}

	@Override
	public boolean memberDuplicatedByPwd(String id, String pwd) throws Exception {
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
		return session.selectList("memberMapper.memberSelectByCheer", id);
	}

	@Override
	public List<QnADTO> memberSelectByQnA(String id) throws Exception {
		return session.selectList("memberMapper.memberSelectByQnA", id);
	}


	@Override
	public MemberDTO memberSelectById(String id) throws Exception {
		return session.selectOne("memberMapper.memberIdCheck",id);
	}

	@Override
	public int memberUpdate(MemberDTO memberDTO) throws Exception {
		return session.update("memberMapper.memberUpdate",memberDTO);
	}

	 @Override
	    public List<FavoriteDTO> memberFavoriteList(String id) throws Exception {
	        
	        return session.selectList("memberMapper.memberFavorite",id);
	    }

	    @Override
	    public int memberFavoriteDelete(FavoriteDTO favoriteDTO) throws Exception {
	      
	        return session.delete("memberMapper.deleteFavorite",favoriteDTO);
	    }
	    
	@Override
	public List<ReceiptDTO> memberReceiptList(String id) throws Exception {
		return session.selectList("memberMapper.receiptList",id);
	}

	@Override
	public List<ProjectDTO> memberGiveList(String id) throws Exception {
		return session.selectList("memberMapper.memberGiveList",id);
	}
	
	@Override
	public int memberUpdateNotify(int cheerNo) {
		return session.update("memberMapper.memberUpdateNotify",cheerNo);
	}
	
	@Override
	public int memberUpdateQnANotify(int qnaNo) {
		return session.update("memberMapper.memberUpdateQnANotify",qnaNo);
	}

	@Override
	public int Alarm(String id) {
		int result = session.selectOne("memberMapper.cheerAlarm",id);
		
		return result;
		
	}

	@Override
	public int qnaAlarm(String id) {
		int result = session.selectOne("memberMapper.qnaAlarm",id);
		
		return result;
	}

	@Override
	public int pwdUpdate(String id, String pwd, String pwdNew)
	{
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("pwdNew", pwdNew);
		
		return session.update("memberMapper.pwdUpdate", map);
	}
}
