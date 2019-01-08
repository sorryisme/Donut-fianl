package com.donut.web.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.donut.web.dao.PaymentDAO;
import com.donut.web.dto.GiveDTO;
import com.donut.web.dto.GiveItemDTO;
import com.donut.web.dto.ItemDTO;
import com.donut.web.dto.PaymentDTO;
import com.donut.web.dto.ProjectDTO;

@Repository
public class PaymentDAOImpl implements PaymentDAO
{
	@Autowired
	private SqlSession session;

	@Override
	public int updateAccMoney(String id, int giveMoney)
	{
		System.out.println("0");
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("giveMoney", giveMoney);
		
		return session.update("paymentMapper.updateAccMoney", map);
	}
	
	@Override
	public int insertGive(GiveDTO giveDTO)
	{
		System.out.println("1");
		return session.insert("paymentMapper.insertGive", giveDTO);
	}
	
	@Override
	public int selectLastGiveNo()
	{
		System.out.println("2");
		int giveNo = session.selectOne("paymentMapper.selectLastGiveNo");
		return giveNo - 1;
	}
	
	@Override
	public int insertPayment(PaymentDTO paymentDTO)
	{
		/*DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = (Date)formatter.parse(paymentDTO.getPermissionDate()); */ 
		
		System.out.println("3");
		return session.insert("paymentMapper.insertPayment", paymentDTO);
	}
	
	@Override
	public ProjectDTO selectProject(int projectNo)
	{
		System.out.println("4");
		ProjectDTO projectDTO = session.selectOne("paymentMapper.selectProject", projectNo);
		System.out.println("projectDTO = " + projectDTO);
		return projectDTO;
	}

	@Override
	public int updateAfterPayment(GiveDTO giveDTO, ProjectDTO projectDTO)
	{
		System.out.println("5");
		Map<String, Object> map = new HashMap<>();
		map.put("giveDTO", giveDTO);
		map.put("projectDTO", projectDTO);
		
		return session.update("paymentMapper.updateAfterPayment", map);
	}

	@Override
	public int insertAfterItemPayment(List<GiveItemDTO> giveItemDTOList, int giveNo)
	{
		Map<String, Object> map = new HashMap<>();
		
		for(GiveItemDTO giveItemDTO : giveItemDTOList)
		{
			map.clear();
			map.put("giveNo", giveNo);
			map.put("giveItemDTO", giveItemDTO);
			session.insert("paymentMapper.insertAfterItemPayment", map);
			System.out.println("6");
		}
		return 0;
	}
	
	@Override
	public List<ItemDTO> selectProjectItems(int projectNo)
	{
		System.out.println("7");
		return session.selectList("paymentMapper.selectProjectItems", projectNo);
	}

	@Override
	public int updateAfterItemPayment(List<ItemDTO> itemDTOList, List<GiveItemDTO> giveItemDTOList, int giveNo)
	{
		System.out.println("8");
		Map<String, Object> map1 = new HashMap<>();
		
		Map<String, Object> map2 = new HashMap<>();
		
		for(ItemDTO itemDTO : itemDTOList)
		{
			map1.clear();
			map1.put("giveNo", giveNo);
			map1.put("itemName", itemDTO.getItemName());
			
			GiveItemDTO giveItemDTO = session.selectOne("paymentMapper.selectGiveItem", map1);
			System.out.println("giveItemDTO 8¹ø" + giveItemDTO);
			map2.clear();
			map2.put("itemDTO", itemDTO);
			
			if(giveItemDTO != null)
			{
				map2.put("giveItemDTO", giveItemDTO);
				System.out.println("giveItemDTO 8¹ø-2" + giveItemDTO);

				session.update("paymentMapper.updateAfterItemPayment", map2);
			}
		}
		
		return 0;
	}

	@Override
	public int alreadyPaid(String id)
	{
		return session.selectOne("paymentMapper.alreadyPaid", id);
	}

}
