package com.donut.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donut.web.dao.CheerDAO;
import com.donut.web.dto.CheerDTO;
import com.donut.web.service.CheerService;

@Service
public class CheerServiceImpl implements CheerService {

	@Autowired
	private CheerDAO cheerDAO;
	
	@Override
	public List<CheerDTO> selectByAll(int cheerProjectNo) throws Exception {

		return cheerDAO.selectByAll(cheerProjectNo);
	}

	@Override
	public int cheerInsert(CheerDTO cheerDTO) throws Exception {

		return cheerDAO.cheerInsert(cheerDTO);
		}

	@Override
	public int cheerReplyInsert(CheerDTO cheerDTO) throws Exception {

		return cheerDAO.cheerReplyInsert(cheerDTO);
		}
		

	@Override
	public CheerDTO cheerSelectByNo(int cheerNo) throws Exception {

		return cheerDAO.cheerSelectByNo(cheerNo);
		}

	@Override
	public int cheerUpdate(CheerDTO cheerDTO) throws Exception {

		return cheerDAO.cheerUpdate(cheerDTO);
		}

	@Override
	public int cheerDelete(String id, int cheerNo, int cheerParentNo) throws Exception {
		int delete_result = 0;
		CheerDTO cheerDTO = cheerDAO.cheerSelectByNo(cheerNo);
		if(cheerDTO.getId().equals(id)) {
			delete_result = cheerDAO.cheerDelete(id, cheerNo, cheerParentNo);
			/*if(delete_result==0)throw new RuntimeException("삭제되지 않았습니다.");
		}else{
			throw new  RuntimeException ("비밀번호 오류이므로 삭제안됩니다.");
		}*/
		}
		return delete_result;
	}


	@Override
	public boolean cheerDuplicatedById(String id, int projectNo) throws Exception {

		return cheerDAO.cheerDuplicatedById(id, projectNo);
	}


}
