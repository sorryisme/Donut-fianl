package com.donut.web.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.donut.web.dao.MatchDAO;
import com.donut.web.dto.ProjectDTO;

@Repository
public class MatchDAOImpl implements MatchDAO {
	@Autowired
	private SqlSession session;

	@Override
	public List<ProjectDTO> matchComplete(String category1, String category2, String category3) {
		System.out.println("category1" + category1);
		System.out.println("category2" + category2);
		System.out.println("category3" + category3);

		Map<String, String> map = new HashMap<>();
		map.put("category1", category1);
		map.put("category2", category2);
		map.put("category3", category3);

		List<ProjectDTO> list = session.selectList("matchMapper.matchComplete", map);
		System.out.println("list ¿©±â" + list);

		return session.selectList("matchMapper.matchComplete", map);
	}

}
