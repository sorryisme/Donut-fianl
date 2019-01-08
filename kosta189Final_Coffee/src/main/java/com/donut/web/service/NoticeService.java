package com.donut.web.service;

import java.util.List;

import com.donut.web.dto.NoticeDTO;

public interface NoticeService {

	public int noticeInsert(NoticeDTO noticeDTO) throws Exception;
	//������Ʈ���� ������ �������� ���� �޼���
	public NoticeDTO noticeSelectByNo(int noticeNo) throws Exception;
	
	public NoticeDTO noticeUpdate(NoticeDTO noticeDTO) throws Exception;
	
	public List<NoticeDTO> noticeSelectAll(int start, int end, String searchOption, String keyword) throws Exception;
	
	public int countArticle(String searchOption, String keyword) throws Exception;
	
	public NoticeDTO noticeRead(int noticeNo) throws Exception;
	
	public int noticeDelete(int noticeNo) throws Exception;
	
	//public boolean noticeDuplicatedById(int noticeNo, String id) throws Exception;
}
