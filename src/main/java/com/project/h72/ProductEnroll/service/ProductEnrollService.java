package com.project.h72.ProductEnroll.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartRequest;

import com.project.h72.ProductEnroll.vo.Product;
import com.project.h72.ProductEnroll.vo.ProductItem;
import com.project.h72.ProductEnroll.vo.ProductProvider;


public interface ProductEnrollService {
	public List<ProductProvider> productProviderSelect();
	public int productEnrollCount(String categoryCode);	
	public int productEnrollInsert(Product product, HttpServletResponse respone, HttpServletRequest request, MultipartRequest multipartRequest) throws ServletException, IOException;
	public ProductItem itemSelect(String itemId);
	public int productEnrollUpdate(Product product, HttpServletRequest request) throws IOException;	
	

}