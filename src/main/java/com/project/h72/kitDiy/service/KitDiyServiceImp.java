package com.project.h72.kitDiy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.kitDiy.dao.KitDiyDao;
import com.project.h72.kitDiy.vo.Cart;
import com.project.h72.kitDiy.vo.KitDiy;
import com.project.h72.kitDiy.vo.Order;

@Service
public class KitDiyServiceImp implements KitDiyService{
	
	@Autowired
	private  KitDiyDao dao;
	
	@Override
	public List<KitDiy> itemAllViewSelect() {
		return dao.itemAllViewSelect();
	}

	@Override
	public List<KitDiy> itemDetailViewSelect() {
		return dao.itemDetailViewSelect();
	}


	@Override
	public int kitDiyCart(Cart cart) {
		return dao.kitDiyCart(cart);
	}

	@Override
	public int kitDiyCartCheck(Cart cart) {
		return dao.kitDiyCartCheck(cart);
	}

	@Override
	public Order kitDiyOrder(Order order) {
		return dao.kitDiyOrder(order);
	}



}
