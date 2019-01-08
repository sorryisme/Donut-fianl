package com.donut.web.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.donut.web.dao.ReviewDAO;
import com.donut.web.dto.ReviewDTO;
@Repository
public class ReviewDAOImpl implements ReviewDAO {

    @Autowired
    private SqlSession session;
    @Override
    public ReviewDTO reviewRead(int projectNo) throws Exception {
        // TODO Auto-generated method stub
        return session.selectOne("reviewMapper.reviewSelectByNo",projectNo) ;
    }

    @Override
    public int reviewInsert(ReviewDTO reviewDTO) throws Exception {
       
        return session.insert("reviewMapper.reviewInsert", reviewDTO);
    }

    @Override
    public ReviewDTO reviewSelectByNo(int projectNo) throws Exception {
       
        return session.selectOne("reviewMapper.reviewSelectByNo", projectNo);
    }

    @Override
    public int reviewUpdate(ReviewDTO reviewDTO) throws Exception {
        // TODO Auto-generated method stub
        return session.update("reviewMapper.reviewUpdate", reviewDTO);
    }

    @Override
    public int reviewDelete(int projectNo) throws Exception {
        // TODO Auto-generated method stub
        return session.delete("reviewMapper.reviewDelete", projectNo);
    }

    @Override
    public boolean reviewDuplicatedById(String id) throws Exception {
        // TODO Auto-generated method stub
        return session.selectOne("reviewMapper.reviewDuplicatedById", id);
    }

}
