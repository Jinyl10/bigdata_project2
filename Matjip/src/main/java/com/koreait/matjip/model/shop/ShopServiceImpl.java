package com.koreait.matjip.model.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.koreait.matjip.domain.Shop;
import com.koreait.matjip.exception.ShopException;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	@Qualifier("mybatisShopDAO")
	private ShopDAO shopDAO;

	@Override
	public List selectAll() {
		return shopDAO.selectAll();
	}

	@Override
	public Shop select(int restrt_id) {
		return shopDAO.select(restrt_id);
	}

	@Override
	public void insert(Shop shop) throws ShopException{
		shopDAO.insert(shop);
	}

	@Override
	public void update(Shop shop) throws ShopException{
		shopDAO.update(shop);
	}

	@Override
	public void delete(int restrt_id) throws ShopException{
		shopDAO.delete(restrt_id);
	}

}
