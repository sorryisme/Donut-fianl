package com.donut.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.donut.web.dao.NoticeDAO;
import com.donut.web.dto.NoticeDTO;
import com.donut.web.service.NoticeService;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public List<NoticeDTO> noticeSelectAll(int start, int end, String searchOption, String keyword) throws Exception {
		return noticeDAO.noticeSelectAll(start, end, searchOption, keyword);
	}
	
	// 07. 게시글 레코드 갯수
		@Override
		public int countArticle(String searchOption, String keyword) throws Exception {
			return noticeDAO.countArticle(searchOption, keyword);
		}
	
	@Override
	public NoticeDTO noticeSelectByNo(int noticeNo) throws Exception {
		return noticeDAO.noticeSelectByNo(noticeNo);
	}
	
	
	@Override
	public int noticeInsert(NoticeDTO noticeDTO) throws Exception {
		
		return noticeDAO.noticeInsert(noticeDTO);
	}

	

	@Override
	public NoticeDTO noticeUpdate(NoticeDTO noticeDTO) throws Exception {
		noticeDAO.noticeUpdate(noticeDTO);
		NoticeDTO noticeDTOAfterUpdate = noticeDAO.noticeSelectByNo(noticeDTO.getNoticeNo());
		return noticeDTOAfterUpdate;
	}

	@Override
	public NoticeDTO noticeRead(int noticeNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int noticeDelete(int noticeNo) throws Exception {
		
		return noticeDAO.noticeDelete(noticeNo);
	}

	/*@Override
	public boolean noticeDuplicatedById(int noticeNo, String id) throws Exception {

		return noticeDAO.noticeDuplicatedById(noticeNo, id);
	}*/

}
