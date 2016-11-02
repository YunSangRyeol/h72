package com.project.h72.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.h72.cart.dao.CartDao;
import com.project.h72.cart.vo.Cart;

@Service
public class CartServiceImp implements CartService{
	@Autowired 
	private CartDao cDao;
	
	@Override
	public List<Cart> getCartList(String userid) throws Exception{
		return cDao.getCartList(userid);
	}

	@Override
	public int updateQuantity(String itemid, int quantity){
		return cDao.updateQuantity(itemid, quantity);
	}

	@Override
	public int deleteEmptyBasket(String userid) {
		return cDao.deleteEmptyBasket(userid);
	}

	@Override
	public int deleteBasketItem(String cartid) {
		return cDao.deleteBasketItem(cartid);
	}

	@Override
	public int deleteBasketChk(String[] cart) {
		// TODO Auto-generated method stub
		return cDao.deleteBasketChk(cart);
	}

}
