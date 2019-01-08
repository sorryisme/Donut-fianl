package com.donut.web.dao;

import com.donut.web.dto.ReviewDTO;

public interface ReviewDAO {

	public ReviewDTO reviewRead(int projectNo) throws Exception;
	
	//���ǿ��� ���̵�
	public int reviewInsert(ReviewDTO reviewDTO) throws Exception;
	
	//������ ���� �˻�
	public ReviewDTO reviewSelectByNo(int projectNo) throws Exception;
	
	public int reviewUpdate(ReviewDTO reviewDTO) throws Exception;
	
	public int reviewDelete(int projectNo) throws Exception;
	
	public boolean reviewDuplicatedById(String id) throws Exception; 
}
