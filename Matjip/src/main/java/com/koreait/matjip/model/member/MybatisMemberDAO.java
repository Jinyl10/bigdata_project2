package com.koreait.matjip.model.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.matjip.domain.Member;
import com.koreait.matjip.exception.MemberException;

@Repository
public class MybatisMemberDAO implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List selectAll() {
		return sessionTemplate.selectList("Member.selectAll");
	}

	@Override
	public Member select(Member member) throws MemberException{
		Member result = sessionTemplate.selectOne("Member.select", member);
		if(result == null) {
			throw new MemberException("회원 정보가 올바르지 않습니다");
		}
		
		return result;
	}

	@Override
	public void insert(Member member) throws MemberException{
		int result = sessionTemplate.insert("Member.insert", member);
		if(result == 0) {
			throw new MemberException("회원이 등록되지 않았습니다.");
		}
		
	}

	@Override
	public void update(Member member) throws MemberException{
		int result = sessionTemplate.update("Member.update", member);
		if(result == 0) {
			throw new MemberException("회원 정보를 수정하지 못했습니다.");
		}
		
	}

	@Override
	public void delete(Member member) throws MemberException{
		int result = sessionTemplate.delete("Member.delete", member);
		if(result == 0) {
			throw new MemberException("회원 탈퇴에 실패했습니다.");
		}
		
	}
	

}
