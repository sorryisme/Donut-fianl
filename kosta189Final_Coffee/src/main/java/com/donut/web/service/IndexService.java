package com.donut.web.service;

import java.util.List;

import com.donut.web.dto.ProjectDTO;

public interface IndexService
{
	public String countProject();

	public String countMemberOne();

	public String countMemberTwo();

	public List<ProjectDTO> almostDonePercent();

	public List<ProjectDTO> recentRegister();

	public List<ProjectDTO> almostDeadline();

	public List<ProjectDTO> randomRecommend();

	public List<ProjectDTO> autoComplete(String keyWord);

}
