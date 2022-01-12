package com.koreait.matjip.model.jjim;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.matjip.domain.Jjim;
import com.koreait.matjip.exception.JjimException;

@Repository
public class MybatisJjimDAO implements JjimDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List selectAllByMember(int member_id) {
		return sessionTemplate.selectList("Jjim.selectAllByMember", member_id);
	}

	@Override
	public List selectAllByRestrt(int restrt_id) {
		return sessionTemplate.selectList("Jjim.selectAllByRestrt", restrt_id);
	}

	@Override
	public void insert(Jjim jjim) throws JjimException{
		int result = sessionTemplate.insert("Jjim.insert", jjim);
		if(result==0) {
			throw new JjimException("찜 등록 실패");
		}
	}

	@Override
	public void delete(int jjim_id) throws JjimException{
		int result = sessionTemplate.delete("Jjim.delete", jjim_id);
		if(result==0) {
			throw new JjimException("찜 삭제 실패");
		}
	}

}
