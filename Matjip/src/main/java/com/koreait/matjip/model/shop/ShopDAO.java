package com.koreait.matjip.model.shop;

import java.util.List;

import com.koreait.matjip.domain.Shop;

public interface ShopDAO{
	public List selectAll();						// 목록
	public Shop select(int restrt_id);		 // 한건조회
	public void insert(Shop shop);
	public void update(Shop shop);
	public void delete(int restrt_id);
}
