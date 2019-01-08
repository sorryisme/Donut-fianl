package com.donut.web.dao;

import java.util.List;

import com.donut.web.dto.ProjectDTO;

public interface MatchDAO {
	public List<ProjectDTO> matchComplete(String category1, String category2, String category3);
}
