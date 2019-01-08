package com.donut.web.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.donut.web.dao.NoticeDAO;
import com.donut.web.dto.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<NoticeDTO> noticeSelectAll(int start, int end, String searchOption, String keyword) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword",  keyword);
		map.put("start", start);
		map.put("end", end);

		return session.selectList("noticeMapper.selectAll", map);
	}


	// 07. �Խñ� ���ڵ� ����
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		// �˻��ɼ�, Ű���� �ʿ� ����
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return session.selectOne("noticeMapper.countArticle", map);
	}

	@Override
	public NoticeDTO noticeSelectByNo(int noticeNo) throws Exception {
		return session.selectOne("noticeMapper.selectByNo",noticeNo);
	}

	@Override
	public int noticeInsert(NoticeDTO noticeDTO) throws Exception {

		return session.insert("noticeMapper.noticeInsert",noticeDTO);
	}

	@Override
	public int noticeUpdate(NoticeDTO noticeDTO) throws Exception {

		return session.update("noticeMapper.noticeUpdate",noticeDTO);
	}

	@Override
	public NoticeDTO noticeRead(int noticeNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int noticeDelete(int noticeNo) throws Exception {
		return session.delete("noticeMapper.noticeDelete", noticeNo);
	}



	/* @Override
	   public boolean noticeDuplicatedById(int noticeNo, String id) throws Exception {
	      Map<String,Object> map = new HashMap<>();
	      map.put("noticeNo", noticeNo);
	      map.put("id", id);
	      NoticeDTO noticeDTO = session.selectOne("noticeMapper.noticeSelectByNoAndId",map);
	      if(noticeDTO == null) {
	         throw new Exception("�۾��� Ȯ�� ����");
	      }
	      return true;
	   }*/

}
