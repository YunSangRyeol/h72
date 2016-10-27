package com.project.h72.ProductEnroll.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.project.h72.ProductEnroll.vo.Product;


public interface ProductEnrollService {
	public int productEnrollInsert(Product product, HttpServletRequest request) throws ServletException, IOException;	
	

}
