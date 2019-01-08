package com.donut.web.dao;

import java.util.List;

import com.donut.web.dto.FavoriteDTO;
import com.donut.web.dto.ItemDTO;
import com.donut.web.dto.ProjectDTO;
import com.donut.web.dto.RewardDTO;

public interface ProjectDAO {

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
	public int itemInsert(ProjectDTO projectDTO) throws Exception;

	//물품 프로젝트 등록 후 아이템 등록
	public int itemListInsert(ItemDTO itemDTO) throws Exception;
	//금전 프로젝트 등록
	public int moneyInsert(ProjectDTO projectDTO) throws Exception;

	//업데이트 실행
	public int projectUpdate(ProjectDTO projectDTO) throws Exception;

	//즐겨찾기 추가
	public int projectFavoriteInsert(FavoriteDTO favoriteDTO) throws Exception;

	//즐겨찾기 삭제
	public int projectFavoriteDelete(FavoriteDTO favoriteDTO) throws Exception;
	
	//프로젝트 수정 삭제 전 글쓴이 확인
	public boolean projectDuplicatedById(int projectNo,String id) throws Exception;

	//리워드 등록
	public int rewardListInsert(RewardDTO rewardDTO) throws Exception;
}
