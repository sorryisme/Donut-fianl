package com.donut.web.dao;

import java.util.List;

import com.donut.web.dto.FavoriteDTO;
import com.donut.web.dto.ItemDTO;
import com.donut.web.dto.ProjectDTO;
import com.donut.web.dto.RewardDTO;

public interface ProjectDAO {

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
	public int itemInsert(ProjectDTO projectDTO) throws Exception;

	//��ǰ ������Ʈ ��� �� ������ ���
	public int itemListInsert(ItemDTO itemDTO) throws Exception;
	//���� ������Ʈ ���
	public int moneyInsert(ProjectDTO projectDTO) throws Exception;

	//������Ʈ ����
	public int projectUpdate(ProjectDTO projectDTO) throws Exception;

	//���ã�� �߰�
	public int projectFavoriteInsert(FavoriteDTO favoriteDTO) throws Exception;

	//���ã�� ����
	public int projectFavoriteDelete(FavoriteDTO favoriteDTO) throws Exception;
	
	//������Ʈ ���� ���� �� �۾��� Ȯ��
	public boolean projectDuplicatedById(int projectNo,String id) throws Exception;

	//������ ���
	public int rewardListInsert(RewardDTO rewardDTO) throws Exception;
}
