package com.koreait.matjip.model.review;

import java.util.List;

import com.koreait.matjip.domain.Review;

// 하위의 모든 review 관련 DAO들의 최상위 인터페이스
public interface ReviewDAO {
	public List selectAll();	//listReview
	public Review select(int review_id);	//detailReview
	public void insert(Review review);		//writeReview
	public void update(Review review);
	public void delete(int review_id);
	
	//join
	public List selectAllByRestrt(int restrt_id);	//detailRestrt 에서 호출
	public List selectAllByMember(int member_id);	//myPage에서 호출
	

}
