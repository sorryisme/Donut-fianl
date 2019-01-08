package com.donut.web.service;

import com.donut.web.dto.ReviewDTO;

public interface ReviewService {

	//상세보기
	public ReviewDTO reviewRead(int projectNo) throws Exception;
	
	public int reviewInsert(ReviewDTO reviewDTO) throws Exception;
	
	//수정을 위한 검색
	public ReviewDTO reviewSelectByNo(int projectNo) throws Exception;
	
	public int reviewUpdate(ReviewDTO reviewDTO) throws Exception;
	
	public int reviewDelete(int projectNo) throws Exception;
	
	public boolean reviewDuplicatedById(String id) throws Exception; 
}
