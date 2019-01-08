package com.donut.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donut.web.dao.QnADAO;
import com.donut.web.dto.CheerDTO;
import com.donut.web.dto.QnADTO;
import com.donut.web.service.QnAService;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnADAO qnaDAO;
	
	@Override
	public List<QnADTO> qnaSelectAll(int qnaNo) throws Exception {

		return qnaDAO.qnaSelectAll(qnaNo);
	}

	@Override
	public int qnaInsert(QnADTO qnaDTO) throws Exception {
		return qnaDAO.qnaInsert(qnaDTO);
	}

	@Override
	public int qnaReplyInsert(QnADTO qnaDTO) throws Exception {
		
		return qnaDAO.qnaReplyInsert(qnaDTO);
	}

	@Override
	public QnADTO qnaSelectByNo(int qnaNo) throws Exception {
		return qnaDAO.qnaSelectByNo(qnaNo);
	}

	@Override
	public int qnaUpdate(QnADTO qnaDTO) throws Exception {
		return qnaDAO.qnaUpdate(qnaDTO);
	}

	@Override
	public int qnaDelete(String id, int qnaNo, int qnaParentNo) throws Exception {
		int delete_result = 0;
		QnADTO qnaDTO = qnaDAO.qnaSelectByNo(qnaNo);
		if(qnaDTO.getId().equals(id)) {
			delete_result = qnaDAO.qnaDelete(id, qnaNo, qnaParentNo);
			/*if(delete_result==0)throw new RuntimeException("�������� �ʾҽ��ϴ�.");
		}else{
			throw new  RuntimeException ("��й�ȣ �����̹Ƿ� �����ȵ˴ϴ�.");
		}*/
		}
		return delete_result;
	}

	@Override
	public boolean qnaDuplicatedById(int qnaNo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
