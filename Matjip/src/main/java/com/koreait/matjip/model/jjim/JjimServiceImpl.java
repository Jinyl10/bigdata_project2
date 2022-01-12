package com.koreait.matjip.model.jjim;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.matjip.domain.Jjim;

@Service
public class JjimServiceImpl implements JjimService{
	
	@Autowired
	private JjimDAO jjimDAO;

	@Override
	public List selectAllByMember(int member_id) {
		return jjimDAO.selectAllByMember(member_id);
	}

	@Override
	public List selectAllByRestrt(int restrt_id) {
		return jjimDAO.selectAllByRestrt(restrt_id);
	}

	@Override
	public void insert(Jjim jjim) {
		jjimDAO.insert(jjim);
	}

	@Override
	public void delete(int jjim_id) {
		jjimDAO.delete(jjim_id);
	}

}
