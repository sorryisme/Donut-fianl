package com.donut.web.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.donut.web.dao.QnADAO;
import com.donut.web.dto.CheerDTO;
import com.donut.web.dto.QnADTO;

@Repository
public class QnADAOImpl implements QnADAO {
	
	@Autowired
	private SqlSession session;

	List<QnADTO> list;

	@Override
	public List<QnADTO> qnaSelectAll(int qnaNo) throws Exception {
		list = session.selectList("qnaMapper.allSelect", qnaNo);
	/*	for(QnADTO dto : list) {
			System.out.println(dto.getQnaContent());
		}*/
		return list;
	}

	@Override
	public int qnaInsert(QnADTO qnaDTO) throws Exception {
		return session.insert("qnaMapper.insert", qnaDTO);
	}

	@Override
	public int qnaReplyInsert(QnADTO qnaDTO) throws Exception {

		session.update("qnaMapper.qnaReplyInsertUpdate", qnaDTO);
		return session.insert("qnaMapper.qnaReplyInsert", qnaDTO);
	}

	@Override
	public QnADTO qnaSelectByNo(int qnaNo) throws Exception {
		for(QnADTO dto : list) {
			if(dto.getQnaNo()==qnaNo) {
				return dto;
			}
		}
		return null;
	}

	@Override
	public int qnaUpdate(QnADTO qnaDTO) throws Exception {
		return session.update("qnaMapper.update",qnaDTO);
	}

	@Override
	public int qnaDelete(String id, int qnaNo, int qnaParentNo) throws Exception {
		Map<String, Object> map =new HashMap<>();
		map.put("id", id);
		map.put("qnaNo", qnaNo);
	//	session.update("CheerMapper.cheerReplyDeleteUpdate",CheerNo);
	// 지금 자식글의 cheerNo를 받아왔는데, 나는 부모글의 notify를 1->0으로 바꾸고싶단 말이지
	// 부모글이 어떤건지 식별하려면 어떻게해야하지
		if(qnaParentNo!=0) {
		session.update("qnaMapper.deleteUpdate",qnaParentNo);
		}
		return session.delete("qnaMapper.delete",map);
	}


	@Override
	public boolean qnaDuplicatedById(int qnaNo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
