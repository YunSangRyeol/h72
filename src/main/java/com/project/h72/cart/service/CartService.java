package com.project.h72.cart.service;

import java.util.List;

import com.project.h72.cart.vo.Cart;

public interface CartService {
	List<Cart> getCartList(String userid) throws Exception;

	int updateQuantity(String itemid, int quantity);

	int deleteEmptyBasket(String userid);
}
