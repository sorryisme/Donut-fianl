package com.donut.web.service;

import java.util.List;

import com.donut.web.dto.ProjectDTO;

public interface MatchService {
	public List<ProjectDTO> matchComplete(String category1, String category2, String category3);
}
