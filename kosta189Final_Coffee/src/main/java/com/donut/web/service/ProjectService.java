package com.donut.web.service;

import java.util.List;

import com.donut.web.dto.FavoriteDTO;
import com.donut.web.dto.ProjectDTO;

public interface ProjectService {
	
	//������Ʈ ��ü����
	public List<ProjectDTO> projectSelectAll(String flag) throws Exception;
	
	//������Ʈ �󼼺��� ,������Ʈ ���� ��������
	public ProjectDTO projectSelectByNo(int projectNo) throws Exception;
	
	//������Ʈ ī�װ��� ����
	public List<ProjectDTO> projectSelectByCategory1(ProjectDTO projectDTO) throws Exception;
	
	//������Ʈ ī�װ�2�� ����
	public List<ProjectDTO> projectSelectByCategory2() throws Exception;
	
	//������Ʈ ī�װ�2�� ����
	public List<ProjectDTO> projectSelectByCategory3() throws Exception;
	
	//������Ʈ ���ã�� Ȯ�� - ���񽺿��� �����ֱ�
	public boolean projectFavoriteSelectByNo(FavoriteDTO favoriteDTO) throws Exception;
	
	//��ǰ ������Ʈ ���
	public int ItemInsert(ProjectDTO projectDTO) throws Exception;
	
	//���� ������Ʈ ���
	public int MoneyInsert(ProjectDTO projectDTO) throws Exception;
	
	//������Ʈ ����
	public int projectUpdate(ProjectDTO projectDTO) throws Exception;
	
	//���ã�� �߰�
	public int projectFavoriteInsert(FavoriteDTO favoriteDTO) throws Exception;
	
	//���ã�� ����
	public int projectFavoriteDelete(FavoriteDTO favoriteDTO) throws Exception;

	//���丮 ���� �� �۾��� Ȯ��
	public boolean projectDuplicatedById(int projectNo,String id) throws Exception;
	
}
