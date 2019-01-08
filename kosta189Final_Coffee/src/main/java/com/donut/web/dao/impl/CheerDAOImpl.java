package com.donut.web.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.donut.web.dao.CheerDAO;
import com.donut.web.dto.CheerDTO;

@Repository
public class CheerDAOImpl implements CheerDAO {


	@Autowired
	private SqlSession session;

	List<CheerDTO> list;

	@Override
	public List<CheerDTO> selectByAll(int cheerProjectNo) throws Exception {
		list = session.selectList("CheerMapper.allSelect", cheerProjectNo);
		for(CheerDTO dto : list) {
			System.out.println(dto.getCheerContent());
		}
		return list;
	}

	@Override
	public int cheerInsert(CheerDTO cheerDTO) throws Exception {

		return session.insert("CheerMapper.insert",cheerDTO);
	}

	@Override
	public int cheerReplyInsert(CheerDTO cheerDTO) throws Exception {
		
		session.update("CheerMapper.cheerReplyInsertUpdate",cheerDTO);
		return session.insert("CheerMapper.cheerReplyInsert",cheerDTO);
	}

	@Override
	public CheerDTO cheerSelectByNo(int cheerNo) throws Exception {
		for(CheerDTO dto : list) {
			if(dto.getCheerNo()==cheerNo) {
				return dto;
			}
		}
		return null;
	}

	@Override
	public int cheerUpdate(CheerDTO cheerDTO) throws Exception {
		return session.update("CheerMapper.update",cheerDTO);
	}

	@Override
	public int cheerDelete(String id, int CheerNo, int cheerParentNo) throws Exception {
		Map<String, Object> map =new HashMap<>();
		map.put("id", id);
		map.put("cheerNo", CheerNo);
	//	session.update("CheerMapper.cheerReplyDeleteUpdate",CheerNo);
	// ���� �ڽı��� cheerNo�� �޾ƿԴµ�, ���� �θ���� notify�� 1->0���� �ٲٰ�ʹ� ������
	// �θ���� ����� �ĺ��Ϸ��� ����ؾ�����
		if(cheerParentNo!=0) {
		session.update("CheerMapper.deleteUpdate",cheerParentNo);
		}
		return session.delete("CheerMapper.delete",map);
	}

	@Override
	public boolean cheerDuplicatedById(String id, int projectNo) throws Exception {
		Map<String, Object> map =new HashMap<>();
		map.put("id", id);
		map.put("projectNo", projectNo);
		if( session.selectOne("CheerMapper.cheerDuplicatedById",map) !=null) {
			System.out.println("�̹� ���� �ֽ�");
			return true;
		}
		System.out.println("÷���°���");
		return false;
	}

}
