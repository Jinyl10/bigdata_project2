package com.koreait.matjip.model.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.matjip.domain.Member;
import com.koreait.matjip.exception.MemberException;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List selectAll() {
		return memberDAO.selectAll();
	}

	@Override
	public Member select(Member member) throws MemberException{
		return memberDAO.select(member);
	}

	//join; MemberReview
	@Override
	public Member selectId(int member_id) {
		return null;
	}
	
	@Override
	public void insert(Member member)  throws MemberException{
		memberDAO.insert(member);
	}

	@Override
	public void update(Member member)  throws MemberException{
		memberDAO.update(member);
	}

	@Override
	public void delete(Member member)  throws MemberException{
		memberDAO.delete(member);
	}

	

}
