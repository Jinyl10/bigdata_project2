package com.koreait.matjip.model.member;

import java.util.List;

import com.koreait.matjip.domain.Member;


public interface MemberService {
	public List selectAll();
	public Member select(Member member);
	public Member selectId(int member_id);
	public void insert(Member member);
	public void update(Member member);
	public void delete(Member member);
	

}
