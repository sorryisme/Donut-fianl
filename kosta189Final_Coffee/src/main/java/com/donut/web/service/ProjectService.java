package com.donut.web.service;

import java.util.List;

import com.donut.web.dto.FavoriteDTO;
import com.donut.web.dto.ProjectDTO;

public interface ProjectService {
	
	//프로젝트 전체보기
	public List<ProjectDTO> projectSelectAll(String flag) throws Exception;
	
	//프로젝트 상세보기 ,업데이트 정보 가져오기
	public ProjectDTO projectSelectByNo(int projectNo) throws Exception;
	
	//프로젝트 카테고리로 보기
	public List<ProjectDTO> projectSelectByCategory1(ProjectDTO projectDTO) throws Exception;
	
	//프로젝트 카테고리2로 보기
	public List<ProjectDTO> projectSelectByCategory2() throws Exception;
	
	//프로젝트 카테고리2로 보기
	public List<ProjectDTO> projectSelectByCategory3() throws Exception;
	
	//프로젝트 즐겨찾기 확인 - 서비스에서 보내주기
	public boolean projectFavoriteSelectByNo(FavoriteDTO favoriteDTO) throws Exception;
	
	//물품 프로젝트 등록
	public int ItemInsert(ProjectDTO projectDTO) throws Exception;
	
	//금전 프로젝트 등록
	public int MoneyInsert(ProjectDTO projectDTO) throws Exception;
	
	//업데이트 실행
	public int projectUpdate(ProjectDTO projectDTO) throws Exception;
	
	//즐겨찾기 추가
	public int projectFavoriteInsert(FavoriteDTO favoriteDTO) throws Exception;
	
	//즐겨찾기 삭제
	public int projectFavoriteDelete(FavoriteDTO favoriteDTO) throws Exception;

	//스토리 수정 전 글쓴이 확인
	public boolean projectDuplicatedById(int projectNo,String id) throws Exception;
	
}
