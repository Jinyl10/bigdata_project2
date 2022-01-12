package com.koreait.matjip.model.jjim;

import java.util.List;

import com.koreait.matjip.domain.Jjim;

public interface JjimService {
	
	public List selectAllByMember(int member_id);
	public List selectAllByRestrt(int restrt_id);
	public void insert(Jjim jjim);
	public void delete(int jjim_id);

}
