package com.project.h72.kitDiy.service;

import java.util.List;

import com.project.h72.kitDiy.vo.Cart;
import com.project.h72.kitDiy.vo.KitDiy;

public interface KitDiyService {

	public List<KitDiy> itemAllViewSelect();
	public List<KitDiy> itemDetailViewSelect();
	public int kitDiyCart(Cart cart);
	public int kitDiyCartCheck(Cart cart);

}
