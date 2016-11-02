package com.project.h72.order.service;

import java.util.List;

import com.project.h72.cart.vo.Cart;

public interface OrderService {

	List<Cart> getCartOrder(String[] cartAll);

}
