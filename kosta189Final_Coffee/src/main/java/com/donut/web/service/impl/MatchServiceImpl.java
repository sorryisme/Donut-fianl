package com.donut.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donut.web.dao.MatchDAO;
import com.donut.web.dto.ProjectDTO;
import com.donut.web.service.MatchService;

@Service
public class MatchServiceImpl implements MatchService {
	@Autowired
	MatchDAO matchDAO;

	@Override
	public List<ProjectDTO> matchComplete(String category1, String category2, String category3) {
		return matchDAO.matchComplete(category1, category2, category3);
	}

}
