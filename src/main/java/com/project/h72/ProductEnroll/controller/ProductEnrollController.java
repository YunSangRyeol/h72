package com.project.h72.ProductEnroll.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.h72.ProductEnroll.service.ProductEnrollService;
import com.project.h72.ProductEnroll.vo.Product;

@Controller
@RequestMapping("/productEnroll")
public class ProductEnrollController {
	@Autowired private ProductEnrollService productEnrollService;
	
	@RequestMapping(value = "/productEnrollView", method = RequestMethod.GET)
	public String productEnrollView(Locale locale, Model model) {
			
		return "admin/productEnroll";
	}
	
	@RequestMapping(value = "/productEnrollInsert", method = RequestMethod.POST)
	public String productEnrollInsert(@ModelAttribute @Valid Product product, HttpServletRequest request) throws ServletException, IOException {
		System.out.println("product : "+ product);
		int result = productEnrollService.productEnrollInsert(product, request);
		if(result > 0) {
			return "admin/productEnroll";
		} else {
			return "home";
		}
		
	}
	
	

}
