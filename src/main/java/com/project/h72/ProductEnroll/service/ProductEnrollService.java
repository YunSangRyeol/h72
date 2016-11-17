package com.project.h72.ProductEnroll.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.project.h72.ProductEnroll.vo.Product;
import com.project.h72.ProductEnroll.vo.ProductProvider;


public interface ProductEnrollService {
	public List<ProductProvider> productProviderSelect();
	public int productEnrollCount(String categoryCode);	
	public int productEnrollInsert(Product product, HttpServletRequest request) throws ServletException, IOException;	
	

}
