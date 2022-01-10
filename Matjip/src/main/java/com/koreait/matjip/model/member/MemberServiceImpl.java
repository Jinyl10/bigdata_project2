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
		return null;
	}

	@Override
	public Member select(Member member) throws MemberException{
		return memberDAO.select(member);
	}

	@Override
	public void insert(Member member)  throws MemberException{
		
	}

	@Override
	public void update(Member member)  throws MemberException{
		
	}

	@Override
	public void delete(Member member)  throws MemberException{
		
	}

}
