package com.koreait.matjip.model.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.matjip.domain.Review;
import com.koreait.matjip.exception.ReviewException;

@Repository
public class MybatisReviewDAO implements ReviewDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List selectAll() {
		return sessionTemplate.selectList("Review.selectAll");
	}

	@Override
	public Review select(int review_id) {
		return sessionTemplate.selectOne("Review.select", review_id);
	}

	@Override
	public void insert(Review review) throws ReviewException{	//예외처리
		int result = sessionTemplate.insert("Review.insert", review);
		
		if(result==0) {
			throw new ReviewException("리뷰 등록 실패");
		}
	}

	@Override
	public void update(Review review) throws ReviewException {
		int result = sessionTemplate.update("Review.update", review);
		
		if(result==0) {
			throw new ReviewException("리뷰 수정 실패");
		}
	}

	@Override
	public void delete(int review_id) throws ReviewException{
		int result = sessionTemplate.delete("Review.delete", review_id);
		
		if(result==0) {
			throw new ReviewException("리뷰 삭제 실패");
		}
	}

	@Override
	public List selectAllByRestrt(int restrt_id) {
		return sessionTemplate.selectList("Review.selectAllByRestrt", restrt_id);
	}

	@Override
	public List selectAllByMember(int member_id) {
		return sessionTemplate.selectList("Review.selectAllByMember", member_id);
	}

}
