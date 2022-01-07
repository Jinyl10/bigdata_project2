package com.koreait.matjip.model.shop;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.matjip.domain.Shop;
import com.koreait.matjip.exception.ShopException;

@Repository
public class MybatisShopDAO implements ShopDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List selectAll() {
		return sessionTemplate.selectList("Shop.selectAll");
	}

	@Override
	public Shop select(int restrt_id) {
		return sessionTemplate.selectOne("Shop.select", restrt_id);
	}

	@Override
	public void insert(Shop shop) throws ShopException{
		int result=sessionTemplate.insert("Shop.insert", shop);
		if(result==0) {
			throw new ShopException("가게 등록 실패");
		}
	}

	@Override
	public void update(Shop shop) throws ShopException{
		int result=sessionTemplate.update("Shop.update", shop);
		if(result==0) {
			throw new ShopException("가게 수정 실패");
		}
	}
	
	@Override
	public void delete(int restrt_id) throws ShopException{
		int result=sessionTemplate.delete("Shop.delete", restrt_id);
		if(result==0) {
			throw new ShopException("가게 삭제 실패");
		}
	}
}







	
	

