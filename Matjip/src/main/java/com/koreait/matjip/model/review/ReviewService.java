package com.koreait.matjip.model.review;

import java.util.List;

import com.koreait.matjip.domain.Review;

public interface ReviewService {
	public List selectAll();	//list
	public Review select(int review_id);	//detail
	public void insert(Review review);
	public void update(Review review);
	public void delete(int review_id);
	
	//join
	public List selectAllByRestrt(int restrt_id);	//detailRestrt 에서 호출
	public List selectAllByMember(int member_id);	//myPage에서 호출

}
