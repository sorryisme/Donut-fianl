package com.donut.web.dao;

import java.util.List;

import com.donut.web.dto.QnADTO;

public interface QnADAO {

	public List<QnADTO> qnaSelectAll(int qnaNo) throws Exception;

	public int qnaInsert(QnADTO qnaDTO) throws Exception;

	public int qnaReplyInsert(QnADTO qnaDTO) throws Exception;

	//수정을 위한 검색
	public QnADTO qnaSelectByNo(int qnaNo) throws Exception;

	public int qnaUpdate(QnADTO qnaDTO) throws Exception;

	public int qnaDelete(String id, int qnaNo, int qnaParentNo) throws Exception;

	public boolean qnaDuplicatedById(int qnaNo) throws Exception;
}
