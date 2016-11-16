package com.project.h72.cart.service;

import java.util.List;

import com.project.h72.cart.vo.Cart;

public interface CartService {
	List<Cart> getCartList(String userid) throws Exception;

	int updateQuantity(String itemid, int quantity);

	int deleteBasketItem(String cartid);

	int deleteBasketChk(String[] cart);

	int updateCartUserId(String nonUserId, String userid);

	int deleteOverItem(String itemId, String nonUserId);
}
