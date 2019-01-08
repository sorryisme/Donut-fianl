package com.donut.web.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.donut.web.dao.ProjectDAO;
import com.donut.web.dto.FavoriteDTO;
import com.donut.web.dto.ItemDTO;
import com.donut.web.dto.ProjectDTO;
import com.donut.web.dto.RewardDTO;

@Repository
public class ProjectDAOImpl implements ProjectDAO{
	
	@Autowired
	SqlSession session;
	
	@Override
	public List<ProjectDTO> projectSelectAll(String flag) throws Exception {
		if(flag == null) flag = "ing";

		return session.selectList("projectMapper.projectSelectAll", flag);
	}

	@Override
	public ProjectDTO projectSelectByNo(int projectNo) throws Exception {
		return session.selectOne("projectMapper.projectSelectByNo", projectNo);
	}

	@Override
	public List<ProjectDTO> projectSelectByCategory1(ProjectDTO projectDTO) throws Exception {
		return session.selectList("projectMapper.categoryList",projectDTO);
	}

	@Override
	public List<ProjectDTO> projectSelectByCategory2() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProjectDTO> projectSelectByCategory3() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public boolean projectFavoriteSelectByNo(FavoriteDTO favoriteDTO) throws Exception {
		  FavoriteDTO favoritedbDTO = session.selectOne("projectMapper.selectFavoriteByNo",favoriteDTO);
	    	if(favoritedbDTO==null)return false;
	    	else return true;
	}

	@Override
	public int itemInsert(ProjectDTO projectDTO) throws Exception {
		int result= session.insert("projectMapper.itemInsert", projectDTO);
		return result;
	}
	
	@Override
	public int itemListInsert(ItemDTO itemDTO) throws Exception {
		int result= session.insert("projectMapper.itemListInsert", itemDTO);
		return result;
	}
	

	@Override
	public int moneyInsert(ProjectDTO projectDTO) throws Exception {
		int result= session.insert("projectMapper.moneyInsert", projectDTO);
		if(result == 0) {
			throw new Exception("금액 기부 프로젝트 등록실패 ");
		}
		return result;
	}

	
	
	@Override
	public int projectUpdate(ProjectDTO projectDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int projectFavoriteInsert(FavoriteDTO favoriteDTO) throws Exception {
		return session.insert("projectMapper.insertFavorite", favoriteDTO);
	}

	@Override
	public int projectFavoriteDelete(FavoriteDTO favoriteDTO) throws Exception {
		return session.delete("projectMapper.deleteFavorite", favoriteDTO);
	}

	@Override
	public boolean projectDuplicatedById(int projectNo, String id) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("projectNo", projectNo);
		map.put("id", id);
		ProjectDTO projectDTO = session.selectOne("projectMapper.projectSelectByNoAndId",map);
		if(projectDTO == null) {
			throw new Exception("글쓴이 확인 에러");
		}
		return true;
	}

	@Override
	public int rewardListInsert(RewardDTO rewardDTO) throws Exception {
		int result= session.insert("projectMapper.rewardListInsert", rewardDTO);
		
		return result;
	}
	
	
	
}
