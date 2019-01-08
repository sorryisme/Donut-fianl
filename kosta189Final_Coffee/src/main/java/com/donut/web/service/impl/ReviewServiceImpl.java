package com.donut.web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.donut.web.dao.ReviewDAO;
import com.donut.web.dto.ReviewDTO;
import com.donut.web.service.ReviewService;
@Service
public class ReviewServiceImpl implements ReviewService {
    
    @Autowired
    private ReviewDAO reviewDAO;
    @Override
    public ReviewDTO reviewRead(int projectNo) throws Exception {
        return reviewDAO.reviewRead(projectNo);
    }

    @Override
    public int reviewInsert(ReviewDTO reviewDTO) throws Exception {
        return reviewDAO.reviewInsert(reviewDTO);
    }

    @Override
    public ReviewDTO reviewSelectByNo(int projectNo) throws Exception {
        return reviewDAO.reviewSelectByNo(projectNo);
    }

    @Override
    public int reviewUpdate(ReviewDTO reviewDTO) throws Exception {
        return reviewDAO.reviewUpdate(reviewDTO);
    }

    @Override
    public int reviewDelete(int projectNo) throws Exception {
        return reviewDAO.reviewDelete(projectNo);
    }

    @Override
    public boolean reviewDuplicatedById(String id) throws Exception {
        return reviewDAO.reviewDuplicatedById(id);
    }

}
