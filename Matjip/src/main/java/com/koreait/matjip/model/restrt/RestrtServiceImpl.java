package com.koreait.matjip.model.restrt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.koreait.matjip.domain.Restrt;
import com.koreait.matjip.exception.RestrtException;

@Service
public class RestrtServiceImpl implements RestrtService{
	
	@Autowired
	@Qualifier("mybatisRestrtDAO")
	private RestrtDAO restrtDAO;

	@Override
	public List selectAll() {
		return restrtDAO.selectAll();
	}

	@Override
	public Restrt select(int restrt_id) {
		return restrtDAO.select(restrt_id);
	}

	@Override
	public void insert(Restrt restrt) throws RestrtException{
		restrtDAO.insert(restrt);
	}

	@Override
	public void update(Restrt restrt) throws RestrtException{
		restrtDAO.update(restrt);
	}

	@Override
	public void delete(int restrt_id) throws RestrtException{
		restrtDAO.delete(restrt_id);
	}

}
