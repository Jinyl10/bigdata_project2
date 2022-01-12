package com.koreait.matjip.model.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.koreait.matjip.domain.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	@Qualifier("mybatisReviewDAO")
	private ReviewDAO reviewDAO;

	@Override
	public List selectAll() {
		return reviewDAO.selectAll();
	}

	@Override
	public Review select(int review_id) {
		return reviewDAO.select(review_id);
	}

	@Override
	public void insert(Review review) {
		reviewDAO.insert(review);
	}

	@Override
	public void update(Review review) {
		reviewDAO.update(review);
	}

	@Override
	public void delete(int review_id) {
		reviewDAO.delete(review_id);
	}

	@Override
	public List selectAllByRestrt(int restrt_id) {
		return reviewDAO.selectAllByRestrt(restrt_id);
	}

	@Override
	public List selectAllByMember(int member_id) {
		return reviewDAO.selectAllByMember(member_id);
	}
	
	

}
